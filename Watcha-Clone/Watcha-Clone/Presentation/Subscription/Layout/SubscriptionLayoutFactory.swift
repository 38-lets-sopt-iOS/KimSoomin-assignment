//
//  SubscriptionLayoutFactory.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/30/26.
//

import UIKit

struct SubscriptionLayoutFactory {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            guard let sectionType = SubscriptionSection(rawValue: sectionNumber) else { return nil }
            return createBaseSection(for: sectionType)
        }
    }
}

// MARK: - Extension

private extension SubscriptionLayoutFactory {
    static func createBaseSection(for sectionType: SubscriptionSection) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: sectionType.itemWidth, heightDimension: sectionType.itemHeight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: sectionType.groupWidth, heightDimension: sectionType.groupHeight)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = sectionType.orthogonalScrollingBehavior
        section.interGroupSpacing = sectionType.interGroupSpacing
        section.contentInsets = sectionType.contentInsets
        
        if let headerHeight = sectionType.headerHeight {
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(headerHeight))
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            section.boundarySupplementaryItems = [headerItem]
        }
        
        return section
    }
}
