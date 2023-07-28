//
//  ViewController.swift
//  ML Sample
//
//  Created by Ramprasath Selvam on 19/12/19.
//  Copyright © 2019 Ramprasath Selvam. All rights reserved.
//
// Reach Me ⬇︎
// Instagram - ramprasathselvam
// LinkedIn - ramprasathselvam
// FaceBook - ramprasathselvam
// Twitter - @ramprasath7797
// YouTube - https://www.youtube.com/channel/UCvCyA7vZwJI87YPFJFe2ypg/

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    private var permissionGranted = false
    private let sessionQueue = DispatchQueue(label: "sessionQueue")

    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission()
        
        sessionQueue.async { [unowned self] in
            guard permissionGranted else { return }
            self.startCamera()
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        guard let model = try? VNCoreMLModel(for: Dream().model) else { return }
        let request = VNCoreMLRequest(model: model) { (res, error) in
            guard let results = res.results as? [VNClassificationObservation] else { return }
            guard let observationData = results.first else { return }
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
        }
        previewLayer.frame = self.view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        captureSession.startRunning()
    }
    
}
