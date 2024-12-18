//
//  RotationGestureBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 15.12.24.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    @State var angle: Angle = Angle(degrees: 0)    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged {value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
