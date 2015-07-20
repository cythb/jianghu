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
        if let n = dict["name"] as? String {
            name = n
        }
        if let d = dict["description"] as? String {
            desc = d
        }
        if let a = dict["actions"] as? [String: String] {
            for (key, value) in a {
                actions[key] = value
            }
        }
        super.init()
    }
    
    func look() {
        if !desc.isEmpty {
            println(desc)
        }else{
            println("看上去没什么特别的.")
        }
    }
}
