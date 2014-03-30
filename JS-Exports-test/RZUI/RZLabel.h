//
//  Label.h
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol LabelJSExports <JSExport>

- (void)set:(JSValue *)config;
- (void)addSubNode:(UIView *)subNode;

+ (id)create;

@end

@interface RZLabel : UILabel <LabelJSExports>

@end