//
//  onlineWeiboTableViewCell.h
//  Weibo
//
//  Created by Linfeikai on 2021/5/27.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface onlineWeiboTableViewCell : UITableViewCell


@property(nonatomic,strong,readwrite) UIButton *collectBtn;
@property(nonatomic,strong,readwrite) UIImageView *profileImage;
@property(nonatomic,strong,readwrite) UIImageView *picUrl;
@property(nonatomic,strong,readwrite) UILabel *nameLable;
@property(nonatomic,strong,readwrite) UILabel *timeLable;
@property(nonatomic,strong,readwrite) UILabel *contentLable;
@property(nonatomic,strong,readwrite) UILabel *repost;
@property(nonatomic,strong,readwrite) UILabel *commentView;
@property(nonatomic,strong,readwrite) UILabel *likeView;

@end

NS_ASSUME_NONNULL_END
