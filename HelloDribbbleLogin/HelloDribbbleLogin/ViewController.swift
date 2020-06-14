//
//  ViewController.swift
//  HelloDribbbleLogin
//
//  Created by Jiyoung Park on 2020/06/14.
//  Copyright © 2020 d2fault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var buttonTwitter: UIButton!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonGoogle: UIButton!
    @IBOutlet weak var buttonSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonView.layer.borderWidth = 2
        buttonView.layer.cornerRadius = 5
        buttonView.layer.borderColor = UIColor(red:81/255, green:81/255, blue:81/255, alpha: 1).cgColor
        buttonTwitter.layer.cornerRadius = 5
        buttonFacebook.layer.cornerRadius = 5
        buttonGoogle.layer.cornerRadius = 5
        buttonSignIn.layer.cornerRadius = 5
    }
}

