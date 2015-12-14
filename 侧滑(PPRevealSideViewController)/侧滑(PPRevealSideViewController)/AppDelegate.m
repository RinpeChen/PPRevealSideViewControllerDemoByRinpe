//
//  AppDelegate.m
//  侧滑(PPRevealSideViewController)
//
//  Created by RinpeChen on 15/12/14.
//  Copyright © 2015年 miaoqukeji. All rights reserved.
//

#import "AppDelegate.h"
#import "PPRevealSideViewController.h"
#import "ViewController.h"

@interface AppDelegate () <PPRevealSideViewControllerDelegate>

@property (nonatomic, strong) PPRevealSideViewController *revealSideViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = PP_AUTORELEASE([[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]);
    
    // 创建抽屉的根控制器
    ViewController *main = [[ViewController alloc] init];
    main.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
    
    // 创建抽屉控制器并且设置其根控制器
    self.revealSideViewController = [[PPRevealSideViewController alloc] initWithRootViewController:nav];
    
    self.revealSideViewController.delegate = self;
    
    // 将抽屉控制器作为根控制器
    self.window.rootViewController = self.revealSideViewController;
    
    // 设置状态栏颜色
    self.revealSideViewController.fakeiOS7StatusBarColor = [UIColor orangeColor];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
