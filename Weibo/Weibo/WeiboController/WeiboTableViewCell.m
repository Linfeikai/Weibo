//
//  WeiboTableViewCell.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/24.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "WeiboTableViewCell.h"

@interface WeiboTableViewCell ()

@property(nonatomic,strong,readwrite) UIImageView *profileImage;
@property(nonatomic,strong,readwrite) UILabel *nameLable;
@property(nonatomic,strong,readwrite) UILabel *timeLable;
@property(nonatomic,strong,readwrite) UIView *forwardView;
@property(nonatomic,strong,readwrite) UIView *commentView;
@property(nonatomic,strong,readwrite) UIView *likeView;




@end
@implementation WeiboTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        [self.contentView addSubview:({
        
        self.profileImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        self.profileImage.frame = CGRectMake(20, 20, 50, 50);
        self.profileImage.image = [UIImage imageNamed:@"profile.ipg"];
        self.profileImage;
    
        })];
        
        [self.contentView addSubview:({
            
            self.nameLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
            self.nameLable.textColor = [UIColor redColor];
            self.nameLable.text = @"xm";
            self.nameLable;
            
        })];
        
        [self.contentView addSubview:({
            
            self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 100, 100)];
            self.timeLable.textColor = [UIColor greenColor];
            self.timeLable.text = @"2002月4月8日";
            self.timeLable;
            
        })];
            

        
        [self.contentView addSubview:({
            
            self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 30, 30)];
            self.timeLable.textColor = [UIColor greenColor];
            self.timeLable.text = @"wsm";
            self.timeLable;
            
        })];
    
        
    }
    return self;
        
}

@end
