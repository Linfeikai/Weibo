//
//  statusItem.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/28.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "imageItem.h"

@implementation imageItem

-(void)configWithDictionay:(NSDictionary *)dictionary
{
    self.pic_url = [dictionary objectForKey:@"thumbnail_pic"];
}
@end
