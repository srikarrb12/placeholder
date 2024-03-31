//
//  FeaturedItemView.swift
//  SmartPantry
//
//  Created by Tuan Cai on 3/28/24.
//

import SwiftUI

struct ExpiringItemCardStyle: View {
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
        VStack(spacing: 8) {
            Image(uiImage: getFoodImage(urlString: "https://spoonacular.com/cdn/ingredients_100x100/apple.jpg"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Spacer()

            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            Text(dateString(from: expirationDate))
                .font(.subheadline)
                .foregroundColor(.black)
            Spacer()
        }
        .padding()
        .frame(width: 330, height: 400)
        .background(Color(.white))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


#Preview {
    ExpiringItemCardStyle(title: "Title", expirationDate: Date.now)
        .previewLayout(.sizeThatFits)
        .padding()
}
