//
//  TypealiasBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 17.12.24.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emilly", count: 20)
    
    var body: some View {
        Text(item.title)
        Text(item.director)
        Text("\(item.count)")
    }
}

#Preview {
    TypealiasBootcamp()
}
