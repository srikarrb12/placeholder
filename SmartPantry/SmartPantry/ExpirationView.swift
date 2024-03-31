//
//  ExpirationView.swift
//  SmartPantry
//
//  Created by Long Lam on 3/27/24.
//

import SwiftUI

struct ExpirationView: View {
    @State private var isCardViewDisplayed = true
    var body: some View {
        VStack {
            TitleBar()
            if isCardViewDisplayed {
                ExpiringItemCardSection()
            } else {
                ExpiringItemScrollSection()
            }

            Button(action: {
                isCardViewDisplayed.toggle()
            }) {
                Text(isCardViewDisplayed ? "Show Scroll" : "Show Card")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .background(Color(white: 0.95))
    }
}

struct ExpirationView_Previews: PreviewProvider {
    static var previews: some View {
        ExpirationView()
            .environmentObject(PantryItemManager())
    }
}
