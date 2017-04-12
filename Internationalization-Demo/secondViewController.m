//
//  secondViewController.m
//  Internationalization-Demo
//
//  Created by 白晓 on 2017/4/11.
//  Copyright © 2017年 白晓. All rights reserved.
//

#import "secondViewController.h"
#import "InternationalControl.h"


@interface secondViewController (){
    UILabel *_label;
    UIImageView *_imageView1;
}


@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:@"changeLanguage" object:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //注册通知，用于接收改变语言的通知
    
    [InternationalControl initUserLanguage];//初始化应用语言
    NSBundle *bundle = [InternationalControl bundle];
    
    NSString *inviteMsg = [bundle localizedStringForKey:@"key" value:nil table:@"Localizable"];
    NSString *imageName = [bundle localizedStringForKey:@"imageName" value:nil table:@"Localizable"];
    
  
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
    
    NSLog(@"123123");
}
-(void)changeLanguage{
    
    _label.text = [[InternationalControl bundle] localizedStringForKey:@"key" value:nil table:@"Localizable"];
    _imageView1.image = [UIImage imageNamed:[[InternationalControl bundle] localizedStringForKey:@"imageName" value:nil table:@"Localizable"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
