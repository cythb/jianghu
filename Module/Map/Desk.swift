//
//  Desk.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class Desk: MObject {
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
    
    override init(dict: NSDictionary) {
        super.init(dict: dict)
        
        for (key, value) in dict {
            let k = key as! String
            if k.hasPrefix("seat") {
                let seat = Seat(dict: [String: String]())
                staticObjects.append(seat)
            }
        }
    }
    
    func serve(food: String) -> String {
        let rsp = "上了一份\(food)"
        println(rsp)
        return rsp
    }
   
}
