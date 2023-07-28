//
//  ContentView.swift
//  Boinda_dreamLand
//
//  Created by 최진용 on 2023/07/28.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboarindViewActive: Bool = true
    
    var body: some View {
       OnboardingView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
