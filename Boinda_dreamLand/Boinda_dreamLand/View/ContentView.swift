//
//  ContentView.swift
//  Boinda_dreamLand
//
//  Created by 최진용 on 2023/07/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("\(ViewController.string[0])")
            ViewRepresenter()
        }
        .ignoresSafeArea()
    }
}

struct ViewRepresenter: UIViewRepresentable {
    @StateObject var vc: ViewController = ViewController()
    
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
