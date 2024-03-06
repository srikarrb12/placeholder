//
//  MenuBar.swift
//  SmartPantry
//
//  Created by Long Lam on 3/5/24.
//

import SwiftUI

struct MenuBar: View {
    var body: some View {
        ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 90)
                .foregroundColor(.white)
            HStack(spacing: 60) {
                VStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                    Image(systemName: "house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 30)
                    Text("Home")
                })
                .foregroundColor(.black)

                VStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                    Image(systemName: "camera")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 30)
                    Text("Scan")
                })
                .foregroundColor(.black)

                VStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 30)
                    Text("Profile")
                })
                .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    MenuBar()
}
