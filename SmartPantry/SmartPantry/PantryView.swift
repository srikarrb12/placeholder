//
//  PantryView.swift
//  SmartPantry
//
//  Created by Long Lam on 3/5/24.
//

import SwiftUI

struct PantryView: View {
    var body: some View {
        VStack (spacing: 0){
            VStack(spacing: 15) {
                PantryItem(itemTitle: "Apple Pia", loggedDate: "4 day(s) ago", quantity: "3")
                PantryItem(itemTitle: "Apple", loggedDate: "1 day(s) ago", quantity: "3")
                PantryItem(itemTitle: "Apple", loggedDate: "5 day(s) ago", quantity: "3")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.92))
            
            MenuBar() .background(Color(white: 0.92))
        }
    }
}

#Preview {
    PantryView()
}
