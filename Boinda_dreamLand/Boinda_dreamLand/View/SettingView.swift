//
//  SettingView.swift
//  Boinda_dreamLand
//

//  Created by 송재훈 on 2023/07/29.
//

import SwiftUI

struct SettingView: View {

    let addedInfos: [String] = ["품목 유형", "총 내용량", "알레르기 성분", "비건 인증", "할랄 인증"]
    @State var addedInfosToggle: [Bool] = [false, false, false, false, false]
    
    @State var displayAccessibility: Bool = false
    
    @State var allergy: Bool = false

    let allergyList: [String] = ["메밀", "밀", "대두", "견과류", "육류", "갑각류", "복숭아", "토마토", "난류", "우유", "조개류", "굴, 전복", "아황산류", "달걀", "닭고기"]
    let allergyGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    
    @State var allergyListToggle: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    var body: some View {
        List {
            Section("부가 정보 표시") {
                ForEach(Array(addedInfos.enumerated()), id: \.offset) { idx, info in
                    Toggle(isOn: $addedInfosToggle[idx]) {
                        Text(info)
                    }
                }
            }
            Section("디스플레이 접근성") {
                Toggle(isOn: $displayAccessibility) {
                    Text("흔들림 보정")
                }
            }
            Section("건강 정보 등록") {
                Toggle(isOn: $allergy) {
                    Text("알레르기 필터")
                }

                if allergy {
                    LazyVGrid(columns: allergyGrid, alignment: .leading, spacing: 2) {
                        ForEach(0..<allergyList.count) { idx in
                            Text(allergyList[idx])
                                .font(.system(size: 12))
                                .foregroundColor(allergyListToggle[idx] ? Color.BG : Color.off)
                                .padding(6)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(allergyListToggle[idx] ? Color.primary : Color.clear)
                                }
                                .onTapGesture {
                                    allergyListToggle[idx].toggle()
                                }
                        }
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
