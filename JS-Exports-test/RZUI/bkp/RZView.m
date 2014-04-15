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

@interface RZView ()

@property NSString *nodeClass;

@end

@implementation RZView

@synthesize
nodeClass=_nodeClass,
alpha=_alpha,
background=_background,
frame=_frame,
cornerRadius=_cornerRadius;

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

-(void)setAlpha:(CGFloat)alpha
{
    [super setAlpha:alpha];
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
        self.backgroundColor = [config[@"background"] toObjectOfClass:[UIColor class]];
    }
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [config[@"frame"] toRect];
    }
    
    if (![config[@"cornerRadius"] isUndefined]) {
        self.layer.cornerRadius = [config[@"cornerRadius"] toDouble];
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
        return [JSValue valueWithObject:self.backgroundColor inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"frame"]) {
        return [JSValue valueWithRect:self.frame inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"cornerRadius"]) {
        return [JSValue valueWithDouble:self.layer.cornerRadius inContext:[JSContext currentContext]];
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
