//
//  MessageViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/22.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 420,400)];
    view.image = [UIImage imageNamed:@"moon.jpg"];
    UIImageView *view2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 400, 460,430)];
    view2.image = [UIImage imageNamed:@"heart.jpg"];
    [self.view addSubview:view];
    [self.view addSubview:view2];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often w ant to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
