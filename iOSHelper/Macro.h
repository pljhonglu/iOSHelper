//
//  Macro.h
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#ifndef iOSHelper_Macro_h
#define iOSHelper_Macro_h

// log
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

// 字符串处理
#define FormatStr(fmt, ...) [NSString stringWithFormat:fmt, ##__VA_ARGS__]

//dictionatry 取值NULL处理, 为空的话用给定的defultValue作为默认值
#define DicValueForKey(dic,defultValue,key) [[dic objectForKey:key] class] ==  [NSNull class] ? defultValue : [dic objectForKey:key]

//系统版本
#define SystermVersion [[UIDevice currentDevice] systemVersion].intValue
//设备类型
#define Isiphone5 ([[UIScreen mainScreen] bounds].size.height > 480 ? YES : NO)
//可用屏幕的高度，iOS7以下状态栏部分不可用
#define Screen_height (SystermVersion >= 7 ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.height-20)
//可用区域高度，7之前的20px不能用，7之后的20px不要用
#define AvailableHight ([[UIScreen mainScreen] bounds].size.height-20)
// Y 的起始坐标，iOS7从状态栏下边开始
#define SystermYStart (SystermVersion >= 7 ? 20 : 0)

//快速创建 rgb 颜色 例如 UIColorFromRGB(0x067AB5)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RootNav  ((UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController)
#define PoptoRootVCWithAnimated(value) [RootNav popViewControllerAnimated:value]

#define alert(msg) [[[UIAlertView alloc]initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show]


static inline BOOL IsEmpty(id thing) {
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

static inline NSString *StringFromObject(id object) {
	if (object == nil || [object isEqual:[NSNull null]]) {
		return @"";
	} else if ([object isKindOfClass:[NSString class]]) {
		return object;
	} else if ([object respondsToSelector:@selector(stringValue)]){
		return [object stringValue];
	} else {
		return [object description];
	}
}

#endif
