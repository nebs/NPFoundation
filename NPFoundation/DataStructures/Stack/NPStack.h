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

/**
 Returns the object from the top of the stack without removing it.

 @return The object from the top of the stack.
 */
- (id)peekObject;


///---------------------------------------------
/// @name Adding Objects
///---------------------------------------------

/**
 Pushes a given object on top of the stack.

 @param anObject The object to push on top of the stack. This value must not be nil.
 */
- (void)pushObject:(id)anObject;


///---------------------------------------------
/// @name Removing Objects
///---------------------------------------------

/**
 Removes the object from the top of the stack and returns it.

 @return The object that was removed from the top of the stack.
 */
- (id)popObject;


@end
