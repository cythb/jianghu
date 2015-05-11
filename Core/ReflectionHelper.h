//
//  ReflectionHelper.h
//  jianghu
//
//  Created by 汤海波 on 5/11/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReflectionHelper : NSObject

+ (id)hgPerformSelector:(SEL)sel withObject:(id)obj receiver:(id)receiver;
@end
