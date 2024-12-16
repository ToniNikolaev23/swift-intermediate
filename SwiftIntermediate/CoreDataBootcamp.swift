//
//  CoreDataBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 16.12.24.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
        }
        
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func saveData() {
        do {
           try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving \(error)")
        }
    }
}

struct CoreDataBootcamp: View {
    @State var textFieldText: String = ""
    @StateObject var vm = CoreDataViewModel()
 
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruit here", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    guard !textFieldText.isEmpty else {return}
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Add item")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .padding(.horizontal)
                
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No name")
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataBootcamp()
}
