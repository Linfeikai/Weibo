//
//  AppDelegate.m
//  Weibo
//
//  Created by Linfeikai on 2021/5/19.
//  Copyright © 2021 Linfeikai. All rights reserved.
//
#import "AppDelegate.h"
#import "MyViewController.h"
#import "MessageViewController.h"
#import "WeiboViewController.h"
#import "onlineWeiboViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabbarController = [[UITabBarController alloc]init];
    WeiboViewController *viewController1 = [[WeiboViewController alloc]init];
    onlineWeiboViewController *viewController2 = [[onlineWeiboViewController alloc]init];
    MessageViewController *viewController3 = [[MessageViewController alloc]init];
      MyViewController *viewController4= [[MyViewController alloc]init];

    viewController2.tabBarItem.title = @"发现";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"search"];
    viewController3.tabBarItem.title = @"消息";
    viewController3.tabBarItem.image = [UIImage imageNamed:@"email"];
    viewController4.tabBarItem.title = @"我的";
    viewController4.tabBarItem.image = [UIImage imageNamed:@"browse"];
    

    [tabbarController setViewControllers:@[viewController1,viewController2,viewController3,viewController4]];
    tabbarController.delegate = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
   self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
