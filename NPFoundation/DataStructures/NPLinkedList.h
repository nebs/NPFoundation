//
//  NPLinkedList.h
//  NPFoundationDemo
//
//  Created by Nebojsa Petrovic on 6/11/13.
//
//

#import <Foundation/Foundation.h>

@interface NPLinkedList : NSObject

///---------------------------------------------
/// @name Creating a Linked List
///---------------------------------------------

/**
 Creates and returns an empty linked list.

 @return An empty linked list.
 */
+ (id)linkedList;

/**
 Creates and returns a new linked list containing the objects in another given linked list.

 @param aLinkedList A linked list containing objects to be initialized with.

 @return A linked list containing objects in aLinkedList.
 */
+ (id)linkedListWithLinkedList:(NPLinkedList *)aLinkedList;

/**
 Creates and returns a new linked list containing a given object.

 @param anObject An object.

 @return A linked list containing the single element anObject.
 */
+ (id)linkedListWithObject:(id)anObject;

/**
 Creates and returns a new linked list containing the objects in the argument list.

 @param firstObj, ... A comma-separated list of objects ending with nil.

 @return A linked list containing the objects in the argument list.
 */
+ (id)linkedListWithObjects:(id)firstObj, ...;


///---------------------------------------------
/// @name Initializing a Linked List
///---------------------------------------------

/**
 Initializes a newly allocated linked list by placing in it the objects contained in a given linked list.

 @param aLinkedList A linked list.

 @return A linked list initialized to contain the objects in aLinkedList.
 */
- (id)initWithLinkedList:(NPLinkedList *)aLinkedList;

/**
 Initializes a newly allocated linked list by placing in it the objects in the argument list.

 @param firstObj, ... A comma-separated list of objects ending with nil.

 @return A linked list initialized to contain the objects in the argument list.
 */
- (id)initWithObjects:(id)firstObj, ...;


///---------------------------------------------
/// @name Querying a Linked List
///---------------------------------------------

/**
 Returns a Boolean value that indicates whether a given object is present in the linked list.

 @param anObject An object.

 @return YES if anObject is present in the array, otherwise NO.
 */
- (BOOL)containsObject:(id)anObject;

/**
 Returns the number of objects currently in the linked list.

 @return The number of objects currently in the linked list.
 */
- (NSUInteger)count;

/**
 Returns the object at the head of the linked list if there is one.

 @return The object at the head of the linked list if there is one, otherwise nil.
 */
- (id)headObject;

/**
 Returns the object at the tail of the linked list if there is one.

 @return The object at the tail of the linked list if there is one, otherwise nil.
 */
- (id)tailObject;


///---------------------------------------------
/// @name Sorting
///---------------------------------------------

/**
 Returns a linked list that lists the receiving linked list’s elements in ascending order, as determined by the comparison method specified by a given NSComparator Block.

 @param cmptr A comparator block.

 @return An linked list that lists the receiving linked list’s elements in ascending order, as determined by the comparison method specified cmptr.
 */
- (NPLinkedList *)sortedLinkListUsingComparator:(NSComparator)cmptr;

@end
