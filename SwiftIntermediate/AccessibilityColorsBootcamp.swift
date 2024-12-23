//
//  AccessibilityColorsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 23.12.24.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    
    @Environment(\.accessibilityInvertColors) var accessibilityInvertColors
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text("Button 1")
            })
            .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
            .buttonStyle(.borderedProminent)
            
            Button(action: {}, label: {
                Text("Button 2")
            })
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
            Button(action: {}, label: {
                Text("Button 3")
            })
            .foregroundStyle(.white)
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Button(action: {}, label: {
                Text("Button 4")
            })
            .foregroundStyle(accessibilityDifferentiateWithoutColor ? .white :.green)
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(accessibilityDifferentiateWithoutColor ? .black : .purple)
        }
        .font(.largeTitle)
//        .navigationTitle("Hi")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
