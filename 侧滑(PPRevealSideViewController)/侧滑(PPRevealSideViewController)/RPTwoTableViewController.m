//
//  RPTwoTableViewController.m
//  侧滑(PPRevealSideViewController)
//
//  Created by RinpeChen on 15/12/14.
//  Copyright © 2015年 miaoqukeji. All rights reserved.
//

#import "RPTwoTableViewController.h"
#import "ViewController.h"

@interface RPTwoTableViewController ()

@end

@implementation RPTwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"test ------------- %d", indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *vc = [[ViewController alloc] init];
    vc.view.backgroundColor = [UIColor greenColor];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end
