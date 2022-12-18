//
//  FeatureSectionView.swift
//  AppStore_Jo
//
//  Created by 조호근 on 2022/12/16.
//

import SnapKit
import UIKit

final class FeatureSectionView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true // 페이징이 걸린다.
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false //스크롤바 표시가 감추게 설정했다.
        
        //셀을 커스텀해서 컬렉션뷰에 넣을거임
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "FeatureSectionViewCell"
        )
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//컬렉션 뷰의 지정된 위치에 표시할 셀을 요청하는 메서드, 지정된 섹션에 표시할 항목의 개수를 묻는 메서드
extension FeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionViewCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

extension FeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32.0
    }
}

private extension FeatureSectionView {
    func setupViews() {
        [
            collectionView
        ].forEach { addSubview($0) }
        
        collectionView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16.0)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(snp.width)
        }
    }
}
