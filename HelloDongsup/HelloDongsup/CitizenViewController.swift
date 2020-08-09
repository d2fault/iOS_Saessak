//
//  CitizenViewController.swift
//  HelloDongsup
//
//  Created by Jiyoung Park on 2020/06/27.
//  Copyright © 2020 d2fault. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

// struct는 값이라 reference count가 없고,
// 주소를 갖고 있는 class에서는 reference count를 사용한다.
protocol CitizenDelegate: class {
    func buttonClick(name: String)
}

class CitizenViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var citizenModel: CitizenModel?
    // 약한 참조를 선언해서 referenct count를 증가시키지 않음으로써 상호 참조를 없앰
    weak var delegate: CitizenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callCitizenApi()
    }
}

extension CitizenViewController {
    func callCitizenApi() {
        let baseURL = "https://moti.company"
        AF.request(baseURL + "/api/v2/citizens").responseJSON { response in
            let decoder = JSONDecoder()
            let citizenModel = try! decoder.decode(CitizenModel.self, from: response.data!)
            self.citizenModel = citizenModel
            self.tableView.reloadData()
        }
    }
}

extension CitizenViewController: CitizenTableViewDelegate {
    func buttonClicked(cell: CitizenTableViewCell) {
        // 몇 번째의 cell인지 알게됨
        let indexPath = tableView.indexPath(for: cell)
        // 특정 cell에 들어간 값을 가지고 올 수 있게 됨
        let name = citizenModel?.data.citizens[indexPath!.row].name
        delegate?.buttonClick(name: name!)
        // 모달 창 닫기
//        dismiss(animated: true, completion: nil)
    }
}

extension CitizenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citizenModel?.data.citizens.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitizenTableViewCell", for: indexPath) as! CitizenTableViewCell
        let citizens = citizenModel?.data.citizens
        cell.setData(data: citizens![indexPath.row])
        
        // 위임할 함수를 구현하는 건 나야! 를 알려줌
        cell.delegate = self
        return cell
    }
}
