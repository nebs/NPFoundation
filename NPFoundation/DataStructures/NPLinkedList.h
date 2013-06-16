//
//  NPLinkedList.h
//  NPFoundationDemo
//
//  Created by Nebojsa Petrovic on 6/11/13.
//
//

#import <Foundation/Foundation.h>

@interface NPLinkedList : NSObject <NSFastEnumeration>

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
+ (id)linkedListWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;


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
- (id)initWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;


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

/**
 Returns an array holding all the objects in the linked list.

 @return The array containing all the objects from the linked list.
 */
- (NSArray *)allObjects;


///---------------------------------------------
/// @name Sorting
///---------------------------------------------

/**
 Returns a linked list that lists the receiving linked list’s elements in ascending order, as determined by the comparison method specified by a given NSComparator Block.

 @param cmptr A comparator block.

 @return An linked list that lists the receiving linked list’s elements in ascending order, as determined by the comparison method specified cmptr.
 */
- (NPLinkedList *)sortedLinkedListUsingComparator:(NSComparator)cmptr;

/**
 Sorts the linked list's elements in ascending order, as determined by the comparison method specified by a given NSComparator Block.

 @param cmptr A comparator block.
 */
- (void)sortUsingComparator:(NSComparator)cmptr;

///---------------------------------------------
/// @name Adding Objects
///---------------------------------------------

/**
 Inserts a given object at the end of the linked list.

 @param anObject The object to add to the end of the list. This value must not be nil.
 */
- (void)addObject:(id)anObject;

/**
 Inserts objects from a given linked list at the end of the linked list.

 @param aLinkedList A linked list.
 */
- (void)addObjectsFromLinkedList:(NPLinkedList *)aLinkedListed;

/**
 Inserts a given object right after prevObject if it is found, otherwise nothing is inserted.

 @param anObject The object to insert into the linked list.
 @param prevObject The object in the linked list upon which anObject will be inserted.
 */
- (void)insertObject:(id)anObject afterObject:(id)prevObject;

/**
 Inserts a given object right before nextObject if it is found, otherwise nothing is inserted.

 @param anObject The object to insert into the linked list.
 @param nextObject The object in the linked list before which anObject will be inserted.
 */
- (void)insertObject:(id)anObject beforeObject:(id)nextObject;

/**
 Inserts objects from a given linked list right after prevObject if it is found, otherwise nothing is inserted.

 @param aLinkedList The linked list containing the objects to be added.
 @param prevObject The object in the linked list upon which aLinkedList objects will be inserted.
 */
- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList afterObject:(id)prevObject;

/**
 Inserts objects from a given linked list right before nextObject if it is found, otherwise nothing is inserted.

 @param aLinkedList The linked list containing the objects to be added.
 @param nextObject The object in the linked list before which aLinkedList objects will be inserted.
 */
- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList beforeObject:(id)nextObject;


///---------------------------------------------
/// @name Removing Objects
///---------------------------------------------

/**
 Removes all objects from the linked list.
 */
- (void)removeAllObjects;

/**
 Removes the head object from the linked list if it exists.
 */
- (void)removeHeadObject;

/**
 Removes the tail object from the linked list if it exists.
 */
- (void)removeTailObject;

/**
 Removes the given object from the linked list if found.

 @param anObject The object to remove.
 */
- (void)removeObject:(id)anObject;

/**
 Removes a number of connected objects from the linked list starting at a given object and moving forward.  If anObject is not in the linked list then nothing is done.

 @param numObjects The number of objects to remove.
 @param anObject The object to start removing from.  This object is included in the numObjects count.
 */
- (void)removeNumberOfObjects:(NSUInteger)numObjects afterObject:(id)anObject;

/**
 Removes a number of connected objects from the linked list starting at a given object and moving backwards.  If the object is not in the linked list then nothing is done.

 @param numObjects The number of objects to remove.
 @param anObject The object to start removing from.  This object is included in the numObjects count.
 */
- (void)removeNumberOfObjects:(NSUInteger)numObjects beforeObject:(id)anObject;


///---------------------------------------------
/// @name Replacing Objects
///---------------------------------------------

/**
 Replaces an object with another object in the linked list.  If the object is not in the linked list then nothing is done.

 @param anObject The object in the linked list that will be replaced.
 @param newObject The new object that will be added.
 */
- (void)replaceObject:(id)anObject withObject:(id)newObject;

/**
 Replaces an object with objects from a linked list.  If the object is not in the linked list then nothing is done.

 @param anObject The object in the linked list that will be replaced.
 @param aLinkedList The linked list to be inserted.
 */
- (void)replaceObject:(id)anObject withLinkedList:(id)aLinkedList;


///---------------------------------------------
/// @name Enumerating
///---------------------------------------------

/**
 Calls mapBlock on every object in the list and returns a new list containing the resutling objects.  It does not modify the calling list.

 @param mapBlock The block to perform map on.  It should return an object.

 @return A new linked list containing the resulting objects returned by mapBlock.
 */
- (NPLinkedList *)map:(id (^)(id object))mapBlock;

@end
