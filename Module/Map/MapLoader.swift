//
//  MapLoader.swift
//  jianghu
//
//  Created by 汤海波 on 5/10/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

import UIKit

@objc
class MapLoader: NSObject {
    func load() -> [AnyObject] {
        var results = [AnyObject]()
        
        let mapPath = NSBundle.mainBundle().pathForResource("map", ofType: "json")
        let data = NSData(contentsOfFile: mapPath!)
        var error: NSError? = nil
        let resDict = NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments, error: &error) as! NSDictionary
        for (key, value) in resDict {
            let k = key as! String
            var className = k.componentsSeparatedByString("_").first!
            if className == "MJiuLou" {
                let json = value as! NSDictionary
                let jiulou = MJiuLou(dict: json)
                results.append(jiulou)
            }
        }
        
        return results
    }
    
    class func formatItem(item: String, info: NSDictionary) -> String {
        let itemComponents = item.componentsSeparatedByString(".")
        var tmp = info
        var format = ""
        for path in itemComponents {
            let subDict = tmp[path] as? NSDictionary
            if let d = subDict {
                tmp = d
            }else{
                format = tmp[path] as! String
            }
        }
        
        let regex = NSRegularExpression(pattern: "\\$[a-z_]+\\s",
            options: .UseUnixLineSeparators | .UseUnicodeWordBoundaries,
            error: nil)
        while true {
            let range = NSMakeRange(0, count(format))
            var matches = regex?.matchesInString(format, options: .allZeros, range: range) as? [NSTextCheckingResult]
            if matches == nil || matches!.count < 1 {
                break
            }
            
            let matchRange = matches![0].range as NSRange
            let varStringWithFunc = format.substringWithRange(matchRange)
            format = self.formatSubItem(varStringWithFunc, format:format, info: info)
        }
        
        return format
    }
    
    class func formatSubItem(item: String, format: String, info: NSDictionary) -> String {
        var itemTmp = item
        var formatTmp = format
        itemTmp = itemTmp.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " $") )
        let components:[AnyObject] = itemTmp.componentsSeparatedByString("_") // function_params
        var functionName = "getProperty"
        var params = [AnyObject]()
        params.append(info)
        if components.count > 1 {
            functionName = components[0] as! String
            params = params + components[1...(components.count-1)]
        }else{
            params.append(components[0])
        }
        let sel = Selector(functionName+":")
        let value = ReflectionHelper.hgPerformSelector(sel, withObject: params, receiver: self) as! String
        let range = format.rangeOfString(item,
            options: .LiteralSearch,
            range: nil,
            locale: nil)
        formatTmp.replaceRange(range!, with: value)
        return formatTmp
    }
    
    class func getProperty(params: [AnyObject]) -> String? {
        let info = params[0] as! NSDictionary
        let name = params[1] as! String
        return info[name] as? String
    }
    
    class func action(params: [AnyObject]) -> String? {
        let name = params[1] as! String
        return "actions://"+name
    }
    
    class func jhcount(params: [AnyObject]) -> String? {
        let name = params[1] as! String
        let infos = params[0] as! NSDictionary
        // TODO:...
        return "jhcount"
    }
}
