//
//  RootViewController.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RootViewController.h"
#import "AppContext.h"
#import "RZView.h"
#import "Utils.h"
#import "RZButton.h"
#import "RZLabel.h"

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
    
    RZView *mainView = [[RZView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:mainView];
    
    context[@"MainView"] = mainView;
    context[@"Utils"] = [Utils class];
    context[@"RZView"] = [RZView class];
    context[@"RZButton"] = [RZButton class];
    context[@"RZLabel"] = [RZLabel class];
    
    NSError *error;
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"ui" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:&error];
    
    [context evaluateScript:script];
    NSLog(@"UI script executed");
    
}

-(void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
