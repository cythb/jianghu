//
//  Door.swift
//  jianghu
//
//  Created by 汤海波 on 5/7/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

class Door: JHObject {
    var isOpen = false
    
    // MARK: - 功能
    func open() {
        println("打开\(self)")
    }
    
    func close() {
        println("关上\(self)")
    }
}
