//
//  Person.m
//  JS-Exports-test
//
//  Created by Sandeep S Kumar on 29/03/14.
//  Copyright (c) 2014 Razorthink. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;

-(id)init
{
    name = @"sandeep";
    return self;
}

+ (id)newPersonWithName:(NSString *)name
{
    Person *person = [[Person alloc] init];
    person.name = name;
    
    return person;
}

@end
