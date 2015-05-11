//
//  Desk.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class Desk: JHObject {
    var staticObjects = [AnyObject]()
    
    override var description: String {
        get {
            var seatCount = 0
            for obj in staticObjects {
                if obj.isKindOfClass(Seat.self) {
                    seatCount++
                }
            }
            
            var desc = "桌子周围放着\(seatCount)条凳子。"
            return desc
        }
    }
    
    init(dict: NSDictionary) {
        super.init()
        
        for (key, value) in dict {
            let k = key as! String
            if k.hasPrefix("seat") {
                let seat = Seat()
                staticObjects.append(seat)
            }
        }
    }
    
    func serve(food: String) {
        println("上了一份\(food)")
    }
   
}
