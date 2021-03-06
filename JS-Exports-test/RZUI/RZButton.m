//
//  Button.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZButton.h"
#import "Utils.h"
#import "AppContext.h"

@interface RZButton ()

@property NSString *nodeClass;

@property JSManagedValue *tapHandler;

@end

@implementation RZButton

@synthesize tapHandler;
@synthesize
        nodeClass=_nodeClass,
        background=_background,
        frame=_frame,
        cornerRadius=_cornerRadius;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(runTapHandler) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

+ (id)create
{
    RZButton *button = [[RZButton alloc] init];
    return button;
}

-(void)removeFromSuperView:(UIButton *)button
{
    [button removeFromSuperview];
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

- (void)set:(JSValue *)config
{
    if (![config[@"alpha"] isUndefined]) {
        self.alpha = [config[@"alpha"] toDouble];
    }
    
    if (![config[@"background"] isUndefined]) {
        self.backgroundColor = [Utils makeColor:[config[@"background"] toArray]];
    }
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [Utils makeFrame:[config[@"frame"] toArray]];
    }
    
    if (![config[@"cornerRadius"] isUndefined]) {
        self.layer.cornerRadius = [config[@"cornerRadius"] toDouble];
    }
    
    if (![config[@"image"] isUndefined]) {
        [self setImage:[UIImage imageNamed:[config[@"image"] toString]] forState:UIControlStateNormal];
    }
    
    if (![config[@"title"] isUndefined]) {
        [self setTitle:[config[@"title"] toString] forState:UIControlStateNormal];
    }
    
    if (![config[@"titleColor"] isUndefined]) {
        [self setTitleColor:[Utils makeColor:[config[@"titleColor"] toArray]] forState:UIControlStateNormal];
    }
    
    if (![config[@"font"] isUndefined]) {
        double size = [config[@"fontSize"] isUndefined] ? 16 : [config[@"fontSize"] toDouble];
        [self.titleLabel setFont:[UIFont fontWithName:[config[@"font"] toString] size:size]];
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
        return [JSValue valueWithObject:[Utils getColor:self.backgroundColor] inContext:[JSContext currentContext]];
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

- (void)setEvent:(NSString *)event withHandler:(JSValue *)handler
{
    if ([event isEqualToString:@"tap"]) {
        tapHandler = [JSManagedValue managedValueWithValue:handler];
        [[JSContext currentContext].virtualMachine addManagedReference:tapHandler withOwner:self];
    }
}

- (void)runTapHandler
{
    [[tapHandler value] callWithArguments:@[]];
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
