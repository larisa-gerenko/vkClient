//
//  AllGroupsController.swift
//  interface_ios
//
//  Created by Larisa on 22.03.2022.
//

import UIKit

class AllGroupsController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let reuseIdentifier = "reuseIdentifier"
    var sourceGroupsArray = [Group]()
    var groupsArray = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        createGroupsArray()
        groupsArray = sourceGroupsArray
        tableView.reloadData()
    }
    
    func createGroupsArray() {
        
        let group1 = Group(avatarImagePath: "1", name: "Snail", description: "I'm little Snail")
        sourceGroupsArray.append(group1)
        
        let group2 = Group(avatarImagePath: "2", name: "Alien", description: "I'm little Alien")
        sourceGroupsArray.append(group2)
        
        let group3 = Group(avatarImagePath: "3", name: "Penguin", description: "I'm little Penguin")
        sourceGroupsArray.append(group3)
        
        let group4 = Group(avatarImagePath: "4", name: "Kitty", description: "I'm little Kitty")
        sourceGroupsArray.append(group4)
        
        let group5 = Group(avatarImagePath: "5", name: "Tree", description: "I'm little Tree")
        sourceGroupsArray.append(group5)
    }

}

extension AllGroupsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            groupsArray = sourceGroupsArray
        }
        else {
            groupsArray = sourceGroupsArray.filter({groupItem in
                groupItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}

extension AllGroupsController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
        func isContain(group: Group) -> Bool {
    
           return  Storage.shared.getMyGroups().contains { groupItem in groupItem.name == group.name}
        }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(groupsArray[indexPath.row].name) group")
        
      //  NotificationCenter.default.post(name: allGroupsRowPressed, object: groupsArray[indexPath.row])
        if !isContain(group: groupsArray[indexPath.row]) {
        // Storage.shared.myGroups.append(groupsArray[indexPath.row])
            Storage.shared.addGroups(group: groupsArray[indexPath.row])
        }
    }
}

extension AllGroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(group: groupsArray[indexPath.row])
        return cell
    }
    
    
}
