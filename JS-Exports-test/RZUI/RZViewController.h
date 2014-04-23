//
//  RZViewController.h
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 22/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ViewControllerJSExports <JSExport>

- (void)set:(JSValue *)config;
- (void)append:(UIView *)child;
- (JSValue *)get:(NSString *)attr;

+ (id)create;

@end

@interface RZViewController : UIViewController <ViewControllerJSExports>

@end
