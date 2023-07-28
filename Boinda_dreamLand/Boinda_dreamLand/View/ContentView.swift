//
//  ContentView.swift
//  Boinda_dreamLand
//
//  Created by 최진용 on 2023/07/28.
//

import SwiftUI

struct ContentView: View {
    let cameraVM = CameraViewModel()
    @StateObject var resultManager = ResultManager.shared
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink {
                        SettingView()
                    } label: {
                        Image("menu")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    .accessibilityLabel("설정")
                }.padding()
                ZStack {
                    ViewRepresenter()
                        .accessibilityHidden(true)
                    Frame().environmentObject(resultManager)
                        .accessibilityHidden(true)
                    Text("\(resultManager.resultObjectName)")
                        .font(.system(size: 40))
                        .accessibilityHint("햅틱이 느껴지면 두번 탭하세요")
                }
                Spacer()
            }
        }
    }
}

struct ViewRepresenter: UIViewRepresentable {
    @StateObject var vc = CameraViewModel()
    
    func makeUIView(context: Context) -> some UIView {
        return vc.view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}


