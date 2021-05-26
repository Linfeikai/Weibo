//
//  onlineWeiboViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/26.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "onlineWeiboViewController.h"
#import "WebViewController.h"

@interface onlineWeiboViewController ()

@end

@implementation onlineWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButton];
    
    // Do any additional setup after loading the view.
}

-(void)createButton
{
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn1.frame = CGRectMake(320, 80, 80, 80);
    [btn1 setTitle:@"登录" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pushController)forControlEvents:UIControlEventTouchUpInside];
}
-(void)pushController
{
    WebViewController *WebViewController1 = [[WebViewController alloc]init];
    [self.navigationController pushViewController:WebViewController1 animated:YES];
    
}

@end
