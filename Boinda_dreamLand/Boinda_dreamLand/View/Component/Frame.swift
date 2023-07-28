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
    
    @Binding var isDetecting: Bool
    
    var body: some View {
        Image(isDetecting ? "onFrame" : "offFrame")
            .animation(.linear, value: isDetecting)
    }
}

