//
//  weiboItem.h
//  Weibo
//
//  Created by Linfeikai on 2021/5/27.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface weiboItem : NSObject
//{
//    int comments;
//    int reposts;
//    int likes;
//}
@property(nonatomic,copy,readwrite)NSString *postTime;
@property(nonatomic,copy,readwrite)NSString *text;
@property(nonatomic,copy,readwrite)NSNumber *comments;
@property(nonatomic,copy,readwrite)NSNumber *reposts;
@property(nonatomic,copy,readwrite)NSNumber *likes;


-(void)configWithDictionay:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
