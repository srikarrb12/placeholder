//
//  ExpiringItemScrollSection.swift
//  SmartPantry
//
//  Created by Long Lam on 3/31/24.
//

import SwiftUI

struct ExpiringItemScrollSection: View {
    @EnvironmentObject var pantryItemManager: PantryItemManager
    
    var body: some View {
        let items: [PantryItemModel] = pantryItemManager.getExpiringItem()
        VStack(spacing: 0) {
            ForEach(items) { item in
                ExpiringItemScrollStyle(title: item.itemTitle, expirationDate: item.expiredDate)
                    .padding(.bottom, 10)
            }
        }
        .background(Color(white: 0.95))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.bottom, 10)
    }
}

#Preview {
    ExpiringItemScrollSection().environmentObject(PantryItemManager())
}
