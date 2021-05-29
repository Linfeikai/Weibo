//
//  alItem.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/28.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "alItem.h"

@implementation alItem

-(void)configWithStatusDictionay:(NSDictionary *)dict1 andUserDictionary:(NSDictionary*)dict2 andPicDictionary:(NSDictionary*)dict3
{
    self.weiboItem1 = [[weiboItem alloc]init];
    [_weiboItem1 configWithDictionay:dict1];
    self.userItem1 = [[userItem alloc]init];
    [_userItem1 configWithDictionay:dict2];
    self.imageItem1 = [[imageItem alloc]init];
    [_imageItem1 configWithDictionay:dict3];
}
@end
