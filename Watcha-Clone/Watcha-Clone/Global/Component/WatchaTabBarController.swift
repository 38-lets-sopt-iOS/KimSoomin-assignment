//
//  WatchaTabBarController.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/29/26.
//

import UIKit

enum WatchaTab: Int, CaseIterable {
    case subscription = 0
    case buy
    case webtoon
    case search
    case folder
    
    var title: String {
        switch self {
        case .subscription:
            return "구독"
        case .buy:
            return "개별 구매"
        case .webtoon:
            return "웹툰"
        case .search:
            return "찾기"
        case .folder:
            return "보관함"
        }
    }
    
    var image: UIImage {
        switch self {
        case .subscription:
            return .subscription
        case .buy:
            return .buy
        case .webtoon:
            return .webtoon
        case .search:
            return .search
        case .folder:
            return .folder
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .subscription:
            return SubscriptionViewController()
        case .buy, .webtoon, .search, .folder:
            return EmptyViewController(title: self.title)
        }
    }
}

final class WatchaTabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = 99
        tabBarFrame.origin.y = view.frame.size.height - 99
        tabBar.frame = tabBarFrame
    }
    
    // MARK: - Private Methods
    
    private func setTabBar() {
        let controllers = WatchaTab.allCases.map { tab -> UINavigationController in
            let rootVC = tab.viewController
            let navigationViewController = UINavigationController(rootViewController: rootVC)
            
            let icon = (tab == .subscription) ? tab.image.withRenderingMode(.alwaysTemplate) : tab.image
            
            navigationViewController.tabBarItem = UITabBarItem(
                title: tab.title,
                image: icon,
                tag: tab.rawValue
            )
            
            return navigationViewController
        }
        
        self.viewControllers = controllers
    }
    
    private func setAppearance() {
        let barAppearance = UITabBarAppearance()
        
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = .watchaBlack
        barAppearance.shadowColor = .gray700
        
        let itemAppearance = UITabBarItemAppearance()
        
        itemAppearance.normal.iconColor = .gray500
        itemAppearance.selected.iconColor = .watchaWhite
        
        itemAppearance.normal.titleTextAttributes = [.font: UIFont.body2, .foregroundColor: UIColor.gray500]
        itemAppearance.selected.titleTextAttributes = [.font: UIFont.body2, .foregroundColor: UIColor.watchaWhite]
        
        let offset = UIOffset(horizontal: 0, vertical: -3.5)
        itemAppearance.normal.titlePositionAdjustment = offset
        itemAppearance.selected.titlePositionAdjustment = offset
        
        barAppearance.stackedLayoutAppearance = itemAppearance
        barAppearance.inlineLayoutAppearance = itemAppearance
        barAppearance.compactInlineLayoutAppearance = itemAppearance
        
        tabBar.standardAppearance = barAppearance
        tabBar.scrollEdgeAppearance = barAppearance
    }
}
