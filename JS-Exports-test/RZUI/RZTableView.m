//
//  RZTableView.m
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 15/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "RZTableView.h"
#import "Utils.h"

@interface RZTableView()

@property NSString *nodeClass;
@property NSArray *data;
@property NSInteger sectionsCount;

@end

@implementation RZTableView

@synthesize
nodeClass=_nodeClass,
data,
sectionsCount,
frame=_frame;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (RZTableView *)create
{
    RZTableView *view = [[RZTableView alloc] init];
    
    return view;
}

-(void)removeFromSuperView:(UITableView *)tableView
{
    [tableView removeFromSuperview];
}


-(void)set:(JSValue *)config
{
    
    if (![config[@"frame"] isUndefined]) {
        self.frame = [Utils makeFrame:[config[@"frame"] toArray]];
    }
    
    if (![config[@"noOfSections"] isUndefined]) {
        sectionsCount = [[config[@"noOfSections"] toNumber] integerValue];
        self.delegate = self;
        
    }
    
    if (![config[@"data"] isUndefined]) {
        data = [config[@"data"] toArray];
        self.dataSource = self;
    }
    
    if (![config[@"class"] isUndefined]) {
        _nodeClass = [config[@"class"] toString];
    }
    
    if (![config[@"background"] isUndefined]) {
        self.backgroundView = nil;
        [self setBackgroundColor:[Utils makeColor:[config[@"background"] toArray]]];
    }
    
    if (![config[@"enableScroll"] isUndefined]) {
        self.scrollEnabled = [config[@"enableScroll"] toBool];
    }
}

- (JSValue *)get:(NSString *)attr
{
    
    if ([attr isEqualToString:@"frame"]) {
        return [JSValue valueWithRect:self.frame inContext:[JSContext currentContext]];
    }
    
    else if ([attr isEqualToString:@"class"]) {
        return [JSValue valueWithObject:_nodeClass inContext:[JSContext currentContext]];
    }
    
    return nil;
}

- (void)append:(UIView *)child
{
    [self addSubview:child];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // R//////////eturn the number of sections.
    return sectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @"Prova";
    return cell;
}

- (void)displayTable
{
    for (int i = 0; i < 10; i++)
    {
        [self tableView:self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
    }
}

@end
