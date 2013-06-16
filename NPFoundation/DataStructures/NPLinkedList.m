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
    NSUInteger i = 0;
    for (id object in self) i++;
    return i;
}

- (id)headObject {
    return self.head.object;
}

- (id)tailObject {
    return self.tail.object;
}

- (NSArray *)allObjects {
    NSMutableArray *array = [NSMutableArray array];
    for (id object in self) {
        [array addObject:object];
    }
    return array;
}

#pragma mark - Sorting
- (NPLinkedList *)sortedLinkedListUsingComparator:(NSComparator)cmptr {
    NPLinkedList *sortedLinkedList = [self copy];
    [sortedLinkedList sortUsingComparator:cmptr];
    return sortedLinkedList;
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
    newNode.prev = self.tail;
    newNode.next = nil;

    if (self.tail) {
        self.tail.next = newNode;
    }

    self.tail = newNode;

    if (!self.head) {
        self.head = newNode;
    }
}

- (void)addObjectsFromLinkedList:(NPLinkedList *)aLinkedListed {
    for (id object in self) {
        [self addObject:object];
    }
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
    // Set the new head
    NPLinkedListNode *currentHead = self.head;
    self.head = currentHead.next;
    self.head.prev = nil;

    // Remove the old head
    currentHead.next = nil;
    currentHead.prev = nil;
    currentHead = nil;
}

- (void)removeTailObject {
    // Set the new tail
    NPLinkedListNode *currentTail = self.tail;
    self.tail = currentTail.prev;
    self.tail.next = nil;

    // Remove the old tail
    currentTail.next = nil;
    currentTail.prev = nil;
    currentTail = nil;
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
    for (id object in self) {
        [resultingList addObject:mapBlock(object)];
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
        state->extra[0] = (unsigned long)self.head;

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

#pragma mark - NSCopying Protocol
- (id)copyWithZone:(NSZone *)zone {
    NPLinkedList *copyLinkedList = [NPLinkedList new];

    if (copyLinkedList) {
        for (id object in self) {
            [copyLinkedList addObject:[object copyWithZone:zone]];
        }
    }

    return copyLinkedList;
}

@end
