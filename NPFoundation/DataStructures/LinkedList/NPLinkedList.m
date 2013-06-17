//
//  NPLinkedList.m
//  NPFoundationDemo
//
//  Created by Nebojsa Petrovic on 6/11/13.
//
//

#import "NPLinkedList.h"
#import "NPLinkedListNode.h"

@interface NPLinkedList ()
@property (nonatomic) NPLinkedListNode *head;
@property (nonatomic) NPLinkedListNode *tail;

- (id)initWithFirstObject:(id)firstObj objectList:(va_list)args;
- (NPLinkedListNode *)nodeForObject:(id)anObject;
- (void)removeNode:(NPLinkedListNode *)aNode;
+ (NPLinkedList *)linkedListByMergingLinkedList:(NPLinkedList *)leftList
                                 withLinkedList:(NPLinkedList *)rightList
                                usingComparator:(NSComparator)cmptr;
@end

@implementation NPLinkedList

#pragma mark - Helpers
- (id)initWithFirstObject:(id)firstObj objectList:(va_list)args {
    self = [super init];
    if (self) {
        for (id anObject = firstObj; anObject != nil; anObject = va_arg(args, id)) {
            [self addObject:anObject];
        }
    }
    return self;
}

- (NPLinkedListNode *)nodeForObject:(id)anObject {
    if (!anObject) {
        return nil;
    }

    NPLinkedListNode *nextNode = self.head;
    while (nextNode) {
        if (nextNode.object == anObject) {
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

    NPLinkedListNode *newNext = next;
    prev.next = next;
    newNext.prev = prev;

    aNode.next = nil;
    aNode.prev = nil;
    aNode = nil;
}

+ (NPLinkedList *)linkedListByMergingLinkedList:(NPLinkedList *)leftList
                                 withLinkedList:(NPLinkedList *)rightList
                                usingComparator:(NSComparator)cmptr {
    NPLinkedList *mergedLinkedList = [NPLinkedList new];

    if (!cmptr) {
        [mergedLinkedList addObjectsFromLinkedList:leftList];
        [mergedLinkedList addObjectsFromLinkedList:rightList];
        return mergedLinkedList;
    }

    while ([leftList count] > 0 || [rightList count] > 0) {
        if ([leftList count] > 0 && [rightList count] > 0) {
            NSComparisonResult result = cmptr(leftList.head.object, rightList.head.object);
            if (result == NSOrderedDescending) {
                [mergedLinkedList addObject:rightList.head.object];
                [rightList removeHeadObject];
            } else {
                [mergedLinkedList addObject:leftList.head.object];
                [leftList removeHeadObject];
            }
        } else if ([leftList count] > 0) {
            [mergedLinkedList addObject:leftList.head.object];
            [leftList removeHeadObject];
        } else if ([rightList count] > 0) {
            [mergedLinkedList addObject:rightList.head.object];
            [rightList removeHeadObject];
        }
    }
    return mergedLinkedList;
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
    NPLinkedList *linkedList = [[NPLinkedList alloc] initWithFirstObject:firstObj objectList:args];
    va_end(args);
    return linkedList;
}

#pragma mark - Initializing a Linked List
- (id)initWithLinkedList:(NPLinkedList *)aLinkedList {
    self = [super init];
    if (self) {
        for (id object in aLinkedList) {
            [self addObject:[object copy]];
        }
    }
    return self;
}

- (id)initWithObjects:(id)firstObj, ... {
    self = [super init];
    if (self) {
        va_list args;
        va_start(args, firstObj);
        self = [self initWithFirstObject:firstObj objectList:args];
        va_end(args);
    }
    return self;
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
+ (NPLinkedList *)sortedLinkedList:(NPLinkedList *)aLinkedList
                   usingComparator:(NSComparator)cmptr {
    if ([aLinkedList count] <= 1 || !cmptr) {
        return aLinkedList;
    }

    // Find the center node
    NSUInteger center = [aLinkedList count] / 2;

    // Split items into left and right lists
    NPLinkedList *leftList = [NPLinkedList new];
    NPLinkedList *rightList = [NPLinkedList new];

    NSUInteger i = 0;
    for (id object in aLinkedList) {
        if (i < center) {
            [leftList addObject:object];
        } else {
            [rightList addObject:object];
        }
        i++;
    }

    // Sort the sub lists
    leftList = [NPLinkedList sortedLinkedList:leftList usingComparator:cmptr];
    rightList = [NPLinkedList sortedLinkedList:rightList usingComparator:cmptr];

    return [NPLinkedList linkedListByMergingLinkedList:leftList
                                        withLinkedList:rightList
                                       usingComparator:cmptr];
}

- (NPLinkedList *)sortedLinkedListUsingComparator:(NSComparator)cmptr {
    if (!cmptr) {
        return self;
    }

    return [NPLinkedList sortedLinkedList:self usingComparator:cmptr];
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
    if (!aLinkedListed) {
        return;
    }

    for (id object in aLinkedListed) {
        [self addObject:object];
    }
}

- (void)insertObject:(id)anObject afterObject:(id)prevObject {
    if (!anObject || !prevObject) {
        return;
    }

    NPLinkedListNode *relativeNode = [self nodeForObject:prevObject];
    if (!relativeNode) {
        return;
    }

    NPLinkedListNode *newNode = [NPLinkedListNode new];
    newNode.object = anObject;

    newNode.next = relativeNode.next;
    newNode.prev = relativeNode;

    NPLinkedListNode *afterNode = relativeNode.next;
    afterNode.prev = newNode;
    relativeNode.next = newNode;

    if (prevObject == [self tailObject]) {
        self.tail = newNode;
    }
}

- (void)insertObject:(id)anObject beforeObject:(id)nextObject {
    if (!anObject || !nextObject) {
        return;
    }

    NPLinkedListNode *relativeNode = [self nodeForObject:nextObject];
    if (!relativeNode) {
        return;
    }

    NPLinkedListNode *newNode = [NPLinkedListNode new];
    newNode.object = anObject;

    newNode.next = relativeNode;
    newNode.prev = relativeNode.prev;

    NPLinkedListNode *beforeNode = relativeNode.prev;
    beforeNode.next = newNode;
    relativeNode.prev = newNode;

    if (nextObject == [self headObject]) {
        self.head = newNode;
    }
}

- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList afterObject:(id)prevObject {
    if (!aLinkedList ||
        !prevObject ||
        [aLinkedList count] == 0 ||
        ![self containsObject:prevObject]) {
        return;
    }

    // Insert the objects in reverse order one by one.
    NSArray *newObjects = [aLinkedList allObjects];
    for (int i=[newObjects count]-1; i>=0; i--) {
        [self insertObject:newObjects[i] afterObject:prevObject];
    }
}

- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList beforeObject:(id)nextObject {
    if (!aLinkedList ||
        !nextObject ||
        [aLinkedList count] == 0 ||
        ![self containsObject:nextObject]) {
        return;
    }

    // Insert the objects in forward order one by one.
    NSArray *newObjects = [aLinkedList allObjects];
    for (int i=0; i<[newObjects count]; i++) {
        [self insertObject:newObjects[i] beforeObject:nextObject];
    }
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

    if (!self.head) {
        self.tail = nil;
    }
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

    if (!self.tail) {
        self.head = nil;
    }
}

- (void)removeObject:(id)anObject {
    if (!anObject) {
        return;
    }

    NPLinkedListNode *node = [self nodeForObject:anObject];
    if (!node) {
        return;
    }

    [self removeNode:node];
}

- (void)removeNumberOfObjects:(NSUInteger)numObjects afterObject:(id)anObject {
    if (numObjects == 0 || !anObject || ![self containsObject:anObject]) {
        return;
    }

    NPLinkedListNode *leftBoundNode = [self nodeForObject:anObject];
    NPLinkedListNode *rightBoundNode = leftBoundNode;
    for (int i=0; i<numObjects; i++) {
        if (!rightBoundNode.next) {
            break;
        }
        NPLinkedListNode *previousNode = rightBoundNode;
        rightBoundNode = rightBoundNode.next;
        previousNode.prev = nil;
        previousNode.next = nil;
        previousNode = nil;
    }

    // Tie the two bounds together.
    leftBoundNode.next = rightBoundNode;
    rightBoundNode.prev = leftBoundNode;
}

- (void)removeNumberOfObjects:(NSUInteger)numObjects beforeObject:(id)anObject {
    if (numObjects == 0 || !anObject || ![self containsObject:anObject]) {
        return;
    }

    NPLinkedListNode *rightBoundNode = [self nodeForObject:anObject];
    NPLinkedListNode *leftBoundNode = rightBoundNode;
    for (int i=0; i<numObjects; i++) {
        if (!leftBoundNode.prev) {
            break;
        }
        NPLinkedListNode *previousNode = leftBoundNode;
        leftBoundNode = leftBoundNode.next;
        previousNode.prev = nil;
        previousNode.next = nil;
        previousNode = nil;
    }

    // Tie the two bounds together.
    leftBoundNode.next = rightBoundNode;
    rightBoundNode.prev = leftBoundNode;
}

#pragma mark - Replacing Objects
- (void)replaceObject:(id)anObject withObject:(id)newObject {
    if (!anObject || !newObject || ![self containsObject:anObject]) {
        return;
    }

    NPLinkedListNode *nodeToReplace = [self nodeForObject:anObject];
    if (!nodeToReplace) {
        return;
    }

    NPLinkedListNode *newNode = [NPLinkedListNode new];
    newNode.object = newObject;

    newNode.next = nodeToReplace.next;
    newNode.prev = nodeToReplace.prev;

    NPLinkedListNode *previousNode = nodeToReplace.prev;
    NPLinkedListNode *nextNode = nodeToReplace.next;

    if (previousNode) {
        previousNode.next = newNode;
    }

    if (newNode) {
        nextNode.prev = newNode;
    }

    [self removeNode:nodeToReplace];
}

- (void)replaceObject:(id)anObject withLinkedList:(id)aLinkedList {
    if (!anObject ||
        !aLinkedList ||
        [aLinkedList count] == 0 ||
        ![self containsObject:anObject]) {
        return;
    }

    NPLinkedListNode *nodeToReplace = [self nodeForObject:anObject];
    if (!nodeToReplace) {
        return;
    }

    [self insertObjectsFromLinkedList:aLinkedList afterObject:anObject];
    [self removeNode:nodeToReplace];
}

#pragma mark - Enumeration
- (NPLinkedList *)map:(id (^)(id object))mapBlock {
    NPLinkedList *resultingList = [NPLinkedList linkedList];
    for (id object in self) {
        [resultingList addObject:mapBlock(object)];
    }
    return resultingList;
}

#pragma mark - NSFastEnumeration Protocol
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

#pragma mark - NSObject Overrides
- (NSString *)description {
    NSMutableString *string = [NSMutableString string];
    for (id object in self) {
        [string appendFormat:@"%@", object];
        if (self.tail.object != object) {
            [string appendString:@"-"];
        }
    }
    return string;
}

@end
