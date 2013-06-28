//
//  NPStack.h
//  NPFoundationDemo
//
//  Created by Nebs on 6/27/13.
//
//

#import <Foundation/Foundation.h>

@interface NPStack : NSObject

///---------------------------------------------
/// @name Creating a Stack
///---------------------------------------------

/**
 Creates and returns an empty stack.

 @return An empty stack.
 */
+ (id)stack;


///---------------------------------------------
/// @name Querying a Stack
///---------------------------------------------

/**
 Returns the number of objects currently on the stack.

 @return The number of objects currently on the stack.
 */
- (NSUInteger)count;

@end
