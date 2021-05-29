//
//  onlineWeiboViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/26.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "onlineWeiboViewController.h"
#import "WebViewController.h"
#import "onlineWeiboTableViewCell.h"
#import "wbListLoader.h"
#import "alItem.h"

@interface onlineWeiboViewController ()<UITableViewDelegate,UITableViewDataSource,wbListLoaderDelegate>
@property(nonatomic,strong,readwrite) UITableView *tableview;
@property(nonatomic,strong,readwrite) wbListLoader *listLoader;
@property(nonatomic,strong,readwrite) NSArray<userItem *>*userArray;
@property(nonatomic,strong,readwrite) NSArray<weiboItem *>*weiboArray;
@property(nonatomic,strong,readwrite) NSArray<imageItem *>*imageArray;

//-(void)createFile;
@end

@implementation onlineWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableview reloadData];
    [self createButton];
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, self.view.frame.size.width,self.view.frame.size.height - 160)];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    [self.view addSubview:_tableview];

    self.listLoader = [[wbListLoader alloc]init];
    [self.listLoader loadListData];
    self.listLoader.delegate = self;


}

-(void)createButton
{
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn1.frame = CGRectMake(0, 80, self.view.frame.size.width, 80);
    [btn1 setTitle:@"登录" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor whiteColor];
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

#pragma mark - 实现listloader代理方法
-(void)showTextWithweiboItemArray:(NSArray *)weiboItemArray anduserItemArray:(NSArray *)userItemArray andimageItemArray:(NSArray *)imageItemArray
{
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.weiboArray = weiboItemArray;
        self.userArray = userItemArray;
        self.imageArray = imageItemArray;
        [self.tableview reloadData];
    }];

    }

    

#pragma mark - 实现tableview代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _userArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    onlineWeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[onlineWeiboTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    UIImage *userImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.userArray[indexPath.row].userProfileUrl]]];
    cell.profileImage.image = userImage;
    UIImage *picImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageArray[indexPath.row].pic_url]]];
    cell.picUrl.image = picImage;
    cell.timeLable.text = self.weiboArray[indexPath.row].postTime;
    cell.nameLable.text =self.userArray[indexPath.row].userName;
    cell.contentLable.text = self.weiboArray[indexPath.row].text;

    
    NSNumber* repostNumber = self.weiboArray[indexPath.row].reposts;
    cell.repost.text = [NSString localizedStringWithFormat:@"%@", repostNumber];

    NSNumber* commentNumber = self.weiboArray[indexPath.row].comments;
    cell.commentView.text = [NSString localizedStringWithFormat:@"%@", commentNumber];

    
    NSNumber* likeNumber = self.weiboArray[indexPath.row].likes;
    cell.likeView.text = [NSString localizedStringWithFormat:@"%@", likeNumber];

    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 350;
}
@end
//
//-(void)createFile
//{
//    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docuPath = [pathArray firstObject];
//
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//
//    NSString *dataPath = [docuPath stringByAppendingPathComponent:@"WbData"];
//    NSError *creatError;
//    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error: &creatError];
//    NSString *weiboDataPath = [dataPath stringByAppendingPathComponent:@"loginData"];
//    [fileManager createFileAtPath:weiboDataPath contents:nil attributes:nil];
//    NSString *data1 = [docuPath stringByAppendingPathComponent:@"WbData/loginData"];
//}
