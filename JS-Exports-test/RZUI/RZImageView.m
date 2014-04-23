//
//  RZImageView.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 14/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZImageView.h"
#import "Utils.h"

@interface RZImageView ()

@property NSString *nodeClass;

@end

@implementation RZImageView

@synthesize
nodeClass=_nodeClass,
image=_image,
frame=_frame,
userInteraction=_userInteraction;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (RZImageView *)create
{
    RZImageView *view = [[RZImageView alloc] init];
    return view;
}

-(void)removeFromSuperView:(UIImageView *)imageView
{
    [imageView removeFromSuperview];
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}

-(void)set:(JSValue *)config
{
    if (![config[@"image"] isUndefined]) {
        [self setImage:[UIImage imageNamed:[config[@"image"] toString]]];
    }
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [Utils makeFrame:[config[@"frame"] toArray]];
    }
    
    if (![config[@"userInteraction"] isUndefined]) {
        self.userInteractionEnabled = [config[@"userInteraction"] toString];
    }
    
    if (![config[@"class"] isUndefined]) {
        _nodeClass = [config[@"class"] toString];
    }
    
}

- (JSValue *)get:(NSString *)attr
{
    
    if ([attr isEqualToString:@"image"]) {
        return [JSValue valueWithObject:[self image] inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"frame"]) {
        return [JSValue valueWithRect:self.frame inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"userInteraction"]) {
        return [JSValue valueWithBool:self.userInteractionEnabled inContext:[JSContext currentContext]];
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
