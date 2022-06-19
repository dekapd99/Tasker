//
//  SelectedButton.swift
//  Tasker
//
//  Created by Deka Primatio on 19/06/22.
//

import Foundation

// All Case Category dari TODO
enum SelectedButton: String {
    
    case all = "All"
    case groceries = "Groceries"
    case work = "Work"
    case school = "School"
    case home = "Home"
    case personal = "Personal"
    case extra = "Extra"
    
    func getValue() -> String {
        return self.rawValue
    }
    
}
