//
//  FishViewController.swift
//  AC
//
//  Created by Jiyoung Park on 2020/06/22.
//  Copyright © 2020 d2fault. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class FishViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 스위프트의 프로토콜 = 인터페이스 + 추상클래스 합쳐진 개념으로 보면 됨
    // 추상클래스: 내가 구현하지 않아도 미리 구현되어 있는 기능
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 큰 분류: section, 그 안의 것들: row
        // 보통 section은 하나로 정의됨 (default = 1)
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // row에 보여질 cell을 정의
        // storyboard에 정의한 cell을 클래스화하여 여기서 보여주면 된다.
        
        // 매번 그려줍니다.
//        if indexPath.row == 0 {
//            return UITableViewCell
//        }
        // 재사용하기로한 FishTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "FishTableViewCell", for: indexPath) as! FishTableViewCell
        // as! => FishTableViewCell로 typecasting한다.
        let fish = fishModel?[keys[indexPath.row]]
        // fishModel의 key로 가져와서 그 안의 name에 name-KRko를 text에 대입
        cell.fishName.text = fish?.name["name-KRko"]
        
        let fishUri = fish?.imageURI
        let url = URL(string: fishUri!)
        cell.fishImageView.kf.setImage(with: url)
        
        
        cell.fishPrase.text = fish?.museumPhrase
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    var fishModel: FishModel?
    var keys: [String] = []
    
    // 화면에 안 보이고 메모리에 올라온 상황
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이벤트 발생을 알려주면 내가 알아서 처리할게! (delegate pattern)
//        tableView.delegate = self
        // 데이터도 내가 알아서 전달할게!
//        tableView.dataSource = self
        callApi()
    }
    
    func callApi() {
        let baseURL = "http://acnhapi.com"
        // 비동기로 호출, 결과값을 response로 받는다. (네이밍은 마음대로)
        AF.request(baseURL + "/v1/fish").responseJSON(completionHandler: { response in
            // 사실상 이 안의 것이 익명 함수
            // 비동기 호출이 끝나면 이 안의 행위를 한다.
            let decoder = JSONDecoder()
            // .self -> 객체 타입임을 알려줌
            let fishModel = try! decoder.decode(FishModel.self, from: response.data!)
            // 전역변수의 fishModel에 fishModel을 대입
            self.fishModel = fishModel

            for key in fishModel.keys {
                self.keys.append(key)
            }
            // 위의 for문과 동일
//            self.keys = fishModel.keys.map { $0 }
            
            // tableView를 reload한다
            self.tableView.reloadData()
//            print(fishModel)
        })
    }
}
