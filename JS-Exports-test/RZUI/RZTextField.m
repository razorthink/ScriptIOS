//
//  RZTextField.m
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 17/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZTextField.h"
#import "Utils.h"

@interface RZTextField ()

@property NSString *nodeClass;

@end

@implementation RZTextField

@synthesize
nodeClass=_nodeClass,
background=_background,
frame=_frame;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (RZTextField *)create
{
    RZTextField *view = [[RZTextField alloc] init];
    return view;
}

-(void)removeFromSuperView:(UITextField *)textField
{
    [textField removeFromSuperview];
}

-(void)set:(JSValue *)config
{
    if (![config[@"text"] isUndefined]) {
        self.text = [config[@"text"] toString];
    }
    
    if (![config[@"textColor"] isUndefined]) {
        self.textColor = [Utils makeColor:[config[@"textColor"] toArray]];
    }
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [Utils makeFrame:[config[@"frame"] toArray]];
        self.keyboardType = UIKeyboardTypeDefault;
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.placeholder = @"name";
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
    }
    
    if (![config[@"background"] isUndefined]) {
        self.background = [Utils makeColor:[config[@"background"] toArray]];
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

- (void)append:(UIView *)child {
    [self addSubview:child];
}

@end
