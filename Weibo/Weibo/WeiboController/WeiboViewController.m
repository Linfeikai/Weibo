//
//  WeiboViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/22.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "WeiboViewController.h"
#import "editViewController.h"
#import "WeiboTableViewCell.h"


@interface WeiboViewController ()<editViewControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn1.frame = CGRectMake(320, 80, 80, 80);
    [btn1 setTitle:@"写微博" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pushController)forControlEvents:UIControlEventTouchUpInside];
    
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    

     }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)pushController
{
    editViewController *testView = [[editViewController alloc]init];
    testView.delegate = self;
    [self.navigationController pushViewController:testView animated:YES];
}

#pragma mark - 实现反向传值

-(void)showText:(NSString *)text
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100 )];
    label.text = text;
    [self.view addSubview:label];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[WeiboTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

@end
