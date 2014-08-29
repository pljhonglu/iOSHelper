//
//  NSString+HTMLReplace.h
//  AigoBest
//
//  Created by Aigo on 14-8-29.
//  Copyright (c) 2014年 Aigo. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NSString *(^HTMLReplaceBlock)(NSString *keyStr);

/**
 HTML 模板替换，HTML中要替换的使用 <% key %>包裹(注意key两侧有一个空格)
 
 会自动把key的值从给定的dictionary中提取出来，替换该部分
 
 同时可以通过实现callback方法，自定义key要替换的内容，返回nil即表示使用默认的方式替换
 */
@interface NSString (HTMLReplace)

/**
HTML 模板替换，把 <% key %> 包裹的内容替换成dict[key]或callback返回的内容

@param dict 模板映射的字典
@param cb   可通过这个callback来操作替换后的内容

@return 模板替换后的HTML文件
*/
- (NSString *)replaceKeyWithDic:(NSDictionary *)dict callBack:(HTMLReplaceBlock)cb;
@end
