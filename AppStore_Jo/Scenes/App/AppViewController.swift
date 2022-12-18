//
//  AppViewController.swift
//  AppStore_Jo
//
//  Created by 조호근 on 2022/12/15.
//

import SnapKit
import UIKit

final class AppViewController: UIViewController {
    private let scrollView = UIScrollView() //class의 프로퍼티로 정해준다
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0 //동등하게 간격을 설정하지만 그 설정값을 0으로 하면 스택뷰는 서브뷰의 높이로만 자유롭게 정해질 수 있게됨.
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = UIView()
        let exchangeCodeButtonView = UIView()
        
        
        rankingFeatureSectionView.backgroundColor = .blue
        exchangeCodeButtonView.backgroundColor = .green
        
        [
            featureSectionView,
            rankingFeatureSectionView,
            exchangeCodeButtonView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
