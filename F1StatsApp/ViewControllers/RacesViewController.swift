//
//  RacesViewController.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import UIKit
import F1StatsKit

class RacesViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RaceTableViewCell.self, forCellReuseIdentifier: "RaceCellId")
        tableView.backgroundColor = .systemGroupedBackground
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RaceCellId", for: indexPath) as! RaceTableViewCell
        cell.race = Race(name: "Jeddah", round: "2", date: .now,
                         circuit: .init(id: "", name: "",
                                        location: .init(longitude: "", latitude: "", locality: "", country: "")))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
