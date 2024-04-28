//
//  SettingsViewController.swift
//  TabBar
//
//  Created by Kamal Harariya on 4/18/24.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let settingViewModel = WCSettingsViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        getDataFromServices()
    }
    
    func getDataFromServices() {
        settingViewModel.getSettingsData {[weak self] result in
            switch result {
            case .success:
                self?.tableView.reloadData()
            case .failure:
                print("error")
            }
        }
    }
}

extension SettingsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 20.0
        }
        return 0.0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let random = Int.random(in: 1..<5)
        return random
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "Ash"
//        cell.backgroundColor = .red
        return cell
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 15
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
//        cell.textLabel?.text = "Index Path \(indexPath.row)"
//        cell.detailTextLabel?.text = "devesh"
//        return cell
//    }
    
    
}
