//
//  alItem.h
//  Weibo
//
//  Created by Linfeikai on 2021/5/28.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "weiboItem.h"
#import "userItem.h"
#import "imageItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface alItem : NSObject
@property(nonatomic,copy,readwrite)weiboItem *weiboItem1;
@property(nonatomic,copy,readwrite)userItem *userItem1;
@property(nonatomic,copy,readwrite)imageItem *imageItem1;

-(void)configWithStatusDictionay:(NSDictionary *)dict1;
-(void)configWithUserDictionary:(NSDictionary*)dict2;
-(void)configWithPicDictionary:(NSDictionary*)dict3;
@end

NS_ASSUME_NONNULL_END
