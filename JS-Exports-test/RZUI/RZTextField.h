//
//  RZTextField.h
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 17/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TextFieldJSExports <JSExport>

@property UIColor *background;
@property CGRect frame;

- (void)set:(JSValue *)config;
- (void)append:(UIView *)child;
- (JSValue *)get:(NSString *)attr;
-(void)removeFromSuperView:(UITextField *)textField;

+ (id)create;

@end

@interface RZTextField : UITextField <TextFieldJSExports, UITextFieldDelegate>

@end
