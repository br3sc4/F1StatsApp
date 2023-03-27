//
//  UIViewControllerFactory.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 22/03/23.
//

import UIKit
import F1StatsKit

final class UIViewControllerFactory: ViewControllerFactory {
    private let networkService: NetworkService = URLSessionService()
    
    func makeRacesViewController() -> UIViewController {
        let vc = RacesViewController(service: networkService)
        vc.title = "Races"
        vc.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc.tabBarItem.title = "Races"
        return vc
    }
    
    func makeStandingsViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        vc.title = "Standings"
        vc.tabBarItem.image = UIImage(systemName: "trophy")
        vc.tabBarItem.selectedImage = UIImage(systemName: "trophy.fill")
        vc.tabBarItem.title = "Standings"
        return vc
    }
}
