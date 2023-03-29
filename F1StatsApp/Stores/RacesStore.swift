//
//  RacesStore.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 29/03/23.
//

import Foundation
import F1StatsKit
import Combine

final class RacesStore {
    let subject = PassthroughSubject<Void, Never>()
    private var races: [Race] = []
    
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
        
        loadData()
    }
    
    subscript(_ indexPath: IndexPath) -> Race {
        races[indexPath.row]
    }
    
    func fetchRacesIDs() -> [Race.ID] {
        races.map(\.id)
    }
    
    func fetchRaceByID(_ id: Race.ID) -> Race? {
        races.first(where: { $0.id == id })
    }
}

extension RacesStore {
    private func loadData() {
        Task {
            do {
                races = try await service.fetch([Race].self, from: .races)
                subject.send()
            } catch {
                debugPrint(error)
            }
        }
    }
}
