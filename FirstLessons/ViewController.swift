//
//  ViewController.swift
//  FirstLessons
//
//  Created by Максим Окунеев on 01.07.2023.
//

import UIKit

//Поместить на экран квадратную вью.
//
//- Закруглить края.
//- Покрасить градиентом.
//- Установить тень.
//- Вью всегда по центру по вертикали и 100pt от левого края.

class ViewController: UIViewController {
    
    lazy var gradLayer: CAGradientLayer = {
        addGradientWithColors(
            colors: [UIColor.blue.cgColor, UIColor.red.cgColor],
            view: view
        )
    }()
    
    lazy var gradView: UIView = {
        let view = UIView()
        view.layer.addSublayer(gradLayer)
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        gradLayer.frame = self.gradView.bounds
        gradLayer.cornerRadius = gradView.bounds.height / 10
        gradLayer.cornerCurve = .continuous
        gradLayer.backgroundColor = UIColor.red.cgColor

        gradView.layer.shadowColor = UIColor.black.cgColor
        gradView.layer.shadowOffset = CGSize(width: 5, height: 5)
        gradView.layer.shadowOpacity = 0.5
        gradView.layer.shadowRadius = gradLayer.cornerRadius
    }

    func setup() {
        self.view.addSubview(gradView)
        
        gradView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gradView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradView.heightAnchor.constraint(equalToConstant: 100),
            gradView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func addGradientWithColors(colors: [CGColor], view: UIView) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = colors
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        return gradient
    }
}
