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

class CitizenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitizenTableViewCell", for: indexPath) as! CitizenTableViewCell
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        callCitizenApi()
    }
    
    func callCitizenApi() {
        let baseURL = "https://moti.company"
        AF.request(baseURL + "/api/v2/citizens").responseJSON { response in
            let decoder = JSONDecoder()
            let result = try! decoder.decode(CitizenModel.self, from: response.data!)
            print(result)
        }
    }
}
