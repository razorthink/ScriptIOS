//
//  RZViewController.m
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 22/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZViewController.h"
#import "AppDelegate.h"
#import "AppContext.h"
#import "RZView.h"
#import "Utils.h"
#import "RZButton.h"
#import "RZLabel.h"
#import "RZImageView.h"
#import "RZScrollView.h"
#import "RZTableView.h"

@interface RZViewController ()

@property JSContext *context;

@end

@implementation RZViewController

@synthesize context;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (RZViewController *)create
{
    RZViewController *VC = [[RZViewController alloc] init];
    AppDelegate *d = [[UIApplication sharedApplication] delegate];
    d.window.rootViewController = VC;
    return VC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)set:(JSValue *)config
{
    
    if (![config[@"background"] isUndefined]) {
        self.view.backgroundColor = [Utils makeColor:[config[@"background"] toArray]];
    }
    
}

- (JSValue *)get:(NSString *)attr
{

    if ([attr isEqualToString:@"background"]) {
        return [JSValue valueWithObject:[Utils getColor:self.view.backgroundColor] inContext:[JSContext currentContext]];
    }

    return nil;
}

- (void)append:(UIView *)child
{
    [self.view addSubview:child];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
