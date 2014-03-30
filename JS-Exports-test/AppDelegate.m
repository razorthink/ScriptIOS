//
//  AppDelegate.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 29/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "AppDelegate.h"
#import "AppContext.h"
#import "RootViewController.h"
#import "RZUI/RZButton.h"
#import "RZUI/RZLabel.h"
#import "RZUI/RZView.h"
#import "Utils.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface AppDelegate ()

@property JSContext *context;

@end

@implementation AppDelegate

@synthesize context;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    context = [[AppContext alloc] init].context;
    self.window.rootViewController = [[RootViewController alloc] init];
    [self createContext];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createContext
{
    
    context[@"console"] = @{
                            @"log": ^{ NSLog(@"JS log: %@", [JSContext currentArguments]); },
                            @"error": ^{ NSLog(@"JS err   : %@", [JSContext currentArguments]); },
                            @"trace": ^{}
                            };
    
    context[@"Utils"] = [Utils class];
    
    context[@"Utils"] = [Utils class];
    context[@"UI"] = @{
                       @"View": [RZView class],
                       @"Button": [RZButton class],
                       @"Label": [RZLabel class]
                       };
    
}

@end
