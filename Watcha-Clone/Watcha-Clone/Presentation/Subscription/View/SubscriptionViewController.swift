//
//  SubscriptionViewController.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/29/26.
//

import UIKit

import SnapKit
import Then

class SubscriptionViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private let mainData = ContentModel.mainMockData()
    private let wideData = ContentModel.wideMockData()
    private let posterData = ContentModel.posterMockData()
    private let partyData = ContentModel.watchaPartyMockData()
    
    // MARK: - UI Components
    
    private let topBar = CustomTopBarView()
    private let stickyHeaderView = StickyHeaderView()
    private let startSubscriptionView = StartSupscriptionView()
    private lazy var collectionView: UICollectionView = {
        let layout = SubscriptionLayoutFactory.createLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        register()
        delegate()
    }
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        view.backgroundColor = .watchaBlack
        
        collectionView.do {
            $0.backgroundColor = .watchaBlack
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
        }
        
        startSubscriptionView.do {
            $0.layer.cornerRadius = 10
        }
    }
    
    override func setUI() {
        view.addSubviews(collectionView, stickyHeaderView, topBar, startSubscriptionView)
    }
    
    override func setLayout() {
        topBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(105)
        }
        
        stickyHeaderView.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(stickyHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(80)
        }
        
        startSubscriptionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(117)
            $0.height.equalTo(86)
        }
    }
    
    // MARK: - Private Methods
    
    private func register() {
        collectionView.register(WatchaContentCell.self, forCellWithReuseIdentifier: WatchaContentCell.identifier)
        collectionView.register(WatchaPartyCell.self, forCellWithReuseIdentifier: WatchaPartyCell.identifier)
        
        collectionView.register(WideHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WideHeaderView.identifier)
        collectionView.register(WatgorithmHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WatgorithmHeaderView.identifier)
        collectionView.register(CommonHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CommonHeaderView.identifier)
    }
    
    private func delegate() {
        collectionView.delegate = self
    }
}

// MARK: - Extensions

extension SubscriptionViewController: UICollectionViewDelegate {}

extension SubscriptionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SubscriptionSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = SubscriptionSection(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .main:
            return mainData.count
        case .wide:
            return wideData.count
        case .watgorithm, .upcoming:
            return posterData.count
        case .watchaParty:
            return partyData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = SubscriptionSection(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .watchaParty:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatchaPartyCell.identifier, for: indexPath) as? WatchaPartyCell else { return UICollectionViewCell() }
            
            let data = partyData[indexPath.item]
            cell.bindData(image: data.posterImage,
                          time: "오늘 \(data.time ?? "")에 시작",
                          hashtag: data.title ?? "")
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatchaContentCell.identifier, for: indexPath) as? WatchaContentCell else { return UICollectionViewCell() }
            
            let data: ContentModel
            switch sectionType {
            case .main:
                data = mainData[indexPath.item]
            case .wide:
                data = wideData[indexPath.item]
            default:
                data = posterData[indexPath.item]
            }
            
            cell.bindData(image: data.posterImage, radius: sectionType.cornerRadius)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let sectionType = SubscriptionSection(rawValue: indexPath.section) else {
            return UICollectionReusableView()
        }
        
        switch sectionType {
        case .main:
            return UICollectionReusableView()
            
        case .wide:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WideHeaderView.identifier, for: indexPath) as! WideHeaderView
            header.configure(title: "방금 막 도착한 신상 콘텐츠", subTitle: "예능부터 드라마까지!")
            return header
            
        case .watgorithm:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WatgorithmHeaderView.identifier, for: indexPath) as! WatgorithmHeaderView
            header.configure(title: "예능부터 드라마까지!")
            return header
            
        case .upcoming, .watchaParty:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CommonHeaderView.identifier, for: indexPath) as! CommonHeaderView
            let title = (sectionType == .upcoming) ? "공개 예정 콘텐츠" : "왓챠 파티"
            header.configure(title: title)
            return header
        }
    }
}

extension SubscriptionViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let threshold: CGFloat = 50.0
        
        let progress = min(1, max(0, yOffset / threshold))
        
        updateStickyHeader(progress: progress)
    }
    
    private func updateStickyHeader(progress: CGFloat) {
        let topOffset = -(31 * progress)
        stickyHeaderView.snp.updateConstraints {
            $0.top.equalTo(topBar.snp.bottom).offset(topOffset)
        }
        
        stickyHeaderView.titleLabel.font = progress > 0.5 ? .head2 : .head1
        
        view.layoutIfNeeded()
    }
}
