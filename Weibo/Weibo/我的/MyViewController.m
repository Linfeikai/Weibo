//
//  MyViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/22.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *proFile = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profile.jpg"]];
    proFile.frame = CGRectMake(100, 100, 200, 200);
    proFile.layer.cornerRadius = 100;
    proFile.layer.masksToBounds = YES;

    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(100, 250, 300, 200)];
    name.font = [UIFont fontWithName:@"Baskerville-BoldItalic"  size:20];
    name.text = @"Made by:Rachel Green";
    [self.view addSubview:name];
    [self.view addSubview:proFile];
    // Do any additional setup after loading the view.
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
