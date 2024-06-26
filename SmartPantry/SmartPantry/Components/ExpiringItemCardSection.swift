//
//  CardView.swift
//  SmartPantry
//
//  Created by Tuan Cai on 3/28/24.
//

import SwiftUI



struct ExpiringItemCardSection: View {
    @EnvironmentObject var pantryItemManager: PantryItemManager
    
    var body: some View {
        let items: [PantryItemModel] = pantryItemManager.getExpiringItem()
        VStack(spacing: 0) {
            TabView {
                ForEach(items) { item in
                    ExpiringItemCardStyle(title: item.itemTitle, expirationDate: item.expiredDate)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                }
            }
            .accentColor(Color("Green"))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .background(Color(white: 0.95))
        .frame(maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.white))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ExpiringItemCardSection().environmentObject(PantryItemManager())
    }
}

