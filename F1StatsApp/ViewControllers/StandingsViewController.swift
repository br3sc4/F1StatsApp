//
//  StandingsViewController.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 28/03/23.
//

import UIKit
import F1StatsKit
import Combine

class StandingsViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Section, String>! = nil
    private var collectionView: UICollectionView! = nil
    
    private var standingStore: StandingsStore
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(standingStore: StandingsStore) {
        self.standingStore = standingStore
        super.init(nibName: nil, bundle: .main)
        
        standingStore.subject
            .sink(receiveValue: updateSnapshot)
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureDataSource()
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(
            standingStore.fetchDriversPodium(),
            toSection: .drivers
        )
        snapshot.appendItems(
            standingStore.fetchConstructorsPodium(),
            toSection: .constructors
        )
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension StandingsViewController {
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: makeStandingsViewLayout())
        collectionView.dataSource = dataSource
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<StandingItemCollectionViewCell, String> {
            [weak self] cell, indexPath, competitorID in
            
            guard let self = self else { return }
            if let driver = self.standingStore.fetchDriverByID(competitorID) {   
                cell.configure(with: CompetitorViewModel(
                    points: driver.points.formatted(),
                    competitorName: driver.competitor.code,
                    wins: driver.wins.formatted()
                ))
            } else if let constructor = self.standingStore.fetchConstructorByID(competitorID) {
                cell.configure(with: CompetitorViewModel(
                    points: constructor.points.formatted(),
                    competitorName: constructor.competitor.name,
                    wins: constructor.wins.formatted()
                ))
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) {
            (collectionView, indexPath, identifier) in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        let headerRegistration = makeSectionHeaderRegistration()
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
    }
    
    private func makeSectionHeaderRegistration() -> UICollectionView.SupplementaryRegistration<UICollectionViewListCell> {
        return UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(
            elementKind: "SectionHeader"
        ) { [weak self] supplementaryView, elementKind, indexPath in
            guard let self = self else { return }
            
            let sectionID = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            
            supplementaryView.configurationUpdateHandler = { supplementaryView, state in
                guard let supplementaryCell = supplementaryView as? UICollectionViewListCell else { return }
                
                var contentConfiguration = UIListContentConfiguration.plainHeader().updated(for: state)
                contentConfiguration.textProperties.font = UIFont(
                    descriptor: .preferredFontDescriptor(withTextStyle: .headline),
                    size: 0
                )
                contentConfiguration.textProperties.color = .label
                contentConfiguration.text = sectionID.rawValue.uppercased()

                supplementaryCell.contentConfiguration = contentConfiguration
                supplementaryCell.backgroundConfiguration = .clear()
            }
        }
    }
    
    private func makeStandingsViewLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16

        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .estimated(150))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
            group.interItemSpacing = .fixed(12)
            
            let section = NSCollectionLayoutSection(group: group)
            
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .estimated(10))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: "SectionHeader",
                alignment: .top)
            
            section.boundarySupplementaryItems = [titleSupplementary]
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)
            
            return section
        }, configuration: config)
    }
}
