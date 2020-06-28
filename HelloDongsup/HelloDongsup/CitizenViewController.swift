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
        return citizenModel?.data.citizens.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitizenTableViewCell", for: indexPath) as! CitizenTableViewCell
        let citizens = citizenModel?.data.citizens
        cell.citizenName.text = citizens?[indexPath.row].name
        cell.citizenCatchphrase.text = citizens?[indexPath.row].catchphrase
        
        let imageUrl = citizens?[indexPath.row].imageUrl
        let url = URL(string: imageUrl!)
        cell.citizenImage.kf.setImage(with: url)
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    var citizenModel: CitizenModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        callCitizenApi()
    }
    
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
