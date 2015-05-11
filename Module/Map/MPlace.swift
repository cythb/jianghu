//
//  Builder.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class MPlace: NSObject {
    var staticObjects = [AnyObject]()
    var dynamicObjects = [AnyObject]()
    
    override var description: String {
        get {
            var deskCount = 0
            var deskDescs = "\n"
            for obj in staticObjects {
                if obj.isKindOfClass(Desk.self) {
                    deskCount++
                    deskDescs += obj.description + "\n"
                }
            }
            var desc = "地面上摆着\(deskCount)桌子。"
            desc += deskDescs
            return desc
        }
    }
    
    init(dict: NSDictionary) {
        super.init()
        
        for (key, value) in dict {
            let k = key as! String
            if k.hasPrefix("desk") {
                let desk = Desk(dict: value as! NSDictionary)
                staticObjects.append(desk)
            }
        }
    }
    
    func sayHere(someWords: String) -> Void {
        println("==》\(someWords)")
    }
}
