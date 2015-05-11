//
//  MJiuLou.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class MJiuLou: NSObject {
    var places = [MPlace]()
    var mapInfos = [String: String]()
    
    override var description: String {
        get {
            if mapInfos["description"] != nil {
                return mapInfos["description"]!
            }else{
                return ""
            }
        }
    }
    
    init(dict: NSDictionary) {
        for (key, value) in dict {
            let k = key as! String
            if k.hasPrefix("place") {
                let place = MPlace(dict: value as! NSDictionary)
                places.append(place)
            }
        }
        
        super.init()
    }
    
    // MARK: Ations
    func acionEnter() -> String {
        let msg = mapInfos["actions.enter"]!
        println("\(msg)")
        return msg
    }
    
    func acionExit() -> String {
        let msg = mapInfos["actions.exit"]!
        println("\(msg)")
        return msg
    }
}
