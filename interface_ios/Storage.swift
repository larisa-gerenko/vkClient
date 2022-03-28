//
//  Storage.swift
//  interface_ios
//
//  Created by Larisa on 28.03.2022.
//

import UIKit

class Storage: NSObject {
    
    static let shared = Storage()

    private override init() {
        super.init()
    }
    
    private var myGroups = [Group]()
    
    func getMyGroups() -> [Group] {
        return myGroups
    }
    
    func addGroups(group: Group) {
        
        myGroups.append(group)
    }
}
