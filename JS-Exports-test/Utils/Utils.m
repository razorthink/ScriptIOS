//
//  Utils.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(UIColor *)makeColor:(NSArray *)rgba
{
    return [UIColor colorWithRed:[[rgba objectAtIndex:0] floatValue]/255.0f
                           green:[[rgba objectAtIndex:1] floatValue]/255.0f
                            blue:[[rgba objectAtIndex:2] floatValue]/255.0f
                           alpha:[[rgba objectAtIndex:3] floatValue]];
}

+(CGRect )makeFrame:(NSArray *)frame
{
    return CGRectMake([[frame objectAtIndex:0] floatValue],
               [[frame objectAtIndex:1] floatValue],
               [[frame objectAtIndex:2] floatValue],
               [[frame objectAtIndex:3] floatValue]);
}

+(CGPoint )makePoint:(NSArray *)point
{
    return CGPointMake([[point objectAtIndex:0] floatValue],
                      [[point objectAtIndex:1] floatValue]);
}

+(CGSize )makeSize:(NSArray *)size
{
    return CGSizeMake([[size objectAtIndex:0] floatValue],
                      [[size objectAtIndex:1] floatValue]);
}

+(NSArray *)getColor:(UIColor *)rgba
{
    const CGFloat *colorComponents = CGColorGetComponents(rgba.CGColor);
    NSArray *colorArray = [NSArray arrayWithObjects:[NSNumber numberWithFloat:colorComponents[0]], [NSNumber numberWithFloat:colorComponents[1]] , [NSNumber numberWithFloat:colorComponents[2]], [NSNumber numberWithFloat:colorComponents[3]], nil];
    NSLog(@"%@",colorArray);
    return colorArray;
}
@end
