//
//  RacesViewController.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import UIKit
import F1StatsKit

class RacesViewController: UITableViewController {
    private var races: [Race] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
        super.init(style: .plain)
        
        // TODO: make it cleaner
        Task {
            do {
                races = try await service.fetch(Race.self, from: .races)
            } catch {
                debugPrint(error)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RaceTableViewCell.self, forCellReuseIdentifier: "RaceCellId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RaceCellId", for: indexPath) as! RaceTableViewCell
        cell.race = races[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RaceDetailViewController()
        vc.race = races[indexPath.row]
        show(vc, sender: self)
    }
}
