//
//  AppDelegate.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 29/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
#import "RootViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[RootViewController alloc] init];
    [self createContext];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createContext
{
    JSContext *context = [[JSContext alloc] init];
    
    NSDictionary *console = @{
                              @"log": ^{ NSLog(@"JS log: %@", [JSContext currentArguments]); },
                              @"error": ^{ NSLog(@"JS err   : %@", [JSContext currentArguments]); },
                              @"trace": ^{}
                              };
    context[@"console"] = console;
    
    NSError *error;
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"script" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:&error];
    
    Person *me = [[Person alloc] init];
    context[@"me"] = me;
    JSValue *meValue = context[@"me"];
    
    [context evaluateScript:script];
    
    NSLog(@"App: %@", [meValue objectForKeyedSubscript:@"name"]);
}

@end
