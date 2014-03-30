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

-(void)set:(NSDictionary *)config
{
    self.alpha = [config[@"alpha"] floatValue];
    
    self.backgroundColor = (UIColor *)config[@"background"];
    
    self.frame = [Utils makeFrame:config[@"frame"]];
    
}

- (void)addSubNode:(UIView *)subNode {

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
