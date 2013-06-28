//
//  NPStack.m
//  NPFoundationDemo
//
//  Created by Nebs on 6/27/13.
//
//

#import "NPStack.h"

@interface NPStack ()
@property (nonatomic) NSMutableArray *stackObjects;
@end

@implementation NPStack

#pragma mark - Helpers
- (id)init {
    self = [super init];
    if (self) {
        self.stackObjects = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Creating a Stack
+ (id)stack {
    return [NPStack new];
}

#pragma mark - Querying a Stack
- (NSUInteger)count {
    return [self.stackObjects count];
}

@end
