//
//  SubscriptionLayoutFactory.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/30/26.
//

import UIKit

enum SubscriptionSection: Int, CaseIterable {
    case main = 0
    case wide
    case watgorithm
    case upcoming
    case watchaParty
    
    var cornerRadius: CGFloat {
        switch self {
        case .main:
            return 12
        case .wide, .watgorithm, .upcoming:
            return 10
        default: return 0
        }
    }
}

struct SubscriptionLayoutFactory {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            guard let sectionType = SubscriptionSection(rawValue: sectionNumber) else { return nil }
            
            switch sectionType {
            case .main:
                return createMainSection()
            case .wide:
                return createWideSection()
            case .watgorithm, .upcoming:
                return createPosterSection(sectionType: sectionType)
            case .watchaParty:
                return createWatchaPartySection()
            }
        }
        return layout
    }
}

// MARK: - Extension

private extension SubscriptionLayoutFactory {
    static func createHeaderItem(height: CGFloat) -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(height)
        )
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    static func createMainSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .absolute(500)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 15
        section.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    static func createWideSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .absolute(240)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 30, trailing: 0)
        
        section.boundarySupplementaryItems = [createHeaderItem(height: 60)]
        return section
    }
    
    static func createPosterSection(sectionType: SubscriptionSection) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.28),
            heightDimension: .absolute(210)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 13
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16)
        
        let headerHeight: CGFloat = (sectionType == .watgorithm) ? 70 : 45
        section.boundarySupplementaryItems = [createHeaderItem(height: headerHeight)]
        return section
    }
    
    static func createWatchaPartySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.55),
            heightDimension: .absolute(210)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 130, trailing: 16)
        
        section.boundarySupplementaryItems = [createHeaderItem(height: 40)]
        return section
    }
}
