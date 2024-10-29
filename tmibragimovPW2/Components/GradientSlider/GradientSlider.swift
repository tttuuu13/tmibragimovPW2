//
//  GradientSlider.swift
//  tmibragimovPW2
//
//  Created by тимур on 27.10.2024.
//

import Foundation
import UIKit


class GradientSlider: UISlider {
    var minColor: UIColor
    var maxColor: UIColor
    
    init(minColor: UIColor, maxColor: UIColor) {
        self.minColor = minColor
        self.maxColor = maxColor
        super.init(frame: .zero)
        setThumbColor(to: UIColor.interpolate(from: minColor, to: maxColor, fraction: CGFloat(value)))
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sliderValueChanged() {
        setThumbColor(to: UIColor.interpolate(from: minColor, to: maxColor, fraction: CGFloat(value)))
    }
    
    override func draw(_ rect: CGRect) {
        UIImage.drawColorGradient(on: rect, colors: [minColor, maxColor])
    }
    
    func configure() {
        minimumValue = 0
        maximumValue = 1
        value = maximumValue
        layer.cornerRadius = 18
        clipsToBounds = true
        tintColor = .clear
        maximumTrackTintColor = .clear
        minimumTrackTintColor = .clear
        addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    func setThumbColor(to color: UIColor) {
        let circleImage = UIImage.thumbCircle(color: color)
        setThumbImage(circleImage, for: .normal)
    }
}
