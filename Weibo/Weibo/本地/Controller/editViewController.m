//
//  editViewController.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/24.
//  Copyright © 2021 Linfeikai. All rights reserved.
//

#import "editViewController.h"

@interface editViewController ()

@end

@implementation editViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //发微博界面属性
    _textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    _textView.textColor = [UIColor blackColor];
    _textView.font = [UIFont fontWithName:@"Arial" size:20];
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.text = @"请输入文本...";
    //根视图导航栏
    self.navigationItem.title = @"发微博";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送"
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(sendButtonClick)];
    
    [self.view addSubview:_textView];
}


-(void)sendButtonClick
//如果识别到点击 调用这个方法
//这个方法的作用 a.把当前对象的某个参数传给代理方法的参数 b.让画面退回rootcontroller
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(showText:)]){
        [self.delegate showText:self.textView.text];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
