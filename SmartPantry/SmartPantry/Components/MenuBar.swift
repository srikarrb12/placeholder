//
//  MenuBar.swift
//  SmartPantry
//
//  Created by Long Lam on 3/5/24.
//

import SwiftUI

struct MenuBar: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .frame(maxHeight: 40)
                .foregroundColor(.red)
            Button {
                
            } label: {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding(15)
                    .background(Color(.red))
            }
            .cornerRadius(50)
        }.frame(maxHeight: 70)
    }
}

#Preview {
    MenuBar()
}
