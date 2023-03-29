//
//  RacesViewController.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import UIKit
import F1StatsKit
import Combine

class RacesViewController: UITableViewController {
    private var dataSource: UITableViewDiffableDataSource<Section, Race.ID>! = nil
    private var store: RacesStore
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(store: RacesStore) {
        self.store = store
        super.init(style: .plain)
        
        store.subject
            .sink(receiveValue: updateSnapshot)
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        tableView.dataSource = dataSource
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Race.ID>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(store.fetchRacesIDs(), toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RaceDetailViewController()
        vc.race = store[indexPath]
        show(vc, sender: self)
    }
    
    private func configureDataSource() {
        tableView.register(RaceTableViewCell.self, forCellReuseIdentifier: "RaceCellId")
        
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: {
            tableView, indexPath, itemIdentifier in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RaceCellId", for: indexPath) as! RaceTableViewCell
            cell.race = self.store.fetchRaceByID(itemIdentifier)
            return cell
        })
    }
}

extension RacesViewController {
    private enum Section: String, CaseIterable {
        case main
    }
}
