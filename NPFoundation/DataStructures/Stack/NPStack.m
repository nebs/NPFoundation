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

- (NSInteger)lastItemIndex {
    return [self count] - 1;
}

#pragma mark - Creating a Stack
+ (id)stack {
    return [NPStack new];
}

#pragma mark - Querying a Stack
- (NSUInteger)count {
    return [self.stackObjects count];
}

- (id)peekObject {
    if (!self.stackObjects || [self count] == 0) {
        return nil;
    }

    return [self.stackObjects objectAtIndex:[self lastItemIndex]];
}

#pragma mark - Adding Objects
- (void)pushObject:(id)anObject {
    if (!anObject) {
        return;
    }

    [self.stackObjects addObject:anObject];
}

#pragma mark - Removing Objects
- (id)popObject {
    id lastObject = [self peekObject];
    if (lastObject) {
        [self.stackObjects removeLastObject];
    }
    return lastObject;
}

@end
