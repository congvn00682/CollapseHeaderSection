//
//  Student.swift
//  CollapseHeaderSection
//
//  Created by Chung on 5/29/18.
//  Copyright © 2018 Chung. All rights reserved.
//

import Foundation

class Student {
    var firstName: String = ""
    var lastName: String = ""
    var nameOfClass: String = ""
    var id: String = ""
    var dob: String?
    
    init(dictionary: Dictionary<AnyHashable,Any>) {
         firstName = dictionary["firstName"] as? String ?? ""
        lastName = dictionary["lastName"] as? String ?? ""
        nameOfClass = dictionary["class"] as? String ?? ""
        id = dictionary["id"] as? String ?? ""
        dob = dictionary["dob"] as? String ?? "" 
    }
}
