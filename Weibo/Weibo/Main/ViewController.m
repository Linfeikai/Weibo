//
//  ViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/19.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "WebViewController.h"
@interface ViewController () <WKNavigationDelegate>
@property(nonatomic,strong,readwrite)WKWebView *webview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 //   self.loader = [[Loader alloc]init];
//    [_loader loadListData];
    //[self.view addSubview:({
     //   self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
       // self.webview.navigationDelegate = self;
    //    self.webview;
  //  })];
//    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2589579850&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html"]]];
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(200, 200, 50 , 50);
    [btn1 setTitle:@"按钮" forState:UIControlStateNormal];
    [btn1 setTitle:@"状态2" forState:UIControlStateSelected];
    [btn1 setTitle:@"状态3" forState:UIControlStateHighlighted];
    btn1.backgroundColor = [UIColor whiteColor];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];

    
    [self.view addSubview:view1];
    [self.view addSubview:btn1];
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushController)];
    [view1 addGestureRecognizer:tapgesture];

}

-(void)pushController
{
    WebViewController *webViewController = [[WebViewController alloc]init];
   
    [self.navigationController pushViewController:webViewController animated:YES];
}

@end
