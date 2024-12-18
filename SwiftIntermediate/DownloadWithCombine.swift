//
//  DownloadWithCombine.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 18.12.24.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        /*
         Combine:
         // 1. sign up for monthly subscriptions for package to be delivered
         // 2. the company would make the package behind the scene
         // 3. receive the package at your front door
         // 4. make sure the box isn't damaged
         // 5. open and make sure the item is correct
         // 6. use the item
         // 7. Cancellable at any time
         
         //1. Create a Publisher
         //2. Subscribe Publisher on background thread
         //3. Receive on main thread
         //4. tryMap (check that the data is good)
         //5. Decode (decode data into PostModels)
         //6. Sink (put the item into app)
         //7. store (cancel subscription if needed)
         */
     
        
        //DataTaskPublisher goes to background thread default
        
        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: {[weak self] (returnedPosts) in
                self?.posts = returnedPosts
            })
//            .sink { (completion) in
//                switch completion {
//                case .finished:
//                    print("Finished")
//                case .failure(let error):
//                    print("There was and arror: \(error)")
//                }
//            } receiveValue: {[weak self] (returnedPosts) in
//                self?.posts = returnedPosts
//            }
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
               response.statusCode >= 200 && response.statusCode < 300 else {
             throw URLError(.badServerResponse)
         }
        return output.data
    }
}

struct DownloadWithCombine: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
