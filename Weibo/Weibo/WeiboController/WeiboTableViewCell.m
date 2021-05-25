//
//  WeiboTableViewCell.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/24.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "WeiboTableViewCell.h"
#import "editViewController.h"

@interface WeiboTableViewCell ()

@end
@implementation WeiboTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        [self.contentView addSubview:({
        
        self.profileImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        self.profileImage.frame = CGRectMake(20, 20, 50, 50);
        self.profileImage.image = [UIImage imageNamed:@"profile.jpg"];
        self.profileImage;
    
        })];
//
        [self.contentView addSubview:({

            self.contentLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
            self.contentLable.textColor = [UIColor redColor];
            self.contentLable.text = @"???";
            self.contentLable;

        })];

        [self.contentView addSubview:({

            self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 200, 200)];
            self.timeLable.textColor = [UIColor greenColor];
            self.timeLable.text = @"2002月4月8日";
            self.timeLable;

        })];
//
//
//
//        [self.contentView addSubview:({
//
//            self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 30, 30)];
//            self.timeLable.textColor = [UIColor greenColor];
//            self.timeLable.text = @"wsm";
//            self.timeLable;
//
//        })];
    
        
    }
    return self;
        
}
@end
