//
//  HomeViewController.swift
//  viajando
//
//  Created by Lab on 12/05/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.scrollView.isScrollEnabled = true
        self.backgroundImageView.image = UIImage(named: "world")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
    }
    
    @IBAction func back(_ segue: UIStoryboardSegue) { }
}
