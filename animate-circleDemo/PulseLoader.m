//
//  PulseLoader.m
//  animate-circleDemo
//
//  Created by 黄少华 on 16/4/11.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "PulseLoader.h"

@interface PulseLoader()

@property (nonatomic, strong) CAShapeLayer *pulseLayer;
@end
@implementation PulseLoader

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    if (self = [super initWithFrame:frame]) {
        [self setupWithColor:color];
    }
    return self;
}

- (void)setupWithColor:(UIColor*)color {
    self.pulseLayer = [[CAShapeLayer alloc] init];
    self.pulseLayer.frame = self.bounds;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.pulseLayer.path = path.CGPath;
    self.pulseLayer.fillColor = color.CGColor;
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.frame = self.bounds;
    replicatorLayer.instanceCount = 5;
    replicatorLayer.instanceDelay = 0.3;
    [replicatorLayer addSublayer:self.pulseLayer];
    self.pulseLayer.opaque = 0;
    [self.layer addSublayer:replicatorLayer];
}

- (void)startToPulse {
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[[self aplphAnimate], [self scaleAnimation]];
    group.duration = 1.5f;
    group.autoreverses = NO;
    group.repeatCount = HUGE;
    [self.pulseLayer addAnimation:group forKey:@"pluseAnimate"];
    
}

- (CABasicAnimation *)aplphAnimate {
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animate.fromValue = @1.0;
    animate.toValue = @0;
    return animate;
}

-(CABasicAnimation *)scaleAnimation{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D t1 = CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0);
    CATransform3D t2 = CATransform3DScale(CATransform3DIdentity, 3.0, 3.0, 0.0);
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:t1];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:t2];
    return scaleAnimation;
}
//- (CABasicAnimation *)scaleAnimate {
//    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"scale"];
//    animate.fromValue = @1;
//    animate.toValue = @3;
//    return animate;
//}

@end;