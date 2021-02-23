//
//  GroupViewController.swift
//  app_for_gb
//
//  Created by Иван Макаров on 20.02.2021.
//

import UIKit

class GroupViewController: UITableViewController {
    
    var activeGroups = [
        Group(name: "Группа №1", photo: UIImage(named: "gr1")),
        Group(name: "Группа №2", photo: UIImage(named: "gr2")),
        Group(name: "Группа №3", photo: UIImage(named: "gr3")),
        Group(name: "Группа №4", photo: UIImage(named: "gr4")),
        Group(name: "Группа №5", photo: UIImage(named: "gr5")),
    ]
    
    @IBOutlet var groupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if let addGroupViewController = segue.source as? AddGroupViewController,
           let selectedIndexPath = addGroupViewController.tableView.indexPathForSelectedRow {
            let selectedGroup = addGroupViewController.groups[selectedIndexPath.row]
            if !activeGroups.contains(selectedGroup) {
                activeGroups.append(selectedGroup)
                tableView.reloadData()
            }
            
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        cell.groupLabel.text = activeGroups[indexPath.row].name
        cell.groupAvatar.image = activeGroups[indexPath.row].photo
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            activeGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
