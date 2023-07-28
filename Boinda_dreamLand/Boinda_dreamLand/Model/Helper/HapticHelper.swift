//
//  HapticHelper.swift
//  Boinda_dreamLand
//
//  Created by 최진용 on 2023/07/29.
//

import SwiftUI

class HapticManager {
    static let shared = HapticManager()
    private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
