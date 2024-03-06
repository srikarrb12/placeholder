//
//  PantryItem.swift
//  SmartPantry
//
//  Created by Long Lam on 3/5/24.
//

import SwiftUI

struct PantryItem: View {
    var itemTitle: String
    var loggedDate: String
    var quantity: String
    var body: some View {
        HStack(alignment: .center, spacing: 120) {
            HStack {
                VStack {
                    Image(systemName: "refrigerator")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                        .padding(10)
                }
                .background(Color(white: 0.95)).clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)
                .frame(maxHeight: 80)

                VStack(alignment: .leading, spacing: 5) {
                    Text(itemTitle)
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    Text(loggedDate)
                        .fontWeight(.thin)
                        .font(.body)
                        .foregroundColor(.black)
                }.frame(maxWidth: 120)
            }

            Text(quantity + "pc")
                .foregroundColor(.black)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(10)
        }
        .frame(minWidth: 360)
        .cornerRadius(3.0)
        .background(Color(.white)).clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    PantryItem(itemTitle: "Apple", loggedDate: "05/01/2024", quantity: "3")
}
