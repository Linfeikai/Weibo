//
//  onlineWeiboTableViewCell.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/27.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "onlineWeiboTableViewCell.h"

#define textFont [UIFont systemFontOfSize:20]
#define nameFont [UIFont systemFontOfSize:15]
#define commentFont [UIFont systemFontOfSize:16]


@implementation onlineWeiboTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
        [self.contentView addSubview:({
            
            self.profileImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
            self.profileImage.layer.cornerRadius = 40;
            self.profileImage.layer.masksToBounds = YES;
            self.profileImage;
        })];
        
        [self.contentView addSubview:({
            
            self.contentLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 400, 300)];
            self.contentLable.textColor = [UIColor blackColor];
            self.contentLable.numberOfLines = 9;
            self.contentLable.font = textFont;
            self.contentLable;
            
        })];
        
        [self.contentView addSubview:({
            
            self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 175 , 100)];
            self.timeLable.textColor = [UIColor grayColor];
            self.timeLable;
            
        })];
        
        
        [self.contentView addSubview:({
            
            self.nameLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 150 , 100)];
            self.nameLable.textColor = [UIColor blackColor];
            self.nameLable.font = nameFont;
            self.nameLable;
            
        })];
        

        [self.contentView addSubview:({

            self.repost = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 50 , 50)];
            self.repost.textColor = [UIColor grayColor];
            self.repost.font = commentFont;
            self.repost;

        })];

        
//

        [self.contentView addSubview:({

            self.commentView = [[UILabel alloc]initWithFrame:CGRectMake(200, 300, 50 , 50)];
            self.commentView.textColor = [UIColor grayColor];
            self.commentView.font = commentFont;
            self.commentView;

        })];
        

        [self.contentView addSubview:({

            self.likeView = [[UILabel alloc]initWithFrame:CGRectMake(350, 300, 50 , 50)];
            self.likeView.textColor = [UIColor grayColor];
            self.likeView.font = commentFont;
            self.likeView;

        })];
        
        [self.contentView addSubview:({
            
            self.repost = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 50 , 50)];
            self.repost.textColor = [UIColor grayColor];
            self.repost.font = commentFont;
            self.repost;
            
        })];
        
        
        [self.contentView addSubview:({
            
            self.picUrl = [[UIImageView alloc]initWithFrame:CGRectMake(10, 200, 100 , 100)];
            self.picUrl;
            
        })];
        
        
        [self.contentView addSubview:({
            
            self.collectBtn = [[UIButton alloc]initWithFrame:CGRectMake(350, 20, 50 , 50)];
            [self.collectBtn setImage:[UIImage imageNamed:@"favorite"] forState:(UIControlStateNormal)];
            [self.collectBtn setImage:[UIImage imageNamed:@"favorite-filling"] forState:UIControlStateHighlighted];
            self.collectBtn;
            
        })];
        
        UIImageView *repost = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_icon_retweet"]];
        repost.frame = CGRectMake(0, 300, 50, 50);
        UIImageView *comment = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_icon_comment"]];
        comment.frame = CGRectMake(150, 300, 50, 50);
        UIImageView *like = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_icon_unlike"]];
        like.frame = CGRectMake(300, 300, 50, 50);
        [self addSubview:like];
        [self addSubview:repost];
        [self addSubview:comment];
        
        
    }
    return self;
}


@end
