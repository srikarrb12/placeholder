//
//  PantryItemModel.swift
//  SmartPantry
//
//  Created by Long Lam on 3/6/24.
//

import Foundation

struct PantryItemModel: Identifiable {
    var id: String
    var itemTitle: String
    var loggedDate: Date
    var quantity: String
    var expiredDate: Date
}

struct PantryItemJson: Codable {
    let name: String
    let quantity: PantryItemQuantityJson
    let price: String
}

struct PantryItemQuantityJson: Codable {
    let value: String
    let unit: String
    let ttl: Int
}
