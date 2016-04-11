//
//  ViewController.m
//  animate-circleDemo
//
//  Created by 黄少华 on 16/4/11.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "ViewController.h"
#import "PulseLoader.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *pgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PulseLoader *loader = [[PulseLoader alloc] initWithFrame:CGRectMake(0, 0, 100, 100) color:[UIColor greenColor]];
    
    loader.center = self.view.center;
    [self.view addSubview:loader];
    
    [loader startToPulse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
