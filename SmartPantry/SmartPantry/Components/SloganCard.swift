//
//  SloganCard.swift
//  SmartPantry
//
//  Created by Long Lam on 3/28/24.
//

import SwiftUI

struct SloganCard: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            HStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Bulk Smart, Don't Fall Apart")
                        .foregroundColor(.white)
                        .font(.footnote)
                    Text("Get organized for a happy heart!")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.leading, 140)
            }
            .frame(maxWidth: .infinity, maxHeight: 130)
            .background(Color("Green"))
            .cornerRadius(20)
            Image("SloganImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 120)
                .padding(.leading, 10)
        }
        .padding([.leading, .trailing], 15)
    }
}

#Preview {
    SloganCard()
}
