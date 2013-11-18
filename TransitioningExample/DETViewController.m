//
//  DETViewController.m
//  TransitioningExample
//
//  Created by Brad Dillon on 9/17/13.
//  Copyright (c) 2013 Double Encore. All rights reserved.
//

#import "DETViewController.h"
#import "DETOtherViewController.h"
#import "DETTransitioningDelegate.h"
@interface DETViewController ()
@property (weak, nonatomic) IBOutlet UIView *activeView;

@end

@implementation DETViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.activeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognized:)]];
}


- (void)tapRecognized:(UIGestureRecognizer*)sender
{
    DETOtherViewController *other = [DETOtherViewController new];
    other.transitioningDelegate = self.transitioningDelegate;
    DETTransitioningDelegate* transitioningDelegate=self.transitioningDelegate;
    transitioningDelegate.triggerViewRect=[sender view].frame;
    [self presentViewController:other animated:YES completion:nil];
}

@end
