//
//  NPLinkedList.m
//  NPFoundationDemo
//
//  Created by Nebojsa Petrovic on 6/11/13.
//
//

#import "NPLinkedList.h"

/******************************************
  NPLinkedListNode Class

  This class is used to represent a node
  in the list.
 ******************************************/
@interface NPLinkedListNode : NSObject
@property (nonatomic) id object;
@property (nonatomic) id next;
@property (nonatomic) id prev;
@end
@implementation NPLinkedListNode
@end

/******************************************
 NPLinkedList Class

 This class represents a linked list.
 ******************************************/
@interface NPLinkedList ()
@property (nonatomic) NPLinkedListNode *head;
@property (nonatomic) NPLinkedListNode *tail;

- (NPLinkedListNode *)nodeForObject:(id)anObject;
@end

@implementation NPLinkedList

#pragma mark - Helpers
- (NPLinkedListNode *)nodeForObject:(id)anObject {
    if (!anObject) {
        return nil;
    }

    NPLinkedListNode *nextNode = self.tail;
    while (nextNode) {
        if ([nextNode.object isEqual:anObject]) {
            return nextNode;
        }
        nextNode = nextNode.next;
    }
    return nil;
}

- (void)removeNode:(NPLinkedListNode *)aNode {
    if (!aNode) {
        return;
    }

    if (self.head == aNode) {
        [self removeHeadObject];
        return;
    }

    if (self.tail == aNode) {
        [self removeTailObject];
        return;
    }

    NPLinkedListNode *prev = aNode.prev;
    NPLinkedListNode *next = aNode.next;

    NPLinkedListNode *newNext = prev.next;
    prev.next = next.prev;
    next.prev = newNext;

    aNode.next = nil;
    aNode.prev = nil;
}

#pragma mark - Creating a Linked List
+ (id)linkedList {
    return [NPLinkedList new];
}

+ (id)linkedListWithLinkedList:(NPLinkedList *)aLinkedList {
    return [[NPLinkedList alloc] initWithLinkedList:aLinkedList];
}

+ (id)linkedListWithObject:(id)anObject {
    return [[NPLinkedList alloc] initWithObjects:anObject, nil];
}

+ (id)linkedListWithObjects:(id)firstObj, ... {
    va_list args;
    va_start(args, firstObj);
    NPLinkedList *linkedList = [[NPLinkedList alloc] initWithObjects:firstObj, args, nil];
    va_end(args);
    return linkedList;
}

#pragma mark - Initializing a Linked List
- (id)initWithLinkedList:(NPLinkedList *)aLinkedList {
    return [aLinkedList map:^id(id object) {
        return [object copy];
    }];
}

- (id)initWithObjects:(id)firstObj, ... {
    NPLinkedList *linkedList = [NPLinkedList linkedList];

    va_list args;
    va_start(args, firstObj);
    for (id anObject = firstObj; anObject != nil; anObject = va_arg(args, id)) {
        [linkedList addObject:anObject];
    }
    va_end(args);

    return linkedList;
}

#pragma mark - Querying a Linked List
- (BOOL)containsObject:(id)anObject {
    return [self nodeForObject:anObject] != nil;
}

- (NSUInteger)count {
    NPLinkedListNode *nextNode = self.tail;
    NSUInteger i = 0;
    while (nextNode) {
        i++;
        nextNode = nextNode.next;
    }
    return i;
}

- (id)headObject {
    return self.head.object;
}

- (id)tailObject {
    return self.tail.object;
}

#pragma mark - Sorting
- (NPLinkedList *)sortedLinkListUsingComparator:(NSComparator)cmptr {
    // TODO
    return nil;
}

- (void)sortUsingComparator:(NSComparator)cmptr {
    // TODO
}

#pragma mark - Adding Objects
- (void)addObject:(id)anObject {
    if (!anObject) {
        return;
    }

    NPLinkedListNode *newNode = [NPLinkedListNode new];
    newNode.object = anObject;
    newNode.prev = self.head;
    newNode.next = nil;

    if (self.head) {
        self.head.next = newNode;
    }

    self.head = newNode;

    if (!self.tail) {
        self.tail = newNode;
    }
}

- (void)addObjectsFromLinkedList:(NPLinkedList *)aLinkedListed {
    [aLinkedListed map:^id(id object) {
        [self addObject:object];
        return object;
    }];
}

- (void)insertObject:(id)anObject afterObject:(id)prevObject {
    // TODO
}

- (void)insertObject:(id)anObject beforeObject:(id)nextObject {
    // TODO
}

- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList afterObject:(id)prevObject {
    // TODO
}

- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList beforeObject:(id)nextObject {
    // TODO
}

#pragma mark - Removing Objects
- (void)removeAllObjects {
    self.head = nil;
    self.tail = nil;
}

- (void)removeHeadObject {
    NPLinkedListNode *oldHead = self.head;
    self.head = oldHead.prev;
    oldHead.prev = nil;
}

- (void)removeTailObject {
    NPLinkedListNode *oldTail = self.tail;
    self.tail = oldTail.next;
    oldTail.next = nil;
}

- (void)removeObject:(id)anObject {
    NPLinkedListNode *node = [self nodeForObject:anObject];
    [self removeNode:node];
}

- (void)removeNumberOfObjects:(NSUInteger)numObjects afterObject:(id)anObject {
    // TODO
}

- (void)removeNumberOfObjects:(NSUInteger)numObjects beforeObject:(id)anObject {
    // TODO
}

#pragma mark - Replacing Objects
- (void)replaceObject:(id)anObject withObject:(id)newObject {
    // TODO
}

- (void)replaceObject:(id)anObject withLinkedList:(id)aLinkedList {
    // TODO
}

#pragma mark - Enumeration
- (NPLinkedList *)map:(id (^)(id object))mapBlock {
    NPLinkedList *resultingList = [NPLinkedList linkedList];
    NPLinkedListNode *nextNode = self.tail;
    while (nextNode) {
        [resultingList addObject:mapBlock(nextNode.object)];
        nextNode = nextNode.next;
    }
    return resultingList;
}

- (NSUInteger) countByEnumeratingWithState: (NSFastEnumerationState *)state
                                   objects: (id __unsafe_unretained *)buffer
                                     count: (NSUInteger)bufferSize {
    // Initial state preparation.
    if (state->state == 0) {
        // Point to something that won't mutate.
        state->mutationsPtr = (unsigned long *)(__bridge void *)self;

        // Start at the tail
        state->extra[0] = (unsigned long)self.tail;

        // We're ready to start iterating...
        state->state = 1;
    }

    // Grab the next item from the state
    NPLinkedListNode *currentNode = (__bridge NPLinkedListNode *)((void *)state->extra[0]);
    if(!currentNode) {
        return 0;
    }

    // This is the object that is passed into the 'for..in' loop
    __unsafe_unretained id object = currentNode.object;
    state->itemsPtr = &object;

    // Save the next node in the state for iteration
    if(currentNode) {
        state->extra[0] = (long)currentNode.next;
    }

    return 1;
}

@end
