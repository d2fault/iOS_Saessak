//
//  NumberButton.swift
//  calculator
//
//  Created by Jiyoung Park on 2020/06/08.
//  Copyright © 2020 Jercy. All rights reserved.
//

import UIKit

class NumberButton: UIButton {
    override func awakeFromNib() {
        backgroundColor = UIColor(named: "NumberGray")
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 25
    }

}
