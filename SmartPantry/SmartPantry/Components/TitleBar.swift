//
//  TitleBar.swift
//  SmartPantry
//
//  Created by Long Lam on 3/6/24.
//

import SwiftUI

struct TitleBar: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("SmartPantry")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding([.bottom, .top], 10)
                .padding(.leading, 20)

            HStack(spacing: 20) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 23)
                    .foregroundColor(.white)

                Image(systemName: "gearshape")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 25)
                    .foregroundColor(.white)
            }
            .padding([.bottom, .top], 10)
            .padding(.trailing, 20)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.red))
    }
}

#Preview {
    TitleBar()
}
