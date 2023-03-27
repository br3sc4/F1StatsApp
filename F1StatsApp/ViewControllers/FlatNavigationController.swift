//
//  FlatNavigationController.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 24/03/23.
//

import UIKit

class FlatNavigationController: UITabBarController {
    convenience init(viewControllers: [UIViewController]) {
        self.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
            .map(makeNavigationController(for:))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func makeNavigationController(for viewController: UIViewController) -> UINavigationController {
        let vc = UINavigationController(rootViewController: viewController)
        vc.navigationBar.prefersLargeTitles = true
        return vc
    }
}
