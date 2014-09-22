//
//  InterfaceUrl.h
//  GroupBuy
//
//  Created by andy on 14-9-12.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//


#define BASE_URL @"http://www.xruncity.com/api/"

//登录
#define LOGIN_URL [NSString stringWithFormat:@"%@login", BASE_URL]

//注册
#define REGISTER_URL [NSString stringWithFormat:@"%@register", BASE_URL]

//获取用户信息
#define USER_INFO [NSString stringWithFormat:@"%@userInfo", BASE_URL]

//更新昵称
#define UPDATE_NICK [NSString stringWithFormat:@"%@updateNick", BASE_URL]

//更新手机号
#define UPDATE_MOBILE [NSString stringWithFormat:@"%@updateMobile", BASE_URL]

//更新性别
#define UPDATE_GENDER [NSString stringWithFormat:@"%@updateGender", BASE_URL]

//忘记密码
#define RESET_PSW [NSString stringWithFormat:@"%@resetPassword", BASE_URL]

//更新密码
#define UPDATE_PSW [NSString stringWithFormat:@"%@updatePassword", BASE_URL]

//获取收藏
#define MY_COLLECTION [NSString stringWithFormat:@"%@myCollection", BASE_URL]

//拍卖
#define MY_AUCTION [NSString stringWithFormat:@"%@myAuctionCollection", BASE_URL]

//待付款
#define MY_PAYING [NSString stringWithFormat:@"%@myPaying", BASE_URL]

//已付款
#define MY_PAID [NSString stringWithFormat:@"%@myPaid", BASE_URL]