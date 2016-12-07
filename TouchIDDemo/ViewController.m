//
//  ViewController.m
//  TouchIDDemo
//
//  Created by 董徐维 on 16/8/31.
//  Copyright © 2016年 董徐维. All rights reserved.
//

#import "ViewController.h"
#import "MTTouchHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([MTTouchHelper validateByTouchID])
    {
        NSLog(@"success");
    }
    else
        NSLog(@"fail");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
