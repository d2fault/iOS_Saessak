//
//  ViewController.swift
//  HelloSwift
//
//  Created by Jiyoung Park on 2020/05/25.
//  Copyright © 2020 d2fault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var number: Int = 1
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func touchAction(_ sender: Any) {
        nameLabel.text = "\(number)"
        buttonView.layer.cornerRadius = CGFloat(number)
        number += 1
    }
    // view를 나타내려고 할 때(메모리에 올라감 / 예외가 있긴 하지만 1회 호출)
    override func viewWillAppear(_ animated: Bool) {
    }
    
    // view가 나타나려고 할 때
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3) {
            // UIColor 생략 가능
            self.buttonView.backgroundColor = .green
        }
    }
    
    // 뷰가 로드됐을때
    override func viewDidLoad() {
        // UIColor 생략 가능
        buttonView.backgroundColor = .black
    }
    
    // 뷰가 사라지려고 할 때
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    // 뷰가 사라졌을 때
    override func viewDidDisappear(_ animated: Bool) {
    }
}
