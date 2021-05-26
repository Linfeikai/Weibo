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


@interface WeiboViewController ()<UITableViewDelegate,UITableViewDataSource,editViewControllerDelegate>
//存放微博
@property(nonatomic,strong,readwrite) NSMutableDictionary *weiboList;
@property(nonatomic,strong,readwrite) NSMutableDictionary *weiboAllList;
@property(nonatomic,strong,readwrite) UITableView *tableview;

@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButton];
    //创建按钮
    //创造词典来存储发送的微博
    _weiboList = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"value1",@"key1", @"value2",@"key2",nil];
    
    
    //创建本地化文件存储微博
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docuPath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *dataPath = [docuPath stringByAppendingPathComponent:@"WbData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error: &creatError];
    
    NSString *weiboDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    [fileManager createFileAtPath:weiboDataPath contents:nil attributes:nil];
    
    [_weiboList writeToFile:weiboDataPath atomically:YES];
    
    _weiboAllList = [NSMutableDictionary dictionaryWithContentsOfFile:weiboDataPath];
    NSLog(@"%@",_weiboAllList);
    //创建微博列表
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, self.view.frame.size.width,600)];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    [self.view addSubview:_tableview];

    
    
    
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
    WeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[WeiboTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    NSArray *array1 = _weiboAllList.allKeys;
    NSArray *array2 = _weiboAllList.allValues;
    cell.contentLable.text  = array1[indexPath.row];
    cell.timeLable.text = array2[indexPath.row];
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)showText:(NSString *)text{
    [self.weiboAllList setObject:text forKey:text];
    [self.tableview reloadData];
}


@end
