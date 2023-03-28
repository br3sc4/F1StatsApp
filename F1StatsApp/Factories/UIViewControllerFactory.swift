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
        vc.tabBarItem = UITabBarItem(
            title: "Races",
            image: UIImage(systemName: "list.bullet"),
            selectedImage: nil
        )
        return vc
    }
    
    func makeStandingsViewController() -> UIViewController {
        let vc = StandingsViewController()
        vc.view.backgroundColor = .systemBackground
        vc.title = "Standings"
        vc.tabBarItem = UITabBarItem(
            title: "Standings",
            image: UIImage(systemName: "trophy"),
            selectedImage: UIImage(systemName: "trophy.fill")
        )
        return vc
    }
}
