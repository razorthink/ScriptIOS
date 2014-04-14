//
//  RZImageView.h
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 14/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ImageViewJSExports <JSExport>

@property UIImage *image;
@property CGRect frame;
@property BOOL userInteraction;

- (void)set:(JSValue *)config;
- (void)append:(UIView *)child;
- (JSValue *)get:(NSString *)attr;

+ (id)create;

@end

@interface RZImageView : UIImageView <ImageViewJSExports>

@end
