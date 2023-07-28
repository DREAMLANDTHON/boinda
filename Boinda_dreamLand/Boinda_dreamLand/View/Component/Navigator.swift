//
//  Navigator.swift
//  Boinda_dreamLand
//
//  Created by 송재훈 on 2023/07/29.
//

import SwiftUI


struct Navigator: View {
    /**
     Navigator()
         .frame(maxHeight: .infinity, alignment: .top)
     */
    
    var body: some View {
        HStack() { // MARK: - Navigator
            Spacer()
            Image(systemName: "gearshape.fill")
                .padding(.trailing)
        }
        .padding()
        .background(Color("NavigatorFill"))
        //: - Navigator
    }
}
