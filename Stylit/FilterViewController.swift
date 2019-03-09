//
//  FilterViewController.swift
//  Stylit
//
//  Created by Kavi Ramamurthy on 3/6/19.
//  Copyright © 2019 Lucas Wotton. All rights reserved.
//

import Foundation
import UIKit
import DynamicButton
import PMSuperButton

protocol FilterViewDelegate {
    func applyFilters()
}

class FilterViewController: UIViewController {
    
    private var filtersLabel = UILabel()
    private var separatorView = UIView()
    
    private let shirtsLabel = UILabel()
    private let shirtButton = DynamicButton()
    
    private let backButton = PMSuperButton()
    
    private var initialFilters: Set<ClothingTag> = []
    
    var filterDelegate: FilterViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialFilters = FilterService.getTags()
        setupSubviews()
        setupLayout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupSubviews() {
        filtersLabel.text = "Filters"
        filtersLabel.textAlignment = .center
        filtersLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        view.addSubview(filtersLabel)
        
        separatorView.backgroundColor = .purple
        view.addSubview(separatorView)
        
        shirtsLabel.text = "Shirts"
        shirtsLabel.backgroundColor = .white
        shirtsLabel.textAlignment = .center
        shirtsLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(shirtsLabel)
        
        shirtButton.lineWidth = 3
        shirtButton.strokeColor = .black
        shirtButton.highlightStokeColor = .gray
        if initialFilters.contains(ClothingTag.Shirt) {
            shirtButton.setStyle(.checkMark, animated: false)
        } else {
            shirtButton.setStyle(.close, animated: false)
        }
        shirtButton.addTarget(self, action: #selector(FilterViewController.shirtsButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(shirtButton)
        
        // set up back button
        backButton.setImage(UIImage(named: "rounded-up-arrow"), for: .normal)
        backButton.tintColor = .purple
        backButton.animatedScaleWhenHighlighted = 1.2
        backButton.addTarget(self, action: #selector(FilterViewController.backButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(backButton)
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        filtersLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(filtersLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        
        shirtsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        
        shirtButton.snp.makeConstraints { make in
            make.leading.equalTo(shirtsLabel.snp.trailing).offset(10)
            make.centerY.equalTo(shirtsLabel.snp.centerY)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        backButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).offset(-5)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
    }
    
    @objc func shirtsButtonTapped(_ sender: UIButton) {
        if FilterService.getTags().contains(ClothingTag.Shirt) {
            FilterService.deleteTag(tag: ClothingTag.Shirt)
            shirtButton.setStyle(.close, animated: true)
        } else {
            FilterService.addTag(tag: ClothingTag.Shirt)
            shirtButton.setStyle(.checkMark, animated: true)
        }
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        if initialFilters != FilterService.getTags() {
            filterDelegate?.applyFilters()
        }
        dismiss(animated: true, completion: nil)
    }
}
