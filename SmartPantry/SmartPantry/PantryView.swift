//
//  PantryView.swift
//  SmartPantry
//
//  Created by Long Lam on 3/5/24.
//

import SwiftUI

struct PantryView: View {
    let itemList = [PantryItemModel(id: "1", itemTitle: "Apple", loggedDate: "05/01/2024", quantity: "3"), PantryItemModel(id: "2", itemTitle: "Apple", loggedDate: "05/01/2024", quantity: "3"), PantryItemModel(id: "3", itemTitle: "Apple", loggedDate: "05/01/2024", quantity: "3")]
    var body: some View {
        VStack(spacing: 0) {
            TitleBar()

            ScrollView {
                PantrySection(itemList: itemList, sectionTitle: REFRIGERATOR_SECTION_TITLE)
            }
            .frame(maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
            .background(Color(white: 0.95))
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.white))
    }
}

#Preview {
    PantryView()
}
