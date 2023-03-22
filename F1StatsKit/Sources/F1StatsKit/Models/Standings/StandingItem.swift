//
//  StandingItem.swift
//  
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import Foundation

public struct StandingItem<Competitor> {
    public let position: Int
    public let points: Int
    public let wins: Int
    public let competitor: Competitor
}
