//
//  RZTableView.m
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 15/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZTableView.h"

@implementation RZTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)initWithRZScrollView:(RZScrollView *)scrollview
{
    scrollview = [[RZScrollView alloc] init];
}

+ (RZTableView *)create
{
    RZTableView *view = [[RZTableView alloc] init];
    return view;
}


@end
