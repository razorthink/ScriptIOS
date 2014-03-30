//
//  AppContext.h
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol AppContextJSExports <JSExport>

@property JSContext *context;
+(JSContext *)currentContext;

@end

@interface AppContext : NSObject <AppContextJSExports>

@end
