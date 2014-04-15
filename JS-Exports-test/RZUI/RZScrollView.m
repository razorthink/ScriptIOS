//
//  RZScrollView.m
//  JS-Exports-test
//
//  Created by Shrisha on 14/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZScrollView.h"
#import "Utils.h"

@interface RZScrollView()

@property NSString *nodeClass;

@end

@implementation RZScrollView

@synthesize
nodeClass=_nodeClass,
frame=_frame;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


+ (RZScrollView *)create
{
    RZScrollView *view = [[RZScrollView alloc] init];
    return view;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}

-(void)set:(JSValue *)config
{
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [Utils makeFrame:[config[@"frame"] toArray]];
    }
    
    if (![config[@"class"] isUndefined]) {
        _nodeClass = [config[@"class"] toString];
    }
    
}

- (JSValue *)get:(NSString *)attr
{

    if ([attr isEqualToString:@"frame"]) {
        return [JSValue valueWithRect:self.frame inContext:[JSContext currentContext]];
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
