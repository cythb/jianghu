//
//  MJiuLou.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

@objc
class MJiuLou: MObject {
    var places = [MPlace]()
    
    override var description: String {
        get {
            return desc
        }
    }
    
    override init(dict: NSDictionary) {
        for (key, value) in dict {
            let k = key as! String
            if k == "name" || k == "description" || k == "actions" {
                continue
            }
            
            if k.hasPrefix("place") {
                let place = MPlace(dict: value as! NSDictionary)
                places.append(place)
            }
        }
        
        super.init(dict: dict)
    }
    
    // MARK: Ations
    func acionEnter() -> String {
        let msg = actions["enter"]!
        println("\(msg)")
        return msg
    }
    
    func acionExit() -> String {
        let msg = actions["exit"]!
        println("\(msg)")
        return msg
    }

    func acionLook() -> String {
        let msg = actions["look"]!
        println("\(msg)")
        return msg
    }
}
