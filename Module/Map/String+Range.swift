//
//  String+Range.swift
//  jianghu
//
//  Created by 汤海波 on 5/8/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import Foundation

extension String {
    func substringWithRange(aNSRange: NSRange) -> String {
        let str = (self as NSString).substringWithRange(aNSRange)
        return str as String
    }
    
    
}