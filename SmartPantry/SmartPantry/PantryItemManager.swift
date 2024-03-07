//
//  PantryItemManager.swift
//  SmartPantry
//
//  Created by Long Lam on 3/7/24.
//

import Foundation

class PantryItemManager: ObservableObject {
    @Published private(set) var pantries: [PantryItemModel] = []
    
    func addPantry(pantriesJson: [PantryItemJson]) {
        for item in pantriesJson {
            pantries.append(PantryItemModel(id: UUID().uuidString, itemTitle: item.Name, loggedDate: Date(), quantity: String(item.Quantity)))
        }
    }
    
    func clearPantry() {
        pantries = []
    }
}
