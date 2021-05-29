//
//  editViewController.h
//  Weibo
//
//  Created by Linfeikai on 2021/5/24.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol editViewControllerDelegate <NSObject>

-(void)showText:(NSString *)text;

@end



@interface editViewController : UIViewController<UITextViewDelegate>
@property(nonatomic,strong,readwrite)UITextView *textView;
@property(nonatomic,weak,readwrite) id<editViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
