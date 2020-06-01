//
//  SecondViewController.swift
//  HelloSwift
//
//  Created by Jiyoung Park on 2020/06/01.
//  Copyright © 2020 d2fault. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 비동기로 처리되기 때문에 modal로 띄울 경우 애니메이션이 먹지 않는다.
        UIView.animate(withDuration: 5) {
            self.view.backgroundColor = .green
        }
    }
}
