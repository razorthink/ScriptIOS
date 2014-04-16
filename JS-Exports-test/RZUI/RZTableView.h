//
//  RZTableView.h
//  JS-Exports-test
//
//  Created by Shrisha S. Bhat on 15/04/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZScrollView.h"

@interface RZTableView : UITableView
{
    RZScrollView *scrolView;
}

-(void)initWithRZScrollView: (RZScrollView *)scrollview;

-(void)set:(JSValue *)config;
+(id)create;

@end
