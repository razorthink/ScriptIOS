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
#import "AppContext.h"
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
    
//    NSError *error;
//    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"script" ofType:@"js"];
//    NSString *script = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:&error];   
    
//    context[@"Person"] = [Person class];
    
//    [context evaluateScript:script];
    
//    JSValue *sandJS = context[@"sand"];
//    Person *sand = [sandJS toObject];
//    
//    NSLog(@"App: %@", sand);
//    
//    JSContext *test = [[AppContext alloc] init].context;
//    [test evaluateScript:@"console.log(sand.name)"];
    
//    JSValue *func = context[@"something"];

//    [context evaluateScript:@"function ten () {return 10}"];
//    JSValue *ten = [context[@"ten"] callWithArguments:@[]];
//    NSLog(@"ten: %@", ten);
    
    [context evaluateScript:@"var obj = { a: function () {return 1000;}, b: 10 }"];
    JSValue *func = [[context[@"obj"] objectForKeyedSubscript:@"a"] callWithArguments:@[]];
    NSLog(@"obj: %@", func);
}

@end
