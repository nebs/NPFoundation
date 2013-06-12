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
@end

@implementation NPLinkedList

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
    return nil;
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
    NPLinkedListNode *nextObject = self.head;
    while (nextObject) {
        if ([nextObject.object isEqual:anObject]) {
            return YES;
        }
        nextObject = nextObject.next;
    }

    return NO;
}

- (NSUInteger)count {
    NPLinkedListNode *nextObject = self.head;
    NSUInteger i = 0;
    while (nextObject) {
        i++;
        nextObject = nextObject.next;
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
    return nil;
}

- (void)sortUsingComparator:(NSComparator)cmptr {

}

#pragma mark - Adding Objects
- (void)addObject:(id)anObject {

}

- (void)addObjectsFromLinkedList:(NPLinkedList *)aLinkedListed {

}

- (void)insertObject:(id)anObject afterObject:(id)prevObject {

}

- (void)insertObject:(id)anObject beforeObject:(id)nextObject {

}

- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList afterObject:(id)prevObject {

}

- (void)insertObjectsFromLinkedList:(NPLinkedList *)aLinkedList beforeObject:(id)nextObject {

}

#pragma mark - Removing Objects
- (void)removeAllObjects {

}

- (void)removeHeadObject {

}

- (void)removeTailObject {

}

- (void)removeObject:(id)anObject {

}

- (void)removeNumberOfObjects:(NSUInteger)numObjects afterObject:(id)anObject {

}

- (void)removeNumberOfObjects:(NSUInteger)numObjects beforeObject:(id)anObject {

}

#pragma mark - Replacing Objects
- (void)replaceObject:(id)anObject withObject:(id)newObject {

}

- (void)replaceObject:(id)anObject withLinkedList:(id)aLinkedList {

}

@end
