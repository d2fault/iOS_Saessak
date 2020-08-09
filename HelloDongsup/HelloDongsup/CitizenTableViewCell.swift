//
//  CitizenTableViewCell.swift
//  HelloDongsup
//
//  Created by Jiyoung Park on 2020/06/27.
//  Copyright © 2020 d2fault. All rights reserved.
//

import UIKit

// #1. 이 기능을 구현한 누군가가 있을 거고, (이 프로토콜을 채택하면 분명 구현이 되어 있을 것임)
protocol CitizenTableViewDelegate {
    func buttonClicked(cell: CitizenTableViewCell)
}

class CitizenTableViewCell: UITableViewCell {
    @IBOutlet weak var citizenImage: UIImageView!
    @IBOutlet weak var citizenName: UILabel!
    @IBOutlet weak var citizenCatchphrase: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    // #2. 내가 이것을 받을 거다.
    var delegate: CitizenTableViewDelegate?
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        // 누군가가 만들어 놓은 delegate의 buttonClicked() 함수를 호출한다.
        delegate?.buttonClicked(cell: self) // 내가(self) 눌렸다! cell을 넘겨줌
        // 좋아요 버튼 누를 때마다 바뀜
        likeButton.isSelected.toggle()
    }
    
    func setData(data: Citizens) {
        citizenName.text = data.name
        citizenCatchphrase.text = data.catchphrase
        
        let imageUrl = data.imageUrl
        let url = URL(string: imageUrl)
        citizenImage.kf.setImage(with: url)
    }
    
    // 재사용하기 전 초기화한다.
    override func prepareForReuse() {
        citizenName.text = ""
        citizenCatchphrase.text = ""
        likeButton.isSelected = false
    }
}
