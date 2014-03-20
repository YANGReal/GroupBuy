//
//  NBNetworkEngine.h
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompleteHander)(id jsonObject,BOOL success);


@interface NBNetworkEngine : NSObject

+ (void)loadDataWithURL:(NSString *)url params:(NSDictionary *)params completeHander:(CompleteHander)callBack;

+ (void)loadDataWithURL:(NSString *)url completeHander:(CompleteHander)callBack;

+ (void)uploadImageWithURL:(NSString *)url params:(NSDictionary *)params data:(NSData *)data completeHander:(CompleteHander)callBack;


@end
