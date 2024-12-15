//
//  ScrollViewReaderBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 15.12.24.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    var body: some View {
        VStack {
            
            TextField(text: $textFieldText) {
                Text("Enter a # here")
            }
            .frame(height: 55)
            .border(Color.gray)
            .padding(.horizontal)
            .keyboardType(.numberPad)
            
            Button(action: {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            
            }, label: {
                Text("Scroll now")
            })
            
            ScrollView {
                ScrollViewReader { proxy in
                    
                   
                    
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
//                    .onChange(of: scrollToIndex) { value in
//                        withAnimation(.spring()) {
//                            proxy.scrollTo(value, anchor: .center)
//                        }
//                    }
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
               
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
