//
//  ViewController.swift
//  Boinda_dreamLand
//
//  Created by 송재훈 on 2023/07/28.
//

import UIKit
import AVKit
import Vision

class CameraViewModel: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {
    private var permissionGranted = false
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    let resultManager = ResultManager.shared
    var count = 0
    var objectIdentifier = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        checkPermission()
        sessionQueue.async {
            [unowned self] in
                guard permissionGranted else { return }
                self.startCamera()
        }
        
    }
    
    func configObject() {
        if count > 7 {
            DispatchQueue.main.async {
                self.resultManager.resultObjectName = self.objectIdentifier
                self.count = 0
                HapticManager.shared.notification(type: .success)
//                self.resultManager.isDetecting = false
            }
        }
    }
    
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        guard let model = try? VNCoreMLModel(for: coca(configuration: MLModelConfiguration()).model) else {return}
        let request = VNCoreMLRequest(model: model) { (res, error) in
            guard let results = res.results as? [VNClassificationObservation] else { return }
            guard let observationData = results.first else { return }
            if observationData.confidence > 0.9975, observationData.identifier == self.objectIdentifier {
                self.count += 1
                self.objectIdentifier = observationData.identifier
                self.configObject()
            } else {
                self.objectIdentifier = observationData.identifier
            }
            
            print(observationData.identifier, observationData.confidence)
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixBuffer, options: [:]).perform([request])
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            // Permission has been granted before
            case .authorized:
                permissionGranted = true
                
            // Permission has not been requested yet
            case .notDetermined:
                requestPermission()
                    
            default:
                permissionGranted = false
            }
    }
    
    func requestPermission() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
            self.sessionQueue.resume()
        }
    }
    
    @MainActor
    func startCamera() {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        DispatchQueue.main.async {
            self.view.layer.addSublayer(previewLayer)
            previewLayer.frame = self.view.frame
            
        }
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        captureSession.startRunning()
    }

//MARK: - UI
    private func configUI() {
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    
}
