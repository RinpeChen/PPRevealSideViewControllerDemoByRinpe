//
//  ViewController.m
//  侧滑(PPRevealSideViewController)
//
//  Created by RinpeChen on 15/12/14.
//  Copyright © 2015年 miaoqukeji. All rights reserved.
//

#import "ViewController.h"
#import "PPRevealSideViewController.h"
#import "RPOneViewController.h"
#import "RPTwoTableViewController.h"

#define RPOffset 100     // 设置主控制器移动后留下的视图宽度

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(showLeft)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"Right"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(showRight)];
    
    // 手势左右滑动屏幕
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showRight)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showLeft)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    
    self.navigationItem.rightBarButtonItem = right;
}

// 显示左边抽屉
- (void)showLeft
{
    RPTwoTableViewController *c = [[RPTwoTableViewController alloc] init];
    
    // 设置主控制器移动后遗留的空间
    [self.revealSideViewController changeOffset:RPOffset forDirection:PPRevealSideDirectionLeft];
    
    // 显示子控制器
    [self.revealSideViewController pushViewController:c onDirection:PPRevealSideDirectionLeft withOffset:RPOffset animated:YES completion:^{
        PPRSLog(@"This is the left!");
    }];
    PP_RELEASE(c);
}

// 显示右边
- (void)showRight
{
    RPOneViewController *c = [[RPOneViewController alloc] init];
    
    // 设置主控制器移动后遗留的空间
    [self.revealSideViewController changeOffset:RPOffset forDirection:PPRevealSideDirectionRight];
    
    // 显示子控制器
    [self.revealSideViewController pushViewController:c onDirection:PPRevealSideDirectionRight withOffset:RPOffset animated:YES completion:^{
        PPRSLog(@"This is the right!");
    }];
    PP_RELEASE(c);
}


@end
