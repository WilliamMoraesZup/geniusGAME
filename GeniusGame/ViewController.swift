//
//  ViewController.swift
//  GeniusGame
//
//  Created by William Moraes da Silva on 16/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Button(_ sender: UIButton) {
    
        sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1 )
        sender.alpha = 0.2
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            sender.transform = CGAffineTransform.identity
            sender.alpha = 1
            
        })
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

