//
//  ViewController.m
//  MRBullet Example
//
//  Created by Roy on 2017/12/14.
//  Copyright © 2017年 Roy. All rights reserved.
//

#import "ViewController.h"
#import "MRBulletManager.h"
#import "MRBulletView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak typeof (self) weakSelf = self;
    
     [MRBulletManager sharedInstance].dataSources = [NSMutableArray arrayWithArray:@[
                                                    @"弹幕1~~~~~~~~",
                                                    @"弹幕2~~~~",
                                                    @"弹幕3~~~~~~~~~~~~~~~~",
                                                    @"弹幕4~~~~~~~~",
                                                    @"弹幕5~~~~",
                                                    @"弹幕6~~~~~~~~~~~~~~~~",
                                                    @"弹幕7~~~~~~~~",
                                                    @"弹幕8~~~~",
                                                    @"弹幕9~~~~~~~~~~~~~~~~",
                                                    @"弹幕10~~~~~~~~",
                                                    @"弹幕11~~~~",
                                                    @"弹幕12~~~~~~~~~~~~~~~~"
                                                    ]];
    [MRBulletManager sharedInstance].generateViewBlock = ^(MRBulletView *bulletView) {
        [weakSelf addBulletView:bulletView];
    };
    
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    startBtn.frame = CGRectMake(50, 100, 80, 40);
    [startBtn addTarget:self action:@selector(clickStartBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *stopBtn = [[UIButton alloc] init];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    [stopBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    stopBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-130, 100, 80, 40);
    [stopBtn addTarget:self action:@selector(clickStopBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
}

- (void)clickStartBtn
{
    [[MRBulletManager sharedInstance] mr_startBulletsAction];
}


- (void)clickStopBtn
{
    [[MRBulletManager sharedInstance] mr_stopAction];
}

- (void)addBulletView:(MRBulletView *)bulltView{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    bulltView.frame = CGRectMake(width,  300 + bulltView.trajectory * (bulltView.bounds.size.height + 10), bulltView.bounds.size.width, bulltView.bounds.size.height);
    [self.view addSubview:bulltView];
    
    [bulltView mr_startAnimation];
}

@end
