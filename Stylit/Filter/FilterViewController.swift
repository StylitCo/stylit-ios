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
    
    private let pantsLabel = UILabel()
    private let pantsButton = DynamicButton()
    
    private let shoesLabel = UILabel()
    private let shoesButton = DynamicButton()
    
    private let hoodiesLabel = UILabel()
    private let hoodiesButton = DynamicButton()
    
    private let jacketsLabel = UILabel()
    private let jacketsButton = DynamicButton()
    
    private let sweatersLabel = UILabel()
    private let sweatersButton = DynamicButton()
    
    private let backButton = PMSuperButton()
    
    private var initialFilters: Set<ClothingTag> = []
    
    var filterDelegate: FilterViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialFilters = FilterService.getTags()
        setupSubviews()
        setupLayout()
    }
}

// Setup subviews
extension FilterViewController {
    func setupSubviews() {
        // set up filter label
        filtersLabel.text = "Filters"
        filtersLabel.textAlignment = .center
        filtersLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        view.addSubview(filtersLabel)
        
        // set up separator view
        separatorView.backgroundColor = .purple
        view.addSubview(separatorView)
        
        // set up shirt button
        setupDynamicButton(for: shirtButton, for: .Shirt)
        shirtButton.addTarget(self, action: #selector(FilterViewController.shirtsButtonTapped(_:)),                             for: .touchUpInside)
        view.addSubview(shirtButton)

        // set up shirt label
        shirtsLabel.text = "Shirts"
        shirtsLabel.backgroundColor = .white
        shirtsLabel.textAlignment = .center
        shirtsLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(shirtsLabel)
        
        // set up pants button
        setupDynamicButton(for: pantsButton, for: .Pants)
        pantsButton.addTarget(self, action: #selector(FilterViewController.pantsButtonTapped(_:)),                             for: .touchUpInside)
        view.addSubview(pantsButton)
        
        // set up pants label
        pantsLabel.text = "Pants"
        pantsLabel.backgroundColor = .white
        pantsLabel.textAlignment = .center
        pantsLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(pantsLabel)
        
        // set up shoes button
        setupDynamicButton(for: shoesButton, for: .Shoes)
        shoesButton.addTarget(self, action: #selector(FilterViewController.shoesButtonTapped(_:)),                             for: .touchUpInside)
        view.addSubview(shoesButton)
        
        // set up shoes label
        shoesLabel.text = "Shoes"
        shoesLabel.backgroundColor = .white
        shoesLabel.textAlignment = .center
        shoesLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(shoesLabel)
        
        // set up hoodies button
        setupDynamicButton(for: hoodiesButton, for: .Hoodies)
        hoodiesButton.addTarget(self, action: #selector(FilterViewController.hoodiesButtonTapped(_:)),                             for: .touchUpInside)
        view.addSubview(hoodiesButton)
        
        // set up hoodies label
        hoodiesLabel.text = "Hoodies"
        hoodiesLabel.backgroundColor = .white
        hoodiesLabel.textAlignment = .center
        hoodiesLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(hoodiesLabel)

        // set up jackets button
        setupDynamicButton(for: jacketsButton, for: .Jacket)
        jacketsButton.addTarget(self, action: #selector(FilterViewController.jacketsButtonTapped(_:)),                             for: .touchUpInside)
        view.addSubview(jacketsButton)
        
        // set up jackets label
        jacketsLabel.text = "Jackets"
        jacketsLabel.backgroundColor = .white
        jacketsLabel.textAlignment = .center
        jacketsLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(jacketsLabel)
        
        // set up sweaters button
        setupDynamicButton(for: sweatersButton, for: .Sweater)
        sweatersButton.addTarget(self, action: #selector(FilterViewController.sweatersButtonTapped(_:)),                             for: .touchUpInside)
        view.addSubview(sweatersButton)
        
        // set up sweaters label
        sweatersLabel.text = "Sweaters"
        sweatersLabel.backgroundColor = .white
        sweatersLabel.textAlignment = .center
        sweatersLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(sweatersLabel)
        
        // set up back button
        backButton.setImage(UIImage(named: "rounded-down-arrow"), for: .normal)
        backButton.tintColor = .purple
        backButton.animatedScaleWhenHighlighted = 1.2
        backButton.addTarget(self, action: #selector(FilterViewController.backButtonTapped(_:)),                             for: .touchUpInside)
        
        view.addSubview(backButton)
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        filtersLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(25)
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
            make.top.equalTo(separatorView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        shirtButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-50)
            make.centerY.equalTo(shirtsLabel.snp.centerY)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        pantsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(shirtsLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        pantsButton.snp.makeConstraints { make in
            make.centerX.equalTo(shirtButton.snp.centerX)
            make.centerY.equalTo(pantsLabel.snp.centerY)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        shoesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(pantsLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        shoesButton.snp.makeConstraints { make in
            make.centerX.equalTo(shirtButton.snp.centerX)
            make.centerY.equalTo(shoesLabel.snp.centerY)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        hoodiesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(shoesLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        hoodiesButton.snp.makeConstraints { make in
            make.centerX.equalTo(shirtButton.snp.centerX)
            make.centerY.equalTo(hoodiesLabel.snp.centerY)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        jacketsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(hoodiesLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        jacketsButton.snp.makeConstraints { make in
            make.centerX.equalTo(shirtButton.snp.centerX)
            make.centerY.equalTo(jacketsLabel.snp.centerY)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        sweatersLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(jacketsLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        sweatersButton.snp.makeConstraints { make in
            make.centerX.equalTo(shirtButton.snp.centerX)
            make.centerY.equalTo(sweatersLabel.snp.centerY)
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
    
    private func setupDynamicButton(for button: DynamicButton, for tag: ClothingTag) {
        button.lineWidth = 3
        button.strokeColor = .black
        button.highlightStokeColor = .gray
        if initialFilters.contains(tag) {
            button.setStyle(.checkMark, animated: false)
        } else {
            button.setStyle(.close, animated: false)
        }
    }
}

// Button functions
extension FilterViewController {
    @objc func shirtsButtonTapped(_ sender: UIButton) {
        toggleFilterButton(button: shirtButton, for: .Shirt)
    }
    
    @objc func pantsButtonTapped(_ sender: UIButton) {
        toggleFilterButton(button: pantsButton, for: .Pants)
    }
    
    @objc func shoesButtonTapped(_ sender: UIButton) {
        toggleFilterButton(button: shoesButton, for: .Shoes)
    }
    
    @objc func hoodiesButtonTapped(_ sender: UIButton) {
        toggleFilterButton(button: hoodiesButton, for: .Hoodies)
    }
    
    @objc func jacketsButtonTapped(_ sender: UIButton) {
        toggleFilterButton(button: jacketsButton, for: .Jacket)
    }
    
    @objc func sweatersButtonTapped(_ sender: UIButton) {
        toggleFilterButton(button: sweatersButton, for: .Sweater)
    }
    
    private func toggleFilterButton(button: DynamicButton, for tag: ClothingTag) {
        if FilterService.getTags().contains(tag) {
            FilterService.deleteTag(tag: tag)
            button.setStyle(.close, animated: true)
        } else {
            FilterService.addTag(tag: tag)
            button.setStyle(.checkMark, animated: true)
        }
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        if initialFilters != FilterService.getTags() {
            filterDelegate?.applyFilters()
        }
        dismiss(animated: true, completion: nil)
    }
}
