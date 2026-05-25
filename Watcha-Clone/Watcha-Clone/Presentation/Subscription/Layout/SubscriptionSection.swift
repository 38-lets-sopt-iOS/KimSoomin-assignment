//
//  SubscriptionSection.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/25/26.
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
    
    var itemWidth: NSCollectionLayoutDimension { .fractionalWidth(1.0) }
    var itemHeight: NSCollectionLayoutDimension { .fractionalHeight(1.0) }
    
    var groupWidth: NSCollectionLayoutDimension {
        switch self {
        case .main: return .fractionalWidth(0.8)
        case .wide: return .fractionalWidth(0.9)
        case .watgorithm, .upcoming: return .fractionalWidth(0.28)
        case .watchaParty: return .fractionalWidth(0.55)
        }
    }
    
    var groupHeight: NSCollectionLayoutDimension {
        switch self {
        case .main: return .absolute(500)
        case .wide: return .absolute(240)
        case .watgorithm, .upcoming, .watchaParty: return .absolute(210)
        }
    }
    
    var orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        switch self {
        case .main, .wide: return .groupPagingCentered
        case .watgorithm, .upcoming, .watchaParty: return .continuous
        }
    }
    
    var interGroupSpacing: CGFloat {
        switch self {
        case .main: return 15
        case .wide, .watchaParty: return 12
        case .watgorithm, .upcoming: return 13
        }
    }
    
    var contentInsets: NSDirectionalEdgeInsets {
        switch self {
        case .main: return NSDirectionalEdgeInsets(top: 28, leading: 0, bottom: 0, trailing: 0)
        case .wide: return NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 30, trailing: 0)
        case .watgorithm, .upcoming: return NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16)
        case .watchaParty: return NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 130, trailing: 16)
        }
    }
    
    var headerHeight: CGFloat? {
        switch self {
        case .main: return nil
        case .wide: return 60
        case .watgorithm: return 70
        case .upcoming: return 45
        case .watchaParty: return 40
        }
    }
}
