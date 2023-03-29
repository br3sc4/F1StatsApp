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
    let position: Int
}

class StandingItemCollectionViewCell: UICollectionViewCell {
    private let stackView = UIStackView()
    private let pointsLabel = UILabel()
    private let competitorLabel = UILabel()
    private let winsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContentView()
        
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
    private enum BorderColor {
        static var gold: CGColor {
            CGColor(red: 212, green: 175, blue: 55, alpha: 1)
        }
        
        static var silver: CGColor {
            CGColor(red: 192, green: 192, blue: 192, alpha: 1)
        }
        
        static var bronze: CGColor {
            CGColor(red: 159, green: 122, blue: 52, alpha: 1)
        }
        
        static var `default`: CGColor {
            CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    private func configureContentView() {
        contentView.backgroundColor = .clear
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = BorderColor.default
        contentView.layer.cornerRadius = 12
    }
    
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
