//
//  EscapingClosuresBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 17.12.24.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 {[weak self] returnedResult in
            self?.text = returnedResult.data
        }
//        downloadData3 { [weak self] returnedData in
//            self?.text = returnedData
//        }
        
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        
        completionHandler("New data !")
       
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data !")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data")

            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data")

            completionHandler(result)
        }
    }

}

typealias DownloadCompletion = (DownloadResult) -> Void

struct DownloadResult {
    let data: String
}


struct EscapingClosuresBootcamp: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingClosuresBootcamp()
}
