//
//  FileManagerBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 22.12.24.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder")
            } catch let error {
                print("Error creating folder \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch let error {
            print("Error removing folder")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name) else {
         
            return "Error getting data."
        }

        do {
            try data.write(to: path)
            print(path)
            return "Success saving!"
        } catch let error {
            return "Error saving \(error)"
        }
       
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting path"
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted"
        } catch let error {
            return "Error deleting image \(error)"
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpg") else {
            print("Error getting path")
            return nil
        }
        
        return path
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "batman"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
//        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                    .cornerRadius(10)
                }
                
                HStack {
                    Button(action: {
                        vm.saveImage()
                    }, label: {
                        Text("Save to FM")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        vm.deleteImage()
                    }, label: {
                        Text("Delete image")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .cornerRadius(10)
                    })
                }
                
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                
                
                Spacer()
            }
            .navigationTitle("File manager")
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
