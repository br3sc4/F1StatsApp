//
//  StandingsDecodable.swift
//  
//
//  Created by Lorenzo Brescanzin on 29/03/23.
//

import Foundation

public protocol StandingsDecodable: Decodable {
    static var competitorKey: String { get }
}
