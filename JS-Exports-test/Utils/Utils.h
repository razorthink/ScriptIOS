//
//  Utils.h
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 30/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UtilsJSExports <JSExport>

+(UIColor *)makeColor:(NSArray *)rgba;
+(CGRect )makeFrame:(NSArray *)frame;
+(CGPoint )makePoint:(NSArray *)point;
+(CGSize )makeSize:(NSArray *)size;
+(NSArray *)getColor:(UIColor *)rgba;

@end

@interface Utils : NSObject <UtilsJSExports>

@end
