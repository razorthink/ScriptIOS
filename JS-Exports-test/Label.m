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

-(void)set:(JSValue *)config
{
    self.alpha = [config[@"alpha"] isUndefined] ? 1.0 : [config[@"alpha"] toDouble];
    
    if (![config[@"background"] isUndefined]) {
        self.backgroundColor = [config[@"background"] toObjectOfClass:[UIColor class]];
    }
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [config[@"frame"] toRect];
    }
    
    if (![config[@"font"] isUndefined]) {
        double size = [config[@"fontSize"] isUndefined] ? 16 : [config[@"fontSize"] toDouble];
        [self setFont:[UIFont fontWithName:[config[@"font"] toString] size:size]];
    }
    if (![config[@"text"] isUndefined]) {
        [self setText:[config[@"text"] toString]];
    }
    
    if (![config[@"textColor"] isUndefined]) {
        [self setTextColor:[config[@"textColor"] toObjectOfClass:[UIColor class]]];
    }
    
    if (![config[@"textAlign"] isUndefined]) {
        NSString *align = [config[@"textAlign"] toString];
        
        if ([align isEqual:@"left"]) [self setTextAlignment:NSTextAlignmentLeft];
        if ([align isEqual:@"right"]) [self setTextAlignment:NSTextAlignmentRight];
        if ([align isEqual:@"center"]) [self setTextAlignment:NSTextAlignmentCenter];
        if ([align isEqual:@"justified"]) [self setTextAlignment:NSTextAlignmentJustified];
    }
    
    if (![config[@"lines"] isUndefined]) {
        self.numberOfLines = [config[@"lines"] toInt32];
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
