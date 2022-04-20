//
//  Session.swift
//  interface_ios
//
//  Created by Larisa on 11.04.2022.
//

import Foundation


class Session {
    static let shared = Session(token: "", userID: 0)
    
    let token: String
    let userID: Int
    
    private init(token: String, userID: Int){
        self.token = token
        self.userID = userID
    }
}
