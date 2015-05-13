//
//  Counter.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class Counter: MObject {
    // MARK: - 功能
    /**
    算账
    */
    func checkout() -> String {
        let msg = "一共花掉8两白银"
        println(msg)
        return msg
    }
}
