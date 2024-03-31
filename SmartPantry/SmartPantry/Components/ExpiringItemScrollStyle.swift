//
//  ExpiringItemScrollStyle.swift
//  SmartPantry
//
//  Created by Long Lam on 3/31/24.
//

import SwiftUI

struct ExpiringItemScrollStyle: View {
    var title: String
    var expirationDate: Date
    func dateString(from date: Date, format: String = "yyyy-MM-dd") -> String {
        return DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .none)
    }

    func getFoodImage(urlString: String) -> UIImage {
        let image: UIImage
        do {
            let url = URL(string: urlString)
            let data = try Data(contentsOf: url!)
            image = UIImage(data: data)!
        } catch {
            image = UIImage(systemName: "error loading")!
        }
        return image
        
    }
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                VStack {
                    Image(uiImage: getFoodImage(urlString: "https://spoonacular.com/cdn/ingredients_100x100/apple.jpg"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                }
                .background(Color(white: 0.95)).clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)
                .frame(maxHeight: 90)

                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    Text(dateString(from: expirationDate))
                        .fontWeight(.thin)
                        .font(.footnote)
                        .foregroundColor(.black)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding([.trailing, .leading], 10)
        .frame(maxWidth: 400)
        .cornerRadius(3.0)
        .background(Color(.white)).clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ExpiringItemScrollStyle(title: "Title", expirationDate: Date.now)
        .previewLayout(.sizeThatFits)
        .padding()
}
