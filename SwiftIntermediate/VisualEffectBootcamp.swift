//
//  VisualEffectBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 23.12.24.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    @State private var showSpacer: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .visualEffect { content, geometryProxy in
                            content
                                .offset(x: geometryProxy.frame(in: .global).minY * 0.05)
                        }
                }
            }
        }
        
//        VStack {
//            Text("Hello, World!")
//                .padding()
//                .background(Color.red)
//                .visualEffect { content, geometryProxy in
//                    content
//                        .grayscale(geometryProxy.frame(in: .global).minY < 300 ? 1 : 0)
//    //                    .grayscale(geometryProxy.size.width >= 200 ? 1 : 0)
//            }
//            
//            
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.easeIn, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
    }
}

#Preview {
    VisualEffectBootcamp()
}
