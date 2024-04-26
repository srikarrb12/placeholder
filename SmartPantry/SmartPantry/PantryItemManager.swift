//
//  PantryItemManager.swift
//  SmartPantry
//
//  Created by Long Lam on 3/7/24.
//

import Foundation

class PantryItemManager: ObservableObject {
    static var manager = PantryItemManager()
    @Published var pantries: [PantryItemModel] = []
    
    func addPantry(pantriesJson: [PantryItemJson]) {
        for item in pantriesJson {
            pantries.append(PantryItemModel(id: UUID().uuidString, itemTitle: item.name, loggedDate: Date(), quantity: item.quantity.value, expiredDate:  Calendar.current.date(byAdding: .day, value: item.quantity.ttl + 10, to: Date())!))
        }
     
    }
    
    func addPantry(pantriesInput: [PantryItemModel]) {
        for item in pantriesInput {
            pantries.append(item)
        }
    }
    
    func deletePantryItem(byId id: String) {
        pantries.removeAll { $0.id == id }
    }
    
    func clearPantry() {
        pantries = []
    }
    func getExpiringItem() -> [PantryItemModel] {
        let shuffledPantries = pantries.shuffled()
        
        if shuffledPantries.count >= 3 {
            return Array(shuffledPantries.prefix(3))
        } else {
            return shuffledPantries
        }
        
    }

}
