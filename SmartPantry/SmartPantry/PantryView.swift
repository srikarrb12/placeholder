//
//  PantryView.swift
//  SmartPantry
//
//  Created by Long Lam on 3/5/24.
//

import SwiftUI

struct PantryView: View {
    @State private var text = ""
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 120) {
                Text("SmartPantry")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                HStack(spacing: 25) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 23)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 18)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color(.red))

            VStack(spacing: 15) {
                PantryItem(itemTitle: "Apple Pia", loggedDate: "4 day(s) ago", quantity: "3")
                PantryItem(itemTitle: "Apple", loggedDate: "1 day(s) ago", quantity: "3")
                PantryItem(itemTitle: "Apple", loggedDate: "5 day(s) ago", quantity: "3")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(white: 0.92))
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PantryView()
}
