//
//  ViewController.swift
//  HelloDongsup
//
//  Created by Jiyoung Park on 2020/06/27.
//  Copyright © 2020 d2fault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var likedNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // prepare와 동일한 코드(storyboard 사용하지 않을 경우 이렇게 사용한다.)
    @IBAction func buttonAction(_ sender: Any) {
        // 같은 스토리보드 안에 있는 애 중에
        // 꼭 withIdentifier로 설정해야 함!
        let viewController = storyboard?.instantiateViewController(withIdentifier: "CitizenViewController") as? CitizenViewController
        viewController!.delegate = self
        present(viewController!, animated: true, completion: nil)
    }
    
    // 화면 전환시 prepare가 호출됨
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // 목적지 viewController가 스토리보드 상으로 없어서 목적지(destination)의 viewController를 찾아줘야 함
//        // viewController를 segue.destination이 CitizenViewController라면 동일하게 설정한다.
//        // 아니라면 nil이 들어감!
//        let viewController = segue.destination as? CitizenViewController
//        // 혹시 데이터 처리할 일이 있다면 나에게(self) 연락해~
//        viewController?.delegate = self
//    }
}

extension ViewController: CitizenDelegate {
    func buttonClick(name: String) {
        likedNameLabel.text = name
    }
}
