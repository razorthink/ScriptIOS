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

@end
