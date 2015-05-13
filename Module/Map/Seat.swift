//
//  Seat.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class Seat: MObject {
    var isEmpty = true
   
    func sit() {
        println("坐到\(self)上")
    }
    func standUp() {
        println("从\(self)站了起来")
    }
}
