//
//  wbListLoader.h
//  Weibo
//
//  Created by Linfeikai on 2021/5/27.
//  Copyright © 2021 Linfeikai. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "WebViewController.h"
#import "alItem.h"
@protocol wbListLoaderDelegate <NSObject>
-(void)showTextWithweiboItemArray:(NSArray *)weiboItemArray anduserItemArray:(NSArray *)userItemArray andimageItemArray:(NSArray *)imageItemArray;
@end

NS_ASSUME_NONNULL_BEGIN

@interface wbListLoader : NSObject<NSURLSessionDelegate,NSURLSessionDataDelegate>
-(void)loadListData;
@property(nonatomic,weak,readwrite) id<wbListLoaderDelegate> delegate;
@property(nonatomic,copy,readwrite)NSMutableArray <alItem*>*allItemArray;
@end

NS_ASSUME_NONNULL_END
