//
//  AlignmentGuideBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 23.12.24.
//

import SwiftUI

struct AlignmentGuideBootcamp: View {
    var body: some View {
//        VStack(alignment: .leading, spacing: 0.0) {
//            Text("Hello world")
//                .background(Color.blue)
//                .alignmentGuide(.leading, computeValue: { dimensions in
//                    return dimensions.width * 0.5
//                })
//            
//            Text("This is some other text!")
//                .background(Color.red)
//        }
//        .background(Color.orange)
        
        AlignmentChildView()
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "ROW 1", showIcon: true)
            row(title: "ROW 2", showIcon: false)
            row(title: "ROW 3", showIcon: true)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
            
            Spacer()
        }
        .alignmentGuide(.leading, computeValue: { dimension in
            return showIcon ? 40 : 0
        })
    }
}

#Preview {
    AlignmentGuideBootcamp()
}
