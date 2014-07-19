//
//  AppUtility.m
//  iCareer
//
//  Created by YANGRui on 14-3-6.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "AppUtility.h"
#import <CommonCrypto/CommonDigest.h>
#import "Reachability.h"
@implementation AppUtility

+ (NSString *)getNibNameFromViewController:(NSString *)vc
{
    NSString *nibName;
    if (ISIP5)
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone5",vc];
    }
    else
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone4",vc];
    }
    return nibName;
}

#pragma mark - 验证相关数据
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];

}
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];

}

#pragma mark -计算时间

+ (NSDate *)dateAfterDay:(int)day
{
    NSDate * sendDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    // NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:day];
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:sendDate options:0];
    return dateAfterDay;
}

+ (NSString *)curentDate
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDate = [df stringFromDate:[NSDate date]];
    return currentDate;
}


#pragma mark - 存储少量数据
+ (id)getObjectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)storeObject:(id)obj forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)removeObjectForkey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - 计算文字的高度
+ (CGSize)getLabelSizeWithText:(NSString *)text font:(int)fontSize width:(float)width
{
    UIFont *font = [UIFont fontWithName:@"Arial" size:fontSize];
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
   
    NSDictionary *attr = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    return  [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

#pragma mark - 判断输入的字符是不是纯数字
+ (BOOL)isDightWithText:(NSString *)text
{
    for (NSInteger i = 0;i < text.length;i ++)
    {
        char c = [text characterAtIndex:i];
        if (!(c<='9'&&c>='0'))
        {
            return NO;
        }
    }
    return YES;
}


#pragma mark - MD5加密

+ (NSString *)md5String:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

#pragma mark - 检查网络连接
+ (BOOL)isNetworkAvaliable
{
     BOOL avaliable = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus]!=NotReachable;
    if (!avaliable)
    {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"当前无网络,请检查网络连接是否正常"];
        [alert show];
    }
    return avaliable;
}

#pragma mark - 弹出一个提示视图
+(void)showAlertWithMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

+(NSInteger)numberNotInArray:(NSArray *)array
{
    //DLog(@"array = %@",array);
    int number = arc4random()%100+1;
    NSNumber *num = @(number);
    if ([array containsObject:num])
    {
        return 0;
    }
    return num.integerValue;
}

@end
