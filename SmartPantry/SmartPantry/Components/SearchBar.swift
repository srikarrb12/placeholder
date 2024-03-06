//
//  SearchBar.swift
//  SmartPantry
//
//  Created by Long Lam on 3/6/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{}
            .searchable(text: $searchText)
            .frame(maxHeight: 90)
    }
}

#Preview {
    SearchBar()
}
