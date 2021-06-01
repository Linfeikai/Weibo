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


#pragma mark - 实现nscode代理方法

//序列化
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.pic_url forKey:@"thumbnail_pic"];
}

//反序列化
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self)
    {
        self.pic_url = [aDecoder decodeObjectForKey:@"thumbnail_pic"];
    }
    return self;
}

+(BOOL)supportsSecureCoding
{
    return YES;
}
@end
