//
//  Person.h
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 29/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol PersonJSExports <JSExport>

@property NSString *name;

@end

@interface Person : NSObject <PersonJSExports>

@end
