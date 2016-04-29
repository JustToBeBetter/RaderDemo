//
//  ViewController.m
//  RaderDemo
//
//  Created by 李金柱 on 15/12/4.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import "ViewController.h"
#import "Rader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    Rader *rader = [[Rader alloc]initWithFrame:self.view.bounds];
    [rader animate:YES];
    [self.view addSubview:rader];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
