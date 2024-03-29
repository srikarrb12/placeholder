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
            pantries.append(PantryItemModel(id: UUID().uuidString, itemTitle: item.name, loggedDate: Date(), quantity: item.quantity.value, expiredDate:  Calendar.current.date(byAdding: .day, value: item.quantity.ttl + 10, to: Date())!))
        }
     
    }
    
    func clearPantry() {
        pantries = []
    }
    func getExpired() -> [PantryItemModel] {
        var shuffledPantries = pantries.shuffled()
        
        if shuffledPantries.count >= 3 {
            return Array(shuffledPantries.prefix(3))
        } else {
            return shuffledPantries
        }
    }

}
