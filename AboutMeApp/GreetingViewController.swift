//
//  GreetingViewController.swift
//  AboutMeApp
//
//  Created by Samoilik Hleb on 09/02/2025.
//

import UIKit

final class GreetingViewController: UIViewController {
    var userName: String?

    @IBOutlet var userNameOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        userNameOutlet.text = userName
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.sublayers?.first?.frame = view.bounds
    }
    
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [
            UIColor.systemPink.withAlphaComponent(0.3).cgColor,
            UIColor.systemIndigo.withAlphaComponent(0.3).cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
