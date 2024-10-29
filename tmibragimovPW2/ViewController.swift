//
//  ViewController.swift
//  tmibragimovPW2
//
//  Created by тимур on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {
    var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 209 / 255, green: 227 / 255, blue: 247 / 255, alpha: 1)
        
        let redSliderView = SliderView(name: "RED", slider: GradientSlider(minColor: .black, maxColor: .red), valueField: ValueField(maxValue: 255))
        let greenSliderView = SliderView(name: "GREEN", slider: GradientSlider(minColor: .black, maxColor: .green), valueField: ValueField(maxValue: 255))
        let blueSliderView = SliderView(name: "BLUE", slider: GradientSlider(minColor: .black, maxColor: .blue), valueField: ValueField(maxValue: 255))
        let opacitySliderView = SliderView(name: "OPACITY", slider: OpacitySlider(color: .white), valueField: ValueField(maxValue: 100))
        
        let sliders = UIStackView(arrangedSubviews: [redSliderView, greenSliderView, blueSliderView, opacitySliderView])
        sliders.axis = .vertical
        
        view.addSubview(sliders)
        
        NSLayoutConstraint.activate([
        ])
    }
}
