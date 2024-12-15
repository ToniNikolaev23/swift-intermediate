//
//  MultipleSheetsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 15.12.24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    @State var selectedModel: RandomModel? = nil

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                selectedModel = RandomModel(title: "ONE")
            }, label: {
                Text("Button 1")
            })
            
            Button(action: {
                selectedModel = RandomModel(title: "TWO")
            }, label: {
                Text("Button 2")
            })
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }

    }
}

struct NextScreen: View {
    
//    @Binding var selectedModel: RandomModel

    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title).font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
