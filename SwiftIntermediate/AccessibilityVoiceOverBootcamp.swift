//
//  AccessibilityVoiceOverBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 23.12.24.
//

import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        
                        Text(isActive ? "ON" : "OFF")
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityHint("Double tap to toggle setting.")
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                } header: {
                    Text("PREFERENCES")
                }

                Section {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Favorites")
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "heart.fill")
                    })
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }
                } header: {
                    Text("APPLICATION")
                }

                VStack {
                    Text("CONTENT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image("batman")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    
                                    Text("Item \(x)")
                                }
                                .onTapGesture {
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
