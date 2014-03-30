//
//  Button.h
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ButtonJSExports <JSExport>

- (void)set:(NSDictionary *)config;
- (void)addSubNode:(UIView *)subNode;

+ (id)create;

@end

@interface Button : UIButton <ButtonJSExports>

@end
