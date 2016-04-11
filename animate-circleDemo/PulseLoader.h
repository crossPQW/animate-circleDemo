//
//  PulseLoader.h
//  animate-circleDemo
//
//  Created by 黄少华 on 16/4/11.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PulseLoader : UIView

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;
- (void)startToPulse;
@end
