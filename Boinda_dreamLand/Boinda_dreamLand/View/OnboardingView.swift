//
//  OnboardingView.swift
//  Boinda_dreamLand
//
//  Created by 송재훈 on 2023/07/29.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboarindViewActive: Bool = false
    @State var page: Bool = false
    
    var body: some View {
        ZStack {
            Color.BG
                .ignoresSafeArea()
            
            if page {
                onboarding2
            }
            else {
                onboarding1
            }
        }
    }
    
    var onboarding1: some View {
        VStack {
            Text("튜토리얼")
                .font(Font.custom("Pretendard Variable", size: 20).weight(.semibold))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("1/2")
                .font(Font.custom("Pretendard Variable", size: 22).weight(.bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding()
            
            Text("식품을 카메라에 비추고\n정보를 얻어보세요")
                .font(Font.custom("Pretendard Variable", size: 26).weight(.semibold))
                .multilineTextAlignment(.center)
                .padding()
            
            Image("onboardingFrame1")
                .frame(width: 251, height: 251)
                .padding()
            
            Spacer()
            
            Text("카메라 화면을 두 번 탭해서 식품 정보를 확인할 수 있습니다.")
                .font(Font.custom("Pretendard Variable", size: 20).weight(.medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray4)
                .frame(width: 303, alignment: .top)
                .padding()
                .padding()
            
            Spacer()
            
            HStack(alignment: .center, spacing: 10) {
                Text("다음")
                    .font(Font.custom("Pretendard Variable", size: 22).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.grayWhite)
            }
            .padding(10)
            .background(Color.primary)
            .frame(width: 361, height: 62, alignment: .center)
            .background(Color.primary)
            .cornerRadius(10)
            .onTapGesture {
                page = true
            }
        }
    }
    
    var onboarding2: some View {
        VStack {
            Text("튜토리얼")
                .font(Font.custom("Pretendard Variable", size: 20).weight(.semibold))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("2/2")
                .font(Font.custom("Pretendard Variable", size: 22).weight(.bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding()
            
            Text("더 알고 싶은 정보를\n추가해보세요")
                .font(Font.custom("Pretendard Variable", size: 26).weight(.semibold))
                .multilineTextAlignment(.center)
                .padding()
            
            Image("onboardingFrame2")
                .frame(width: 251, height: 251)
                .padding()
            
            Spacer()
            
            Text("카메라 화면을 두 번 탭해서 식품 정보를 확인할 수 있습니다.")
                .font(Font.custom("Pretendard Variable", size: 20).weight(.medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray4)
                .frame(width: 303, alignment: .top)
                .padding()
                .padding()
            
            Spacer()
            
            HStack(alignment: .center, spacing: 10) {
                Text("다음")
                    .font(Font.custom("Pretendard Variable", size: 22).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.grayWhite)
            }
            .padding(10)
            .background(Color.primary)
            .frame(width: 361, height: 62, alignment: .center)
            .background(Color.primary)
            .cornerRadius(10)
            .onTapGesture {
                isOnboarindViewActive = false
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
