//
//  AppContext.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "AppContext.h"

@implementation AppContext

@synthesize context;

static JSContext *sContext;

-(id)init
{
    self = [super init];
    if (sContext == nil) {
        sContext = [[JSContext alloc] init];
        context = sContext;
    } else {
        context = sContext;
    }
    
    return self;
}

@end
