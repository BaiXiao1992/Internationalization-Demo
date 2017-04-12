//
//  ViewController.m
//  Internationalization-Demo
//
//  Created by 白晓 on 17/1/4.
//  Copyright © 2017年 白晓. All rights reserved.
//

#import "ViewController.h"
#import "InternationalControl.h"
#import "secondViewController.h"

@interface ViewController (){
    UILabel *_label;
    UIImageView *_imageView1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册通知，用于接收改变语言的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:@"changeLanguage" object:nil];
    
    [InternationalControl initUserLanguage];//初始化应用语言
    NSBundle *bundle = [InternationalControl bundle];
    
    NSString *inviteMsg = [bundle localizedStringForKey:@"key" value:nil table:@"Localizable"];
    NSString *imageName = [bundle localizedStringForKey:@"imageName" value:nil table:@"Localizable"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(200, 50, 50, 50);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"123" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    NSArray *languages = [NSLocale preferredLanguages];
//    NSString *currentLanguage = [languages objectAtIndex:0];
//    NSLog(@"currentLanguage = %@" , currentLanguage);
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 50, 50)];
    _label.backgroundColor = [UIColor magentaColor];
    _label.text = inviteMsg;
//    label.text = NSLocalizedStringFromTable(@"key", label.text, @"key");
    [self.view addSubview:_label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 150, 200, 200)];
    imageView.image = [UIImage imageNamed:@"cake.png"];
    [self.view addSubview:imageView];
    
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 400, 100, 100)];
    _imageView1.image = [UIImage imageNamed:imageName];
    [self.view addSubview:_imageView1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(250, 400, 50, 50);
    [button2 setTitle:@"下一页" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    NSLog(@"!@");
    
}

- (void)buttonClick{
    secondViewController *second = [[secondViewController alloc] init];
    [self presentViewController:second animated:YES completion:nil];
}

- (void)buttonClick:(id)sender{
    NSString *lan = [InternationalControl userLanguage];
    
    if([lan isEqualToString:@"en"]){//判断当前的语言，进行改变
        [InternationalControl setUserlanguage:@"zh-Hans"];
    }else{
        [InternationalControl setUserlanguage:@"en"];
    }
    //改变完成之后发送通知，告诉其他页面修改完成，提示刷新界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
}

-(void)changeLanguage{
    
    _label.text = [[InternationalControl bundle] localizedStringForKey:@"key" value:nil table:@"Localizable"];
    _imageView1.image = [UIImage imageNamed:[[InternationalControl bundle] localizedStringForKey:@"imageName" value:nil table:@"Localizable"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
