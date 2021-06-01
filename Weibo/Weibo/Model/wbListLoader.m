//
//  wbListLoader.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/27.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "wbListLoader.h"
@implementation wbListLoader
-(void)loadListData
{

    //把本地的access_token和uid拿出来
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docuPath = [pathArray firstObject];
    NSString *data1 = [docuPath stringByAppendingPathComponent:@"WbData/loginData"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:data1];
    NSString *access_token = [dic objectForKey:@"access_token"];
    NSString *uid = [dic objectForKey:@"uid"];
    
    NSString *str2 = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=%@&uid=%@",access_token,uid];
    NSURL *url2 = [NSURL URLWithString:str2];
    NSMutableURLRequest *request2 = [[NSMutableURLRequest alloc]initWithURL:url2 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        NSURLSession *session = [NSURLSession sharedSession];
    //防止♻️引用
    __weak typeof (self) weakSelf = self;
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request2 completionHandler:^(NSData *data,NSURLResponse *response,NSError *error)
                                    {
                __strong typeof (weakSelf) strongSelf = weakSelf;
        NSError *jsonError;NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                                        
            //把weiboItem取出来
        NSArray *itemArray = [dictionary objectForKey:@"statuses"];
        NSMutableArray *weiboItemArray = @[].mutableCopy;
        for (NSDictionary *info in itemArray) {
                weiboItem *item = [[weiboItem alloc]init];
                    [item configWithDictionay:info];
                    [weiboItemArray addObject:item];
                    }
                                        
           //把userItem取出来
        NSArray *userArray = [dictionary objectForKey:@"statuses"] ;
        NSMutableArray *userItemArray = @[].mutableCopy;
                for (NSDictionary *info in userArray) {
                    userItem *item = [[userItem alloc]init];
                    NSDictionary *dic = [info objectForKey:@"user"];
                    [item configWithDictionay:dic];
                    [userItemArray addObject:item];
                }
                                        
               //把imageItem取出来
        NSArray *imageArray = [dictionary objectForKey:@"statuses"];
        NSMutableArray *imageItemArray = @[].mutableCopy;
                for (NSDictionary *info in imageArray) {
                    imageItem *item = [[imageItem alloc]init];
                    [item configWithDictionay:info];
                    [imageItemArray addObject:item];
                    }
                                        
               //代理传值
                        [strongSelf.delegate showTextWithweiboItemArray:weiboItemArray anduserItemArray:userItemArray andimageItemArray:imageItemArray];
                                          }];
    
        [dataTask resume];
    NSLog(@"");
    

}
@end
