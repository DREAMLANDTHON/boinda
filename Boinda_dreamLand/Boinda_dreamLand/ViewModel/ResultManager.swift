//
//  ResultManager.swift
//  Boinda_dreamLand
//
//  Created by 최진용 on 2023/07/28.
//

import SwiftUI


//hashmap
class ResultManager: ObservableObject {

    

    static let shared = ResultManager()
    private init() {}
    @Published var resultObjectName: String = "탐지된 음식"
    @Published var isDetecting = true
}


