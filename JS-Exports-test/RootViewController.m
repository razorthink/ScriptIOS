//
//  RootViewController.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RootViewController.h"
#import "AppContext.h"
#import "View.h"

@interface RootViewController ()

@property JSContext *context;

@end

@implementation RootViewController

@synthesize context;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    context = [[AppContext alloc] init].context;
    
    View *mainView = [[View alloc] initWithFrame:CGRectMake(0, 400, 320, 100)];
    mainView.backgroundColor = [UIColor blackColor];
    mainView.alpha = 0.5f;
    [self.view addSubview:mainView];
    
    // context[@"MainView"] = mainView;
    
//    NSError *error;
//    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"ui" ofType:@"js"];
//    NSString *script = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:&error];
    
    // [context evaluateScript:script];
    NSLog(@"UI script executed");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
