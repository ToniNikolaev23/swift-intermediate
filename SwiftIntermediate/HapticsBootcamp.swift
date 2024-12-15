//
//  HapticsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 15.12.24.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager() //Singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style )
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                HapticManager.instance.notification(type: .success)
              
            }, label: {
                Text("Success")
            })
            
            Button(action: {
                HapticManager.instance.notification(type: .warning)
               
            }, label: {
                Text("Warning")
            })
            
            Button(action: {
                HapticManager.instance.notification(type: .error)
            }, label: {
                Text("Error")
            })
            Divider()
            
            Button(action: {
                HapticManager.instance.impact(style: .soft)
            }, label: {
                Text("Soft")
            })
            Button(action: {
                HapticManager.instance.impact(style: .medium)
            }, label: {
                Text("Medium")
            })
            Button(action: {
                HapticManager.instance.impact(style: .light)
            }, label: {
                Text("Light")
            })
            Button(action: {
                HapticManager.instance.impact(style: .heavy)
            }, label: {
                Text("Heavy")
            })
            Button(action: {
                HapticManager.instance.impact(style: .rigid)
            }, label: {
                Text("Rigid")
            })
        }
    }
}

#Preview {
    HapticsBootcamp()
}
