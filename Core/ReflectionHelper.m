//
//  ReflectionHelper.m
//  jianghu
//
//  Created by 汤海波 on 5/11/15.
//  Copyright (c) 2015 iHugo. All rights reserved.
//

#import "ReflectionHelper.h"

@implementation ReflectionHelper

+ (id)hgPerformSelector:(SEL)sel withObject:(id)obj receiver:(id)receiver{
    if ([receiver respondsToSelector:sel]) {
        return [receiver performSelector:sel withObject:obj];
    }else{
        return nil;
    }
}

@end
