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
    func preprogressMapData() -> String {
        let mapPath = NSBundle.mainBundle().pathForResource("map", ofType: "json")
        let text = NSString(contentsOfFile: mapPath!, encoding: NSUTF8StringEncoding, error: nil)
        let data = NSData(contentsOfFile: mapPath!)
        let info = NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments, error: nil) as! NSDictionary
        
        let regex = NSRegularExpression(pattern: "\\$[a-z\\.]+[_]?[a-z\\.]+\\s{1}",
            options: .UseUnixLineSeparators | .UseUnicodeWordBoundaries,
            error: nil)
        var processedText = text!
        while true {
            let range = NSMakeRange(0, processedText.length)
            var matches = regex?.matchesInString(processedText as String, options: .allZeros, range: range) as? [NSTextCheckingResult]
            if matches == nil || matches!.count < 1 {
                break
            }
            
            let matchRange = matches![0].range as NSRange
            let varStringWithFunc = processedText.substringWithRange(matchRange)
            processedText = MapLoader.formatSubItem(varStringWithFunc, format:processedText as String, info: info)
        }
        return processedText as String
    }
    
    func load() -> [AnyObject] {
        var results = [AnyObject]()
        
        let text = self.preprogressMapData()
        let data = text.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var error: NSError? = nil
        let resDict = NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments, error: &error) as! NSDictionary
        for (key, value) in resDict {
            let k = key as! String
            var className = k.componentsSeparatedByString("_").first!
            if className == "jiulou" {
                let json = value as! NSDictionary
                let jiulou = MJiuLou(dict: json)
                results.append(jiulou)
            }
        }
        
        return results
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
        
        let nameComponents = name.componentsSeparatedByString(".")
        var tmp = info
        var format = ""
        for path in nameComponents {
            let subDict = tmp[path] as? NSDictionary
            if let d = subDict {
                tmp = d
            }else{
                format = tmp[path] as! String
            }
        }
        return format
    }
    
    class func action(params: [AnyObject]) -> String? {
        let name = params[1] as! String
        return "actions://"+name
    }
    
    class func jhcount(params: [AnyObject]) -> String? {
        let name = params[1] as! String
        let infos = params[0] as! NSDictionary
        // TODO:...
        return "3"
    }
}
