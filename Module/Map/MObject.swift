//
//  MObject.swift
//  jianghu
//
//  Created by 汤海波 on 5/13/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class MObject: NSObject {
    var name = ""
    var desc = ""
    var actions = [String: String]()
    
    init(dict: NSDictionary) {
        name = dict["name"] as! String
        desc = dict["description"] as! String
        for (key, value) in dict["actions"] as! [String: String] {
            actions[key] = value
        }
        super.init()
    }
}
