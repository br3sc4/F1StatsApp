//
//  Section.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 29/03/23.
//

import Foundation

enum Section: String, Identifiable, CaseIterable {
    case drivers, constructors
    
    var id: String {
        self.rawValue
    }
}
