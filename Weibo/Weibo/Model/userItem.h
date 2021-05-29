//
//  userItem.h
//  Weibo
//
//  Created by Linfeikai on 2021/5/28.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface userItem : NSObject
@property(nonatomic,copy,readwrite)NSString *userProfileUrl;
@property(nonatomic,copy,readwrite)NSString *userName;
-(void)configWithDictionay:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
