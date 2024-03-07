//
//  PantryView.swift
//  SmartPantry
//
//  Created by Long Lam on 3/5/24.
//

import SwiftUI

struct PantryView: View {
    @EnvironmentObject var pantryItemManager: PantryItemManager
    
    var body: some View {
        VStack(spacing: 0) {
            TitleBar()

            ScrollView {
                PantrySection(itemList: pantryItemManager.pantries, sectionTitle: REFRIGERATOR_SECTION_TITLE)
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
