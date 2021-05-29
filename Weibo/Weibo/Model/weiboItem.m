//
//  weiboItem.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/27.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "weiboItem.h"

@implementation weiboItem
-(void)configWithDictionay:(NSDictionary *)dictionary
{
    self.postTime = [dictionary objectForKey:@"created_at"] ;
    self.text = [dictionary objectForKey:@"text"];
    self.comments =  [dictionary objectForKey:@"comments_count"];
    self.likes = [dictionary objectForKey:@"attitudes_count"];
    self.reposts = [dictionary objectForKey:@"reposts_count"];
}
@end
