//
//  View.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "View.h"
#import "Utils.h"
#import "AppContext.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

+ (View *)create
{
    View *view = [[View alloc] init];
    return view;
}

-(void)set:(NSDictionary *)config
{
    if (config[@"alpha"] != nil) {
        self.alpha = [config[@"alpha"] floatValue];
    }
    
    if (config[@"background"] != nil) {
        self.backgroundColor = (UIColor *)config[@"background"];
    }
    
    if (config[@"frame"] != nil) {
        self.frame = [Utils makeFrame:config[@"frame"]];
    }
    
    if (config[@"cornerRadius"] != nil) {
        self.layer.cornerRadius = [config[@"cornerRadius"] floatValue];
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
