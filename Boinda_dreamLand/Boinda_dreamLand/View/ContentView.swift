//
//  ContentView.swift
//  Boinda_dreamLand
//
//  Created by 최진용 on 2023/07/28.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboarindViewActive: Bool = true
    let cameraVM = CameraViewModel()
    @StateObject var resultManager = ResultManager.shared
    
    
    var body: some View {
        if isOnboarindViewActive {
            OnboardingView()
        }
        else {
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
                            .foregroundColor(Color.GB)
                            .accessibilityHint("햅틱이 느껴지면 두번 탭하세요")
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.BG)
                            }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    }
                    Spacer()
                }
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


