//
//  Button.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "Button.h"
#import "Utils.h"

@implementation Button

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
    Button *button = [[Button alloc] init];
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
    
    if (config[@"cornerRadius"] != nil) {
        self.layer.cornerRadius = [config[@"cornerRadius"] floatValue];
    }
    
    if (config[@"title"] != nil) {
        [self setTitle:config[@"title"] forState:UIControlStateNormal];
    }
    
    if (config[@"titleColor"] != nil) {
        [self setTitleColor:(UIColor *)config[@"titleColor"] forState:UIControlStateNormal];
    }
    
    if (config[@"font"] != nil) {
        float size = config[@"fontSize"] == nil ? 16 : [config[@"fontSize"] floatValue];
        [self.titleLabel setFont:[UIFont fontWithName:config[@"font"] size:size]];
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
