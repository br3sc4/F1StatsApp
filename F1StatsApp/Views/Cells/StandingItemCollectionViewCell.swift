//
//  StandingItemCollectionViewCell.swift
//  F1StatsApp
//
//  Created by Lorenzo Brescanzin on 29/03/23.
//

import UIKit
import F1StatsKit

struct CompetitorViewModel {
    let points: String
    let competitorName: String
    let wins: String
}

class StandingItemCollectionViewCell: UICollectionViewCell {
    private let stackView = UIStackView()
    private let pointsLabel = UILabel()
    private let competitorLabel = UILabel()
    private let winsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.layer.cornerRadius = 12
        
        configureStackView()
        configurePointsLabel()
        configureCompetitorLabel()
        configureWinsLabel()
        
        configureLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: CompetitorViewModel) {
        pointsLabel.text = item.points
        competitorLabel.text = item.competitorName
        winsLabel.text = "🏆 \(item.wins)"
    }
}

extension StandingItemCollectionViewCell {
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        
        stackView.addArrangedSubview(pointsLabel)
        stackView.addArrangedSubview(competitorLabel)
        stackView.addArrangedSubview(winsLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
    }
    
    private func configurePointsLabel() {
        pointsLabel.font = UIFont(
            descriptor: UIFontDescriptor
                .preferredFontDescriptor(withTextStyle: .title1)
                .withSymbolicTraits(.traitBold)!,
            size: 0
        )
        pointsLabel.textColor = .label
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCompetitorLabel() {
        competitorLabel.font = UIFont(
            descriptor: .preferredFontDescriptor(withTextStyle: .title2),
            size: 0
        )
        competitorLabel.textColor = .label
        competitorLabel.textAlignment = .natural
        competitorLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureWinsLabel() {
        winsLabel.font = UIFont(
            descriptor: .preferredFontDescriptor(withTextStyle: .title3),
            size: 0
        )
        winsLabel.textColor = .secondaryLabel
        winsLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayoutConstraints() {
        NSLayoutConstraint.activate([
            // Stack Constraints
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            // Competitor Label Constraints
            competitorLabel.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor),
            
            // Wins Label Constraints
            winsLabel.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor)
        ])
    }
}
