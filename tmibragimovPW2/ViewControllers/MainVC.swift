//
//  ViewController.swift
//  tmibragimovPW2
//
//  Created by тимур on 23.10.2024.
//

import UIKit

class MainVC: UIViewController {
    var color: UIColor = Constants.defaultBackgroundColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        configureTitle()
        configureDescription()
        configureSliders()
    }
    
    private func configureSliders() {
        let slidersVC = SlidersVC(color: color, colorChanged: updateColor)
        view.addSubview(slidersVC.view)
        addChild(slidersVC)
        
        NSLayoutConstraint.activate([
            slidersVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            slidersVC.view.heightAnchor.constraint(equalToConstant: 400),
            slidersVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            slidersVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * 10)
        ])
    }
    
    private func configureTitle() {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Wish Maker"
        title.font = Constants.titleFont
        title.textColor = .black
        
        view.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func configureDescription() {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = .max
        description.textAlignment = .center
        description.text = "This is my implementation of the Wish Maker app, feel free to use sliders to change background color to your liking"
        description.font = Constants.descriptionFont
        description.textColor = .black
        
        view.addSubview(description)
        
        NSLayoutConstraint.activate([
            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            description.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            description.widthAnchor.constraint(equalToConstant: 330)
        ])
    }
    
    private func updateColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    enum Constants {
        static let defaultBackgroundColor: UIColor = .white.withAlphaComponent(0.9)
        static let titleFont: UIFont = .systemFont(ofSize: 30, weight: .semibold)
        static let descriptionFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
    }
}
