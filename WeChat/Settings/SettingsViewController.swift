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
        tableView.register(WCSettingsProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCellID")
        tableView.register(WCSettingsTableViewCell.self, forCellReuseIdentifier: "SettingCellID")
        getDataFromServices()
    }
    
    @IBAction func goToNext(_ sender: UIBarButtonItem) {
        let viewController = CustomViewController()
//        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: false)
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
        return settingViewModel.numberOfSections()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.numberOfRows(sectionIndex: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = settingViewModel.dataAtIndex(index: indexPath)
        switch data?.type {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellID", for: indexPath) as? WCSettingsProfileTableViewCell else {
                return UITableViewCell()
            }
            cell.updateContents(data: data)
            return cell
        case .other:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCellID", for: indexPath) as? WCSettingsTableViewCell else {
                return UITableViewCell()
            }
            if data?.showDisclosure == true {
                cell.accessoryType = .disclosureIndicator
            }
            cell.updateContents(data: data)
            return cell
        case nil:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = CustomViewController()
        if (indexPath.section == 0 && indexPath.row == 1) {

            
        } else if (indexPath.section == 1 && indexPath.row == 1){
            viewController.view.backgroundColor = .yellow
        } else {
            viewController.view.backgroundColor = .red
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
