//
//  WebViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/21.
//  Copyright © 2021 Linfeikai. All rights reserved.
//
#import "WebViewController.h"
#import <WebKit/WebKit.h>




@interface WebViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong,readwrite)WKWebView *webview;
@end

@implementation WebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2589579850&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html"]]];

    // Do any additional setup after loading the view.
   
        
}

# pragma mark - WKWebView delegate methods

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"hi");
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSString *url = [self.webview.URL absoluteString];
//如果已经授权成功
    if ([url hasPrefix:@"https://api.weibo.com/oauth2/default.html?"])
//找到”code=“的range
{
    NSRange rangeOne;
    rangeOne = [url rangeOfString:@"code="];
//根据url中”code=”的range来得到code参数的值的range
    NSRange range = NSMakeRange(rangeOne.length+rangeOne.location, url.length-(rangeOne.length+rangeOne.location));
  
//获取code的值
    NSString *codeString = [url substringWithRange:range];
    NSLog(@"code = :%@",codeString);
    
//access token:调用URL的string
    //1.定义一个可变字符串来存储新的url
    NSMutableString *muString = [[NSMutableString alloc]initWithString:@"https://api.weibo.com/oauth2/access_token?client_id=2589579850&client_secret=9391332e9bc4685806537719c49bd403&grant_type=authorization_code&redirect_uri=https://api.weibo.com/oauth2/default.html&code="];
// client_id、client_secret、redirect_uri后面的分别是App Key、App Secret、回调页面
    //2.把code加到url后面，得到获取access_token的url
        [muString appendString:codeString];
        NSLog(@"access_token url :%@",muString);
    // a.创建url
    NSURL *urlstring = [NSURL URLWithString:muString];
    // b.创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlstring cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    // 把数据请求从默认的GET换成POST
    [request setHTTPMethod:@"POST"];//？？？？？？？？
    NSString *str = @"type=focus-c";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //c.连接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

            NSError *error;
            //如何从str1中获取到access_token、uid
     NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableContainers error:&error];

            NSString *_access_token = [dictionary objectForKey:@"access_token"];
            NSString *uid=[dictionary objectForKey:@"uid"];
             //如果获取到access_token，则授权成功，接下来是获取微博用户数据，与上面类似
            if(_access_token)
                {
                        //根据微博开放平台的要求，填写相应数据
                        NSString *str2=[NSString stringWithFormat:@"https://api.weibo.com/2/users/show.json?access_token=%@&uid=%@",_access_token,uid];
                        NSURL *url2 = [NSURL URLWithString:str];
                    NSMutableURLRequest *request2= [[NSMutableURLRequest alloc]initWithURL:url2 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
                        [request2 setHTTPMethod:@"POST"];
            //            NSData *received2= [NSURLConnection sendSynchronousRequest:request2 returningResponse:nil error:nil];
            //            NSDictionary *dictionary2 = [NSJSONSerialization JSONObjectWithData:received2 options:NSJSONReadingMutableContainers error:&error];
                        //输出接收到的字典，根据需要取相应的值
         //               NSLog(@"%@",dictionary);
                    }
    
}
    
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
