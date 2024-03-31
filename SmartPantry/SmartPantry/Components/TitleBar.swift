//
//  TitleBar.swift
//  SmartPantry
//
//  Created by Long Lam on 3/6/24.
//

import SwiftUI

struct TitleBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            VStack(alignment: .leading) {
                Text("Welcome to")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text("Smart Pantry")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Green"))
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, maxHeight: 60, alignment: .leading)
            .padding([.bottom, .top], 10)
            .padding(.leading, 20)

            Image(systemName: "gearshape")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 25)
                .foregroundColor(.black)
                .padding([.bottom, .top], 10)
                .padding(.leading, 20)
                .font(Font.system(size: 60, weight: .semibold))

            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 23)
                .foregroundColor(.black)
                .padding([.bottom, .top], 10)
                .padding(.trailing, 20)
                .font(Font.system(size: 60, weight: .semibold))
        }
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(15)
        .shadow(radius: 3)
        .padding([.leading, .trailing], 15.0)
        .padding([.bottom, .top], 5)
    }
}

#Preview {
    TitleBar()
}
