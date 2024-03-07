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
}

struct PantryItemJson: Codable {
    let Name: String
    let Quantity: Int
}
