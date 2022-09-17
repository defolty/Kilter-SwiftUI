//
//  ChecklistItem.swift
//  KilterSwiftUI
//
//  Created by Nikita Nesporov on 17.09.2022.
//

import Foundation
 
struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
