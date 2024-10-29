//
//  SliderView.swift
//  tmibragimovPW2
//
//  Created by тимур on 29.10.2024.
//

import Foundation
import UIKit


final class SliderView: UIStackView {
    let name: String
    let slider: GradientSlider
    let valueField: ValueField
    
    
    init(name:String, slider: GradientSlider, valueField: ValueField) {
        self.name = name
        self.slider = slider
        self.valueField = valueField
        super.init(frame: .zero)
        configure()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        axis = .vertical
        alignment = .leading
        translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = name
        nameLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        nameLabel.textColor = .secondaryLabel
        addArrangedSubview(nameLabel)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.sliderValueChanged()
        
        valueField.translatesAutoresizingMaskIntoConstraints = false
        valueField.addTarget(self, action: #selector(valueFieldValueChanged), for: .editingChanged)
        sliderValueChanged()
        
        let sliderValueStack = UIStackView(arrangedSubviews: [slider, valueField])
        sliderValueStack.translatesAutoresizingMaskIntoConstraints = false
        sliderValueStack.spacing = 11
        
        addArrangedSubview(sliderValueStack)
        
        NSLayoutConstraint.activate([])
    }
    
    @objc func sliderValueChanged() {
        valueField.text = String(Int(slider.value * slider.maximumValue))
    }
    
    @objc func valueFieldValueChanged() {
        self.slider.value = (Float(self.valueField.text!) ?? 0) / slider.maximumValue
        self.slider.sliderValueChanged()
    }
}
