//
//  View.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZView.h"
#import "Utils.h"
#import "AppContext.h"

@implementation RZView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

+ (RZView *)create
{
    RZView *view = [[RZView alloc] init];
    return view;
}

-(void)set:(JSValue *)config
{
    self.alpha = [config[@"alpha"] isUndefined] ? 1.0 : [config[@"alpha"] toDouble];
    
    if (![config[@"background"] isUndefined]) {
        self.backgroundColor = [config[@"background"] toObjectOfClass:[UIColor class]];
    }
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [config[@"frame"] toRect];
    }
    
    if (![config[@"cornerRadius"] isUndefined]) {
        self.layer.cornerRadius = [config[@"cornerRadius"] toDouble];
    }
}

- (void)addSubNode:(UIView *)subNode {
    [self addSubview:subNode];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
