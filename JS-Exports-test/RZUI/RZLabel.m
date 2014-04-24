//
//  Label.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZLabel.h"
#import "Utils.h"

@interface RZLabel ()

@property NSString *nodeClass;

@end

@implementation RZLabel

@synthesize
nodeClass=_nodeClass,
background=_background,
frame=_frame,
cornerRadius=_cornerRadius;

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
    RZLabel *button = [[RZLabel alloc] init];
    return button;
}

-(void)removeFromSuperView:(UILabel *)label
{
    [label removeFromSuperview];
}

-(void)setBackground:(UIColor *)background
{
    [super setBackgroundColor:background];
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

-(CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

-(void)set:(JSValue *)config
{
    if (![config[@"alpha"] isUndefined]) {
        self.alpha = [config[@"alpha"] toDouble];
    }
    
    if (![config[@"background"] isUndefined]) {
        self.backgroundColor = [Utils makeColor:[config[@"background"] toArray]];
    }
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [Utils makeFrame:[config[@"frame"] toArray]];
        NSLog(@"%@", [config[@"frame"] toArray]);
    }
    
    if (![config[@"font"] isUndefined]) {
        double size = [config[@"fontSize"] isUndefined] ? 16 : [config[@"fontSize"] toDouble];
        [self setFont:[UIFont fontWithName:[config[@"font"] toString] size:size]];
    }
    if (![config[@"text"] isUndefined]) {
        [self setText:[config[@"text"] toString]];
    }
    if (![config[@"preferredMaxLayoutWidth"] isUndefined]) {
        self.preferredMaxLayoutWidth = [config[@"preferredMaxLayoutWidth"] toDouble];
    }
    
    if (![config[@"textColor"] isUndefined]) {
        [self setTextColor:[Utils makeColor:[config[@"textColor"] toArray]]];
    }
    
    if (![config[@"lineBreakMode"] isUndefined]) {
        NSString *lineBreakMode = [config[@"lineBreakMode"] toString];
        
        if ([lineBreakMode isEqual:@"NSLineBreakByWordWrapping"]) [self setLineBreakMode:NSLineBreakByWordWrapping];
        if ([lineBreakMode isEqual:@"NSLineBreakByCharWrapping"]) [self setLineBreakMode:NSLineBreakByCharWrapping];
        if ([lineBreakMode isEqual:@"NSLineBreakByClipping"]) [self setLineBreakMode:NSLineBreakByClipping];
        if ([lineBreakMode isEqual:@"NSLineBreakByTruncatingHead"]) [self setLineBreakMode:NSLineBreakByTruncatingHead];
        if ([lineBreakMode isEqual:@"NSLineBreakByTruncatingTail"]) [self setLineBreakMode:NSLineBreakByTruncatingTail];
        if ([lineBreakMode isEqual:@"NSLineBreakByTruncatingMiddle"]) [self setLineBreakMode:NSLineBreakByTruncatingMiddle];
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
    
    if (![config[@"class"] isUndefined]) {
        _nodeClass = [config[@"class"] toString];
    }
    
}

- (JSValue *)get:(NSString *)attr
{
    if ([attr isEqualToString:@"alpha"]) {
        return [JSValue valueWithDouble:self.alpha inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"background"]) {
        return [JSValue valueWithObject:[Utils getColor:self.backgroundColor]inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"frame"]) {
        return [JSValue valueWithRect:self.frame inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"font"]) {
        return [JSValue valueWithObject:self.font.fontName inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"textColor"]) {
        return [JSValue valueWithObject:[Utils getColor:[self textColor]] inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"lines"]) {
        return [JSValue valueWithDouble:self.numberOfLines inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"textAlign"]) {
        switch (self.textAlignment) {
            case 0:
                return [JSValue valueWithObject:@"left" inContext:[JSContext currentContext]];
                break;
            
            case 1:
                return [JSValue valueWithObject:@"center" inContext:[JSContext currentContext]];
                break;
                
            case 2:
                return [JSValue valueWithObject:@"right" inContext:[JSContext currentContext]];
                break;
                
            case 3:
                return [JSValue valueWithObject:@"justified" inContext:[JSContext currentContext]];
                break;
            
            case 4: // fall through
                
            default:
                return [JSValue valueWithObject:@"natural" inContext:[JSContext currentContext]];
                break;
        }
    }
    
    else if ([attr isEqualToString:@"class"]) {
        return [JSValue valueWithObject:_nodeClass inContext:[JSContext currentContext]];
    }
    
    return nil;
}

- (void)append:(UIView *)child {
    [self addSubview:child];
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
