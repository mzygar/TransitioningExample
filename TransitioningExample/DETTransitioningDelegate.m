//
//  DETTransitioningDelegate.m
//  TransitioningExample
//
//  Created by Brad Dillon on 9/17/13.
//  Copyright (c) 2013 Double Encore. All rights reserved.
//

#import "DETTransitioningDelegate.h"
#import "DETAnimatedTransitioning.h"

@implementation DETTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    DETAnimatedTransitioning *transitioning = [DETAnimatedTransitioning new];
    transitioning.triggerViewRect=_triggerViewRect;
    return transitioning;
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    DETAnimatedTransitioning *transitioning = [DETAnimatedTransitioning new];
    transitioning.reverse = YES;
    transitioning.triggerViewRect=_triggerViewRect;
    return transitioning;
}

@end
