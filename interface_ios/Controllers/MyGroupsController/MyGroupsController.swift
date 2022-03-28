//
//  MyGroupsController.swift
//  interface_ios
//
//  Created by Larisa on 28.03.2022.
//

import UIKit

class MyGroupsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "reuseIdentifier"
    //var groupsArray = [Group]()
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
   //   NotificationCenter.default.addObserver(self, selector: #selector(allGroupsRowPress(_:)), name: allGroupsRowPressed, object: nil)
        
    }
    
    
//    func isContain(group: Group) -> Bool {
//
//       return groupsArray.contains { groupItem in groupItem.name == group.name}
//    }


//    @objc func allGroupsRowPress(_ notification: Notification) {
//
//        guard let group = notification.object as? Group else {return}
//        if !isContain(group: group) {
//            groupsArray.append(group)
//        }
//    }
    
}

extension MyGroupsController: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(Storage.shared.getMyGroups()[indexPath.row].name) group")
    }
}

extension MyGroupsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.shared.getMyGroups().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(group: Storage.shared.getMyGroups()[indexPath.row])
        return cell
    }
}
