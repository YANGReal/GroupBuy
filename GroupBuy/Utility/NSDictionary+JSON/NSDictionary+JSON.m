//
//  NSDictionary+JSON.m
//  ToolFramework
//
//  Created by  Jason on 13-1-28.
//  Copyright (c) 2013年 BlueBox. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (id)getAttribute:(NSString *)attribute
{
   return ([self objectForKey:attribute] == [NSNull null] ? @"" : [self objectForKey:attribute]);
}

/*- (id)getAttribute:(id)key
 {
 return ([self objectForKey:key] == [NSNull null] ? @"" : [self objectForKey:key]);
 }
*/


- (int)intAttribute:(NSString *)attribute defaultValue:(int)defaultValue {
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value intValue];
    }
    return defaultValue;
}

- (NSInteger)integerAttribute:(NSString *)attribute defaultValue:(NSInteger)defaultValue {
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value integerValue];
    }
    return defaultValue;
}

- (float)floatAttribute:(NSString *)attribute defaultValue:(float)defaultValue {
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value floatValue];
    }
    return defaultValue;
}

- (BOOL)boolAttribute:(NSString *)attribute defaultValue:(BOOL)defalutValue {
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value boolValue];
    }
    return defalutValue;
}

- (NSString *)stringAttribute:(NSString *)attribute
{
    id object = [self getAttribute:attribute];
    if ([object isKindOfClass:[NSString class]])
    {
        return object;
    }
    if ([object isKindOfClass:[NSNumber class]])
    {
        NSNumber *num = (NSNumber *)object;
        NSString *str = [num stringValue];
        return str;
    }
    return [self getAttribute:attribute];
    
}

@end
