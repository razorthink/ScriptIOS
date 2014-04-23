//
//  RZTableView.h
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 15/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "RZScrollView.h"

@protocol TableViewJSExports <JSExport>

@property CGRect frame;

- (void)set:(JSValue *)config;
- (void)append:(UIView *)child;
- (JSValue *)get:(NSString *)attr;
-(void)removeFromSuperView:(UITableView *)tableView;

- (void)displayTable;

+ (id)create;

@end


@interface RZTableView : UITableView <TableViewJSExports>

@end
