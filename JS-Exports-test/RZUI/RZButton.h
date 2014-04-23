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

@property UIColor *background;
@property CGRect frame;
@property CGFloat cornerRadius;

// methods
- (void)set:(JSValue *)config;
- (void)append:(UIView *)child;
- (JSValue *)get:(NSString *)attr;
-(void)removeFromSuperView:(UIButton *)button;

// event handler setters
JSExportAs(on, - (void)setEvent:(NSString *)event withHandler:(JSValue *)handler);

+ (id)create;

@end

@interface RZButton : UIButton <ButtonJSExports>

@end
