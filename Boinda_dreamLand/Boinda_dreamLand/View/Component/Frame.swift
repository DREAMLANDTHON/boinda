//
//  Frame.swift
//  Boinda_dreamLand
//
//  Created by 송재훈 on 2023/07/29.
//

import SwiftUI

struct Frame: View {
    /**
     Frame(isDetecting: $isDetecting)
     */
    
    @EnvironmentObject var resultManager: ResultManager
    
    var body: some View {
        ZStack {
            Image("FrameImage")
                .resizable()
                .frame(width: CGSize.deviceWidth * 0.5, height:  CGSize.deviceWidth * 0.5)
//                .onTapGesture {
////                    resultManager.isDetecting = true
//                    HapticManager.shared.notification(type: .success)
//                    print("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡtap!")
//                }
//                .disabled(true)
                .accessibilityHidden(true)
        }
    }
}

