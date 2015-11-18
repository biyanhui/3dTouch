//
//  Person.swift
//  PreviewAction
//
//  Created by 毕研辉 on 15/10/29.
//  Copyright © 2015年 biyanhui. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String!
    var phone: String!
    var introduce: String!

    override init() {
        
    }
    
    init(name: String, phone: String, introduce: String) {
        self.name = name
        self.phone = phone
        self.introduce = introduce
    }
}
