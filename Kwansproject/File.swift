//
//  File.swift
//  Kwansproject
//
//  Created by Kanyanee P on 8/10/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import Foundation

struct requestContacts: Decodable {
    var contacts: [Contacts]
}
struct Contacts: Decodable{
    var id: String
    var name: String
    var email: String
    var address: String
    var gender: String
    var phone: Phone
    
}

struct Phone: Decodable {
    var mobile: String
    var home: String
    var office: String
}

//ไม่ต้องมี!


