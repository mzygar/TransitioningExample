//
//  DETAnimatedTransitioning.m
//  TransitioningExample
//
//  Created by Brad Dillon on 9/17/13.
//  Copyright (c) 2013 Double Encore. All rights reserved.
//

#import "DETAnimatedTransitioning.h"

static NSTimeInterval const DETAnimatedTransitionDuration = 0.5f;
static NSTimeInterval const DETAnimatedTransitionDurationForMarco = 0.15f;

@implementation DETAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    if (self.reverse) {
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
    }
    else {
        toViewController.view.transform=[self transitionTransformForView:toViewController.view originRect:_triggerViewRect];
        [container addSubview:toViewController.view];
    }
    
    [UIView animateKeyframesWithDuration:DETAnimatedTransitionDuration delay:0 options:0 animations:^{
        if (self.reverse) {
            fromViewController.view.transform =[self transitionTransformForView:fromViewController.view originRect:_triggerViewRect];
        }
        else {
            toViewController.view.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return DETAnimatedTransitionDuration;
}

-(CGAffineTransform)transitionTransformForView:(UIView*)view originRect:(CGRect)originRect
{
    CGFloat height=CGRectGetHeight(view.bounds);
    CGFloat width=CGRectGetWidth(view.bounds);
    CGFloat scaleX=CGRectGetWidth(_triggerViewRect)/width;
    CGFloat scaleY=CGRectGetHeight(_triggerViewRect)/height;
    CGAffineTransform finalTransform=CGAffineTransformConcat(view.transform, CGAffineTransformMakeScale( scaleX, scaleY));
    finalTransform=CGAffineTransformTranslate(finalTransform,
                                                               -CGRectGetMidX(view.bounds)/scaleX,
                                                               -CGRectGetMidY(view.bounds)/scaleY);
    
    CGFloat midY=CGRectGetMidY(_triggerViewRect)/scaleY;
    CGFloat midX=CGRectGetMidX(_triggerViewRect)/scaleX;
    finalTransform=CGAffineTransformTranslate(finalTransform, midX, midY);
   
    return finalTransform;
}

@end
