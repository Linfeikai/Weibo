//
//  WebViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/21.
//  Copyright © 2021 Linfeikai. All rights reserved.
//
#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "weiboItem.h"

@interface WebViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite)WKWebView *webview;
@property(nonatomic,strong,readwrite)NSString *access_token;
@property(nonatomic,strong,readwrite)NSString *uid;
-(void)storeLogInDataWith:(NSDictionary*)dict;
@end

@implementation WebViewController

//这是webview第一个跳转到的页面
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size                                                                  .width,self.view.frame.size.height-88 )];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    
//    forcelogin=true
    NSString *urlstring = @"https://api.weibo.com/oauth2/authorize?client_id=2589579850&response_type=code&forcelogin=true&redirect_uri=https://api.weibo.com/oauth2/default.html";
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [self.webview loadRequest:request];
    
    NSLog(@"now i have a access_token call: %@",_access_token);
}

# pragma mark - WKWebView delegate methods

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"hi!");
}


//每一次加载一个新的页面，当加载完成的时候会调用这个方法
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    NSString *url = [self.webview.URL absoluteString];
    
    //这个方法用来得到gaccess_token
    if ([url hasPrefix:@"https://api.weibo.com/oauth2/default.html?"]){
        [self getAccess_tokenWith:url];
    }
}

# pragma mark - 获取access_token

-(void)getAccess_tokenWith:(NSString*)url 
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
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlstring cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    // 把数据请求从默认的GET换成POST
    [request setHTTPMethod:@"POST"];//？？？？？？？？
    NSString *str = @"type=focus-c";
    NSData *data1 = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data1];
    //c.连接服务器
    //    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil
    //     error:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error)
                    {
                                NSError *jsonError;
      NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                        NSLog(@"");
            self.access_token= [dictionary objectForKey:@"access_token"];
            self.uid = [dictionary objectForKey:@"uid"];
                        //在这里 把access_token存储到本地，然后从本地获取
                    [self storeLogInDataWith:dictionary];
                                      }];
        [dataTask resume];
    }

-(void)storeLogInDataWith:(NSDictionary *)dict;
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docuPath = [pathArray firstObject];
    NSString *data1 = [docuPath stringByAppendingPathComponent:@"WbData/loginData"];
    [dict writeToFile:data1 atomically:YES];

}




@end

//
//
//}




    







    //aaaaaaaaaa我拿到access_token了！！！！！！
    //        if(_access_token){
    //           // 获取用户数据：
    //            NSString *str2 = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=%@&uid=%@",_access_token,uid];
    //            NSURL *url2 = [NSURL URLWithString:str2];
    //            NSMutableURLRequest *request2 = [[NSMutableURLRequest alloc]initWithURL:url2 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //            [request2 setHTTPMethod:@"POST"];
    //       __unused     NSURLSessionDataTask *dataTask2 = [session dataTaskWithURL:url2 completionHandler:^(NSData *data,NSURLResponse *response,NSError *error)
    //                                               {
    //                                                   NSError *jsonError;
    //                                                   NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
    //                                                   NSLog(@"hello");
    //
    //
    //                                               }];
    //

//



//             如果获取到access_token，则授权成功，接下来是获取微博用户数据，与上面类似
//            if(_access_token)
//                {
//                        //根据微博开放平台的要求，填写相应数据
//                        NSString *str2=[NSString stringWithFormat:@"https://api.weibo.com/2/users/show.json?access_token=%@&uid=%@",_access_token,uid];
//                        NSURL *url2 = [NSURL URLWithString:str];
//                    NSMutableURLRequest *request2= [[NSMutableURLRequest alloc]initWithURL:url2 cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
//                        [request2 setHTTPMethod:@"POST"];
//            NSLog(@"successfully oauth 2.0 .is going to back ward");
//            [self.navigationController popToRootViewControllerAnimated:YES];
//                此次应该有一个弹窗！！
//                        NSData *received2= [NSURLConnection sendSynchronousRequest:request2 returningResponse:nil error:nil];
//                        NSDictionary *dictionary2 = [NSJSONSerialization JSONObjectWithData:received2 options:NSJSONReadingMutableContainers error:&error];
//                        输出接收到的字典，根据需要取相应的值
//                        NSLog(@"%@",dictionary);
