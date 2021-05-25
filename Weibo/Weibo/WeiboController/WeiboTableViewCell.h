//
//  WeiboTableViewCell.h
//  Weibo
//
//  Created by Linfeikai on 2021/5/24.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeiboTableViewCell : UITableViewCell


@property(nonatomic,strong,readwrite) UIImageView *profileImage;
@property(nonatomic,strong,readwrite) UILabel *nameLable;
@property(nonatomic,strong,readwrite) UILabel *timeLable;
@property(nonatomic,strong,readwrite) UILabel *contentLable;
@property(nonatomic,strong,readwrite) UIView *forwardView;
@property(nonatomic,strong,readwrite) UIView *commentView;
@property(nonatomic,strong,readwrite) UIView *likeView;



@end

NS_ASSUME_NONNULL_END
