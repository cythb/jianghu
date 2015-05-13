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
        desc = MapLoader.formatItem("description", info: dict)
        for (key, value) in dict["actions"] as! NSDictionary {
            let k = (key as! String)
            let name = "actions." + k
            actions[k] = MapLoader.formatItem(name, info: dict)
        }
        super.init()
    }
}
