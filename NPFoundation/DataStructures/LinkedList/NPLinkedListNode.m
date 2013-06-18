//
//  NPLinkedListNode.m
//  NPFoundationDemo
//
//  Created by Nebojsa Petrovic on 6/16/13.
//
//

#import "NPLinkedListNode.h"

@implementation NPLinkedListNode

- (void)disconnect {
    NPLinkedListNode *nextNode = self.next;
    if (nextNode) {
        nextNode.prev = nil;
    }

    NPLinkedListNode *prevNode = self.prev;
    if (prevNode) {
        prevNode.next = nil;
    }

    self.next = nil;
    self.prev = nil;
}

@end
