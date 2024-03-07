//
//  PantrySectionModel.swift
//  SmartPantry
//
//  Created by Long Lam on 3/6/24.
//

import Foundation

struct PantrySectionModel {
    var title: String
    var systemImageName: String
}

let CABINET_SECTION_TITLE = PantrySectionModel(title: "Cabinet", systemImageName: "cabinet")
let REFRIGERATOR_SECTION_TITLE = PantrySectionModel(title: "Refrigerator", systemImageName: "refrigerator")
let FREEZER_SECTION_TITLE = PantrySectionModel(title: "Freezer", systemImageName: "snowflake")
