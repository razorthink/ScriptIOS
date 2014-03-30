//
//  Label.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "Label.h"
#import "Utils.h"

@implementation Label

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (id)create
{
    Label *button = [[Label alloc] init];
    return button;
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
    
    if (config[@"text"] != nil) {
        [self setText:config[@"text"]];
    }
    
    if (config[@"textColor"] != nil) {
        [self setTextColor:(UIColor *)config[@"textColor"]];
    }
    
    if (config[@"font"] != nil) {
        float size = config[@"fontSize"] == nil ? 16 : [config[@"fontSize"] floatValue];
        [self setFont:[UIFont fontWithName:config[@"font"] size:size]];
    }
    
    if (config[@"textAlign"] != nil) {
        [self setTextAlignment:NSTextAlignmentCenter];
    }
    
    if (config[@"lines"] != nil) {
        self.numberOfLines = [config[@"lines"] integerValue];
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
