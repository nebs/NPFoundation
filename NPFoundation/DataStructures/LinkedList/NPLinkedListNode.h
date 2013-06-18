//
//  NPLinkedListNode.h
//  NPFoundationDemo
//
//  Created by Nebojsa Petrovic on 6/16/13.
//
//

#import <Foundation/Foundation.h>

@interface NPLinkedListNode : NSObject
@property (nonatomic) id object;
@property (nonatomic) id next;
@property (weak, nonatomic) id prev;

/**
 Removes all connections this node has to other nodes and other nodes have to this node.  It only handles direct 1st degree connections (prev and next nodes).
 */
- (void)disconnect;
@end
