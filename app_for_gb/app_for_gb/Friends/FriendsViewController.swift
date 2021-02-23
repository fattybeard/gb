//
//  FriendsViewController.swift
//  app_for_gb
//
//  Created by Иван Макаров on 20.02.2021.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    let friends = [
        Friend(name: "Василий Пупкин", photo: UIImage(named: "vpupkin")),
        Friend(name: "Владимир Иванов", photo: UIImage(named: "vivanov")),
        Friend(name: "Вероника Гущина", photo: UIImage(named: "vguschina")),
        Friend(name: "Дмитрий Розов", photo: UIImage(named: "drozov")),
        Friend(name: "Илона Золотаревич", photo: UIImage(named: "izolotarevich")),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendPhoto",
           let senderCell = sender as? FriendCell,
           let cellIndexPath = tableView.indexPath(for: senderCell),
           let friendPageViewController = segue.destination as? FriendPageViewController {
            let selectedFriend = friends[cellIndexPath.row]
            
            friendPageViewController.displayedFriend = selectedFriend
        }
        
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = friends[indexPath.row].name
        cell.userAvatar.image = friends[indexPath.row].photo
        return cell
    }
    
}
