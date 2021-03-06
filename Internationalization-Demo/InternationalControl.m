//
//  InternationalControl.m
//  Internationalization-Demo
//
//  Created by 白晓 on 2017/4/11.
//  Copyright © 2017年 白晓. All rights reserved.
//

#import "InternationalControl.h"

@implementation InternationalControl
static NSBundle *bundle = nil;
+ ( NSBundle * )bundle{
    
    return bundle;
    
}
+(void)initUserLanguage{
    
    
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [def valueForKey:@"userLanguage"];
    
    if(string.length == 0){
        
//      获取系统当前语言版本(中文zh-Hans,英文en)
        
//        NSArray* languages = [def objectForKey:@"AppleLanguages"];
//        NSLog(@"def_key%@",[def valueForKey:@"en"]);
//        NSLog(@"languages = %@",languages);
//        NSString *currentLanguage = [languages objectAtIndex:0];
        
        NSArray *languages = [NSLocale preferredLanguages];
        NSString *currentLanguage = [languages objectAtIndex:0];
        NSLog(@"currentLanguage = %@" , currentLanguage);
        string = currentLanguage;
        
        [def setValue:currentLanguage forKey:@"userLanguage"];
        
        [def synchronize];//持久化，不加的话不会保存
        
    }
    
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    
    bundle = [NSBundle bundleWithPath:path];//生成bundle
}
+(NSString *)userLanguage{
    
    
//    NSUserDefaults *def1 = [NSUserDefaults standardUserDefaults];
//    [def1 setValue:@"0" forKey:@"sysLanguage"];
//    [def1 synchronize];
    
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *language = [def valueForKey:@"userLanguage"];
    
    return language;
    
    
}
+(void)setUserlanguage:(NSString *)language{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    
    bundle = [NSBundle bundleWithPath:path];
    
    //2.持久化
    [def setValue:language forKey:@"userLanguage"];
    
    [def synchronize];
}
@end
