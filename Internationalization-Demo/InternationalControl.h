//
//  InternationalControl.h
//  Internationalization-Demo
//
//  Created by 白晓 on 2017/4/11.
//  Copyright © 2017年 白晓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InternationalControl : NSObject
+(NSBundle *)bundle;//获取当前资源文件

+(void)initUserLanguage;//初始化语言文件

+(NSString *)userLanguage;//获取应用当前语言

+(void)setUserlanguage:(NSString *)language;//设置当前语言
@end
