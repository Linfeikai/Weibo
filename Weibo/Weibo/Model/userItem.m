//
//  userItem.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/28.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "userItem.h"

@implementation userItem
-(void)configWithDictionay:(NSDictionary *)dictionary{
    self.userName = [dictionary objectForKey:@"name"];
    self.userProfileUrl = [dictionary objectForKey:@"profile_image_url"];
}

@end
