//
//  CardView.swift
//  SmartPantry
//
//  Created by Tuan Cai on 3/28/24.
//

import SwiftUI



struct CardView: View {
    @EnvironmentObject var pantryItemManager: PantryItemManager
    
    var body: some View {
        let items: [PantryItemModel] = pantryItemManager.getExpired()
        VStack(spacing: 0) {
            TitleBar()
            TabView {
                ForEach(items) { item in
                    FeaturedItemView(title: item.itemTitle, expirationDate: item.expiredDate)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.white))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().environmentObject(PantryItemManager())
    }
}

