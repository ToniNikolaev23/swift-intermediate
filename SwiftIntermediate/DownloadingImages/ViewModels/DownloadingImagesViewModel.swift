//
//  DownloadingImagesViewModel.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 23.12.24.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink {[weak self] (returnedPhotoModel) in
                self?.dataArray = returnedPhotoModel
            }
            .store(in: &cancellables)
    }
}
