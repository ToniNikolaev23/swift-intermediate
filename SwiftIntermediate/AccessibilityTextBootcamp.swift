//
//  AccessibilityTextBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 23.12.24.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    @Environment(\.sizeCategory) var sizeCategory
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20))
                                Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                    }
//                    .frame(height: 100)
                    .background(.red)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hello World!")
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}

extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
        case .large, .extraLarge, .extraExtraLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}
