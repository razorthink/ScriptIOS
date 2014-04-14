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
#import "RZImageView.h"

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
    
    context[@"App"] = @{ @"MainView": mainView };
    
    NSError *error = nil;
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"bundle" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:&error];
        
    if (!error) { [context evaluateScript:script]; }
    else NSLog(@"error loading JS from file");
    
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
