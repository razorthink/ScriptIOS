//
//  RZScrollView.h
//  JS-Exports-test
//
//  Created by Shrisha on 14/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ScrollViewJSExports <JSExport>

@property CGRect frame;

- (void)set:(JSValue *)config;
- (void)append:(UIView *)child;
- (JSValue *)get:(NSString *)attr;
-(void)removeFromSuperView:(UIScrollView *)scrollView;

+ (id)create;

@end

@interface RZScrollView : UIScrollView <ScrollViewJSExports>

@end
