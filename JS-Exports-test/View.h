//
//  View.h
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ViewJSExports <JSExport>

-(void)set:(NSDictionary *)config;

@end

@interface View : UIView <ViewJSExports>

@end
