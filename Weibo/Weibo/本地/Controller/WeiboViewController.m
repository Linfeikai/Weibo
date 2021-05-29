//
//  WeiboViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/22.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "WeiboViewController.h"
#import "editViewController.h"
#import "onlineWeiboTableViewCell.h"


@interface WeiboViewController ()<UITableViewDelegate,UITableViewDataSource,editViewControllerDelegate>
//存放微博
@property(nonatomic,strong,readwrite) NSMutableArray *weiboList;
@property(nonatomic,strong,readwrite) NSMutableArray *weiboAllList;
@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSString *dataPath;


@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarItem.title = @"首页";
    self.tabBarItem.image = [UIImage imageNamed:@"home"];
    [self createButton];
    //创建按钮
    //创造词典来存储发送的微博
    _weiboAllList = [NSMutableArray arrayWithObject:@"hello,这是我发的第一条微博！"];
    
    
    //创建本地化文件存储微博
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docuPath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *dataPath = [docuPath stringByAppendingPathComponent:@"WbData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error: &creatError];
    
    NSString *weiboDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    self.dataPath = weiboDataPath;
    [fileManager createFileAtPath:weiboDataPath contents:nil attributes:nil];
    
   // [_weiboList writeToFile:weiboDataPath atomically:YES];
    
   // _weiboAllList = [NSMutableArray arrayWithContentsOfFile:weiboDataPath];
    //NSLog(@"%@",_weiboAllList);
    //创建微博列表
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, self.view.frame.size.width,600)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

    
    
    
     }


#pragma mark - 创建按钮
-(void)createButton
{

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn1.frame = CGRectMake(320, 80, 80, 80);
    [btn1 setTitle:@"写微博" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pushController)forControlEvents:UIControlEventTouchUpInside];
}
-(void)pushController
{
    editViewController *editViewController1 = [[editViewController alloc]init];
    editViewController1.delegate = self;
    [self.navigationController pushViewController:editViewController1 animated:YES];
    
}

#pragma mark - 实现代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.weiboAllList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    onlineWeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[onlineWeiboTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.contentLable.text  = _weiboAllList[indexPath.row];
    cell.profileImage.image = [UIImage imageNamed:@"profile.jpg"];
    cell.likeView.text = @"999";
    cell.commentView.text = @"999";
    cell.repost.text = @"999";
    cell.nameLable.text = @"林霏开";
    cell.timeLable.text = @"just now";
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 350;
}

-(void)showText:(NSString *)text{
    [_weiboAllList addObject:text];
    [_weiboAllList writeToFile:_dataPath atomically:YES];
    [self.tableView reloadData];
}


@end
