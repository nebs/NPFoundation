#import "NPLinkedListNode.h"
#import "NPLinkedList.h"
#import "Kiwi.h"

SPEC_BEGIN(LinkedList)

describe(@"+linkedList", ^{
    __block NPLinkedList *newLinkedList = nil;

    beforeEach(^{
        newLinkedList = [NPLinkedList linkedList];
    });

    it(@"returns a non-nil linked list", ^{
        [newLinkedList shouldNotBeNil];
    });
    it(@"returns a new linked list instance", ^{
        [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
    });
    it(@"returns an empty linked list", ^{
        [[theValue([newLinkedList count]) should] equal:theValue(0)];
    });
});

describe(@"+linkedListWithLinkedList:", ^{
    __block NPLinkedList *newLinkedList = nil;
    __block NPLinkedList *inputLinkedList = nil;

    beforeEach(^{
        newLinkedList = nil;
        inputLinkedList = nil;
    });

    context(@"with a nil linked list", ^{
        beforeEach(^{
            inputLinkedList = nil;
            newLinkedList = [NPLinkedList linkedListWithLinkedList:inputLinkedList];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns an empty linked list", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedList];
            newLinkedList = [NPLinkedList linkedListWithLinkedList:inputLinkedList];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns an empty linked list", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with a non-empty linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObject:@"foo"];
            newLinkedList = [NPLinkedList linkedListWithLinkedList:inputLinkedList];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns a new linked list containing the input linked list objects", ^{
            [[theValue([newLinkedList count]) should] equal:theValue([inputLinkedList count])];
        });
    });
});

describe(@"+linkedListWithObject:", ^{
    __block NPLinkedList *newLinkedList = nil;
    __block NSString *inputObject = nil;

    beforeEach(^{
        newLinkedList = nil;
        inputObject = nil;
    });

    context(@"with a nil object", ^{
        beforeEach(^{
            newLinkedList = [NPLinkedList linkedListWithObject:inputObject];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns an empty linked list", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with a valid object", ^{
        beforeEach(^{
            inputObject = @"foo";
            newLinkedList = [NPLinkedList linkedListWithObject:inputObject];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns a linked list with one object", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(1)];
        });
        it(@"returns a linked list whose head object is the input object", ^{
            [[[newLinkedList headObject] should] equal:inputObject];
        });
    });
});

describe(@"+linkedListWithObjects:", ^{
    __block NPLinkedList *newLinkedList = nil;

    beforeEach(^{
        newLinkedList = nil;
    });

    context(@"with no input objects", ^{
        beforeEach(^{
            newLinkedList = [NPLinkedList linkedListWithObjects:nil];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns an empty linked list", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with valid input objects", ^{
        beforeEach(^{
            newLinkedList = [NPLinkedList linkedListWithObjects:@"foo", @"bar", nil];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns a linked list with all the objects", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(2)];
        });
    });
});

describe(@"-initWithLinkedList:", ^{
    __block NPLinkedList *newLinkedList = nil;
    __block NPLinkedList *inputLinkedList = nil;

    beforeEach(^{
        newLinkedList = nil;
        inputLinkedList = nil;
    });

    context(@"with a nil linked list", ^{
        beforeEach(^{
            inputLinkedList = nil;
            newLinkedList = [[NPLinkedList alloc] initWithLinkedList:inputLinkedList];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns an empty linked list", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedList];
            newLinkedList = [[NPLinkedList alloc] initWithLinkedList:inputLinkedList];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns an empty linked list", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with a non-empty linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObject:@"foo"];
            newLinkedList = [[NPLinkedList alloc] initWithLinkedList:inputLinkedList];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns a new linked list containing the input linked list objects", ^{
            [[theValue([newLinkedList count]) should] equal:theValue([inputLinkedList count])];
        });
    });
});

describe(@"-initWithObjects:", ^{
    __block NPLinkedList *newLinkedList = nil;

    beforeEach(^{
        newLinkedList = nil;
    });

    context(@"with no input objects", ^{
        beforeEach(^{
            newLinkedList = [[NPLinkedList alloc] initWithObjects:nil];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns an empty linked list", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with valid input objects", ^{
        beforeEach(^{
            newLinkedList = [[NPLinkedList alloc] initWithObjects:@"foo", @"bar", nil];
        });

        it(@"returns a non-nil linked list", ^{
            [newLinkedList shouldNotBeNil];
        });
        it(@"returns a new linked list instance", ^{
            [[newLinkedList should] beKindOfClass:[NPLinkedList class]];
        });
        it(@"returns a linked list with all the objects", ^{
            [[theValue([newLinkedList count]) should] equal:theValue(2)];
        });
    });
});

describe(@"-containsObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *anObject = nil;
    __block BOOL isContained = NO;

    context(@"with a nil object", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObject:@"foo"];
            anObject = nil;
            isContained = [linkedList containsObject:anObject];
        });

        it(@"return NO", ^{
            [[theValue(isContained) should] beFalse];
        });
    });

    context(@"with an object that isn't in the list", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObject:@"foo"];
            anObject = @"bar";
            isContained = [linkedList containsObject:anObject];
        });

        it(@"return NO", ^{
            [[theValue(isContained) should] beFalse];
        });
    });

    context(@"with an object that's in the list", ^{
        beforeEach(^{
            anObject = @"foo";
            linkedList = [NPLinkedList linkedListWithObjects:@"bar", anObject, nil];
            isContained = [linkedList containsObject:anObject];
        });

        it(@"return YES", ^{
            [[theValue(isContained) should] beTrue];
        });
    });
});

describe(@"-count", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSUInteger count = 0;

    beforeEach(^{
        linkedList = nil;
        count = 0;
    });

    context(@"when the list is empty", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            count = [linkedList count];
        });

        it(@"returns 0", ^{
            [[theValue(count) should] equal:theValue(0)];
        });
    });

    context(@"when the list has one object", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObject:@"foo"];
            count = [linkedList count];
        });

        it(@"returns 1", ^{
            [[theValue(count) should] equal:theValue(1)];
        });
    });

    context(@"when the list has more than one object", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObjects:@"foo", @"bar", @"buzz", nil];
            count = [linkedList count];
        });

        it(@"returns the number of objects in the list", ^{
            [[theValue(count) should] equal:theValue(3)];
        });
    });
});

describe(@"-headObject", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *outputHeadObject = nil;

    beforeEach(^{
        linkedList = nil;
        outputHeadObject = nil;
    });

    context(@"with an empty list", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            outputHeadObject = [linkedList headObject];
        });

        it(@"returns nil", ^{
            [outputHeadObject shouldBeNil];
        });
    });

    context(@"with a list that contains at least one object", ^{
        __block NSString *firstObject = @"foo";

        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObjects:firstObject, @"bar", nil];
            outputHeadObject = [linkedList headObject];
        });

        it(@"returns the first object in the list", ^{
            [[outputHeadObject should] equal:firstObject];
        });
        it(@"does not return a linked list node", ^{
            [[outputHeadObject shouldNot] beMemberOfClass:[NPLinkedListNode class]];
        });
    });
});

describe(@"-tailObject", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *outputTailObject = nil;

    beforeEach(^{
        linkedList = nil;
        outputTailObject = nil;
    });

    context(@"with an empty list", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            outputTailObject = [linkedList tailObject];
        });

        it(@"returns nil", ^{
            [outputTailObject shouldBeNil];
        });
    });

    context(@"with a list that contains at least one object", ^{
        __block NSString *lastObject = @"bar";

        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObjects:@"foo", lastObject, nil];
            outputTailObject = [linkedList tailObject];
        });

        it(@"returns the last object in the list", ^{
            [[outputTailObject should] equal:lastObject];
        });
        it(@"does not return a linked list node", ^{
            [[outputTailObject shouldNot] beMemberOfClass:[NPLinkedListNode class]];
        });
    });
});

describe(@"-allObjects", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSArray *outputArray = nil;

    beforeEach(^{
        linkedList = nil;
        outputArray = nil;
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            outputArray = [linkedList allObjects];
        });

        it(@"returns a non-nil object", ^{
            [outputArray shouldNotBeNil];
        });
        it(@"returns an empty array", ^{
            [[theValue([outputArray count]) should] equal:theValue(0)];
        });
    });

    context(@"with a linked list containing at least one object", ^{
        NSString *objectA = @"A";
        NSString *objectB = @"B";
        NSString *objectC = @"C";

        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObjects:objectA, objectB, objectC, nil];
            outputArray = [linkedList allObjects];
        });

        it(@"returns an array with the same size as the linked list", ^{
            [[theValue([outputArray count]) should] equal:theValue([linkedList count])];
        });
        it(@"returns an array containing all the objects from the linked list", ^{
            BOOL hasAllValues = YES;
            hasAllValues &= [outputArray containsObject:objectA];
            hasAllValues &= [outputArray containsObject:objectB];
            hasAllValues &= [outputArray containsObject:objectC];
            [[theValue(hasAllValues) should] beTrue];
        });
    });
});

describe(@"+sortedLinkedList:usingComparator:", ^{
    __block NPLinkedList *originalLinkedList = nil;
    __block NPLinkedList *sortedLinkedList = nil;
    NSComparator comparator = ^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    };

    beforeEach(^{
        originalLinkedList = nil;
        sortedLinkedList = nil;
    });

    context(@"when the comparator is nil", ^{
        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedListWithObject:@"foo"];
            sortedLinkedList = [NPLinkedList sortedLinkedList:originalLinkedList usingComparator:nil];
        });

        it(@"returns the original linked list", ^{
            [[originalLinkedList should] equal:sortedLinkedList];
        });
    });

    context(@"with a nil linked list", ^{
        beforeEach(^{
            originalLinkedList = nil;
            sortedLinkedList = [NPLinkedList sortedLinkedList:originalLinkedList usingComparator:comparator];
        });

        it(@"returns nil", ^{
            [sortedLinkedList shouldBeNil];
        });
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedList];
            sortedLinkedList = [NPLinkedList sortedLinkedList:originalLinkedList usingComparator:comparator];
        });

        it(@"returns an empty linked list", ^{
            [[theValue([sortedLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with a linked list containing only one object", ^{
        NSNumber *testObject = @1;

        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedListWithObject:testObject];
            sortedLinkedList = [NPLinkedList sortedLinkedList:originalLinkedList usingComparator:comparator];
        });

        it(@"returns the linked list containing that object", ^{
            [[theValue([sortedLinkedList containsObject:testObject]) should] beTrue];
        });
    });

    context(@"with a linked list containing more than one object", ^{
        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedListWithObjects:@2, @4, @3, @1, @5, nil];
            sortedLinkedList = [NPLinkedList sortedLinkedList:originalLinkedList usingComparator:comparator];
        });

        it(@"returns a linked list with the same count as the input linked list", ^{
            [[theValue([originalLinkedList count]) should] equal:theValue([sortedLinkedList count])];
        });
        it(@"returns a linked list containing all the original objects sorted", ^{
            NSArray *sortedArray = [sortedLinkedList allObjects];
            BOOL isSorted = YES;
            isSorted &= ([sortedArray[0] intValue] == 1);
            isSorted &= ([sortedArray[1] intValue] == 2);
            isSorted &= ([sortedArray[2] intValue] == 3);
            isSorted &= ([sortedArray[3] intValue] == 4);
            isSorted &= ([sortedArray[4] intValue] == 5);
            [[theValue(isSorted) should] beTrue];
        });
    });
});

describe(@"-sortedLinkedListUsingComparator:", ^{
    __block NPLinkedList *originalLinkedList = nil;
    __block NPLinkedList *sortedLinkedList = nil;
    NSComparator comparator = ^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    };

    beforeEach(^{
        originalLinkedList = nil;
        sortedLinkedList = nil;
    });

    context(@"when the comparator is nil", ^{
        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedListWithObjects:@2, @4, @3, @1, @5, nil];
            sortedLinkedList = [originalLinkedList sortedLinkedListUsingComparator:nil];
        });

        it(@"returns an unsorted linked list", ^{
            NSArray *sortedArray = [sortedLinkedList allObjects];
            BOOL isSorted = YES;
            isSorted &= ([sortedArray[0] intValue] == 1);
            isSorted &= ([sortedArray[1] intValue] == 2);
            isSorted &= ([sortedArray[2] intValue] == 3);
            isSorted &= ([sortedArray[3] intValue] == 4);
            isSorted &= ([sortedArray[4] intValue] == 5);
            [[theValue(isSorted) should] beFalse];
        });
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedList];
            sortedLinkedList = [originalLinkedList sortedLinkedListUsingComparator:comparator];
        });

        it(@"returns an empty linked list", ^{
            [[theValue([sortedLinkedList count]) should] equal:theValue(0)];
        });
    });

    context(@"with a linked list containing only one object", ^{
        NSNumber *testObject = @1;

        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedListWithObject:testObject];
            sortedLinkedList = [originalLinkedList sortedLinkedListUsingComparator:comparator];
        });

        it(@"returns the linked list containing that object", ^{
            [[theValue([sortedLinkedList containsObject:testObject]) should] beTrue];
        });
    });

    context(@"with a linked list containing more than one object", ^{
        beforeEach(^{
            originalLinkedList = [NPLinkedList linkedListWithObjects:@2, @4, @3, @1, @5, nil];
            sortedLinkedList = [originalLinkedList sortedLinkedListUsingComparator:comparator];
        });

        it(@"returns a linked list with the same count as the input linked list", ^{
            [[theValue([originalLinkedList count]) should] equal:theValue([sortedLinkedList count])];
        });
        it(@"returns a linked list containing all the original objects sorted", ^{
            NSArray *sortedArray = [sortedLinkedList allObjects];
            BOOL isSorted = YES;
            isSorted &= ([sortedArray[0] intValue] == 1);
            isSorted &= ([sortedArray[1] intValue] == 2);
            isSorted &= ([sortedArray[2] intValue] == 3);
            isSorted &= ([sortedArray[3] intValue] == 4);
            isSorted &= ([sortedArray[4] intValue] == 5);
            [[theValue(isSorted) should] beTrue];
        });
    });
});

describe(@"-addObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *testObject = nil;
    __block NSUInteger oldCount = 0;
    __block NSUInteger afterCount = 0;
    __block NSString *listHeadObject = @"A";

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:listHeadObject, @"B", @"C", nil];
        oldCount = [linkedList count];
        testObject = nil;
    });

    context(@"with a nil object", ^{
        beforeEach(^{
            [linkedList addObject:testObject];
            afterCount = [linkedList count];
        });

        it(@"doesn't add anything to the linked list", ^{
            [[theValue(afterCount) should] equal:theValue(oldCount)];
        });
    });

    context(@"with a valid object", ^{
        beforeEach(^{
            testObject = @"foo";
            [linkedList addObject:testObject];
        });

        it(@"increases the list's count by 1", ^{
            [[theValue([linkedList count]) should] equal:theValue(oldCount + 1)];
        });
        it(@"updates the list tail to point to the new object", ^{
            [[[linkedList tailObject] should] equal:testObject];
        });

        context(@"with a list containing at least one object", ^{
            it(@"leaves the list head unchanged", ^{
                [[[linkedList headObject] should] equal:listHeadObject];
            });
        });

        context(@"with an empty list", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedList];
                [linkedList addObject:testObject];
            });

            it(@"updates the list head to point to the new object", ^{
                [[[linkedList headObject] should] equal:testObject];
            });
        });
    });
});

describe(@"-addObjectsFromLinkedList:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NPLinkedList *inputLinkedList = nil;
    __block NSUInteger linkedListCount = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObject:@"foo"];
        linkedListCount = [linkedList count];
        inputLinkedList = nil;
    });

    context(@"with a nil linked list", ^{
        beforeEach(^{
            inputLinkedList = nil;
            [linkedList addObjectsFromLinkedList:inputLinkedList];
        });

        it(@"doesn't add anything new", ^{
            [[theValue([linkedList count]) should] equal:theValue(linkedListCount)];
        });
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedList];
            [linkedList addObjectsFromLinkedList:inputLinkedList];
        });

        it(@"doesn't add anything new", ^{
            [[theValue([linkedList count]) should] equal:theValue(linkedListCount)];
        });
    });

    context(@"with a linked list containing at least one object", ^{
        __block NSUInteger inputListCount = 0;

        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObject:@"bar"];
            inputListCount = [inputLinkedList count];
            [linkedList addObjectsFromLinkedList:inputLinkedList];
        });

        it(@"adds those objects to the receiving linked list", ^{
            [[theValue([linkedList count]) should] equal:theValue(linkedListCount+inputListCount)];
        });
    });
});

describe(@"-insertObject:afterObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *newObject = nil;
    __block NSString *relativeObject = nil;
    __block NSUInteger linkedListCount = 0;
    __block NSString *objectInList = @"B";
    __block NSString *objectInListTail = @"C";

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:@"A", objectInList, objectInListTail, nil];
        linkedListCount = [linkedList count];
    });

    context(@"when the object to insert is nil", ^{
        __block NSUInteger newListCount = 0;

        beforeEach(^{
            newObject = nil;
            relativeObject = objectInList;

            [linkedList insertObject:newObject afterObject:relativeObject];
            newListCount = [linkedList count];
        });

        it(@"nothing gets added to the list", ^{
            [[theValue(newListCount) should] equal:theValue(linkedListCount)];
        });
    });

    context(@"when the relative object is nil", ^{
        __block NSUInteger newListCount = 0;

        beforeEach(^{
            newObject = @"Z";
            relativeObject = nil;

            [linkedList insertObject:newObject afterObject:relativeObject];
            newListCount = [linkedList count];
        });

        it(@"nothing gets added to the list", ^{
            [[theValue(newListCount) should] equal:theValue(linkedListCount)];
        });
    });

    context(@"when the object to insert is valid", ^{
        __block NSUInteger newListCount = 0;

        beforeEach(^{
            newObject = @"Z";
        });

        context(@"when the relative object is not in the list", ^{
            beforeEach(^{
                relativeObject = @"OBJECT_NOT_IN_LIST";
                [linkedList insertObject:newObject afterObject:relativeObject];
                newListCount = [linkedList count];
            });

            it(@"nothing gets added to the list", ^{
                [[theValue(newListCount) should] equal:theValue(linkedListCount)];
            });
        });

        context(@"when the relative object is in the list", ^{
            beforeEach(^{
                relativeObject = objectInList;
                [linkedList insertObject:newObject afterObject:relativeObject];
                newListCount = [linkedList count];
            });

            it(@"the list's count increases by 1", ^{
                [[theValue(newListCount) should] equal:theValue(linkedListCount + 1)];
            });
            it(@"places the new object after the relative object", ^{
                BOOL didInsertSuccessfully = [[linkedList allObjects] isEqualToArray:@[@"A", @"B", @"Z", @"C"]];
                [[theValue(didInsertSuccessfully) should] beTrue];
            });
        });

        context(@"when the relative object is the tail of the list", ^{
            beforeEach(^{
                relativeObject = objectInListTail;
                [linkedList insertObject:newObject afterObject:relativeObject];
                newListCount = [linkedList count];
            });

            it(@"the list's tail becomes the inserted object", ^{
                [[[linkedList tailObject] should] equal:newObject];
            });
        });
    });
});

describe(@"-insertObject:beforeObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *newObject = nil;
    __block NSString *relativeObject = nil;
    __block NSUInteger linkedListCount = 0;
    __block NSString *objectInList = @"B";
    __block NSString *objectInListHead = @"A";

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:objectInListHead, objectInList, @"C", nil];
        linkedListCount = [linkedList count];
    });

    context(@"when the object to insert is nil", ^{
        __block NSUInteger newListCount = 0;

        beforeEach(^{
            newObject = nil;
            relativeObject = objectInList;

            [linkedList insertObject:newObject beforeObject:relativeObject];
            newListCount = [linkedList count];
        });

        it(@"nothing gets added to the list", ^{
            [[theValue(newListCount) should] equal:theValue(linkedListCount)];
        });
    });

    context(@"when the relative object is nil", ^{
        __block NSUInteger newListCount = 0;

        beforeEach(^{
            newObject = @"Z";
            relativeObject = nil;

            [linkedList insertObject:newObject beforeObject:relativeObject];
            newListCount = [linkedList count];
        });

        it(@"nothing gets added to the list", ^{
            [[theValue(newListCount) should] equal:theValue(linkedListCount)];
        });
    });

    context(@"when the object to insert is valid", ^{
        __block NSUInteger newListCount = 0;

        beforeEach(^{
            newObject = @"Z";
        });

        context(@"when the relative object is not in the list", ^{
            beforeEach(^{
                relativeObject = @"OBJECT_NOT_IN_LIST";
                [linkedList insertObject:newObject beforeObject:relativeObject];
                newListCount = [linkedList count];
            });

            it(@"nothing gets added to the list", ^{
                [[theValue(newListCount) should] equal:theValue(linkedListCount)];
            });
        });

        context(@"when the relative object is in the list", ^{
            beforeEach(^{
                relativeObject = objectInList;
                [linkedList insertObject:newObject beforeObject:relativeObject];
                newListCount = [linkedList count];
            });

            it(@"the list's count increases by 1", ^{
                [[theValue(newListCount) should] equal:theValue(linkedListCount + 1)];
            });
            it(@"places the new object after the relative object", ^{
                BOOL didInsertSuccessfully = [[linkedList allObjects] isEqualToArray:@[@"A", @"Z", @"B", @"C"]];
                [[theValue(didInsertSuccessfully) should] beTrue];
            });
        });

        context(@"when the relative object is the head of the list", ^{
            beforeEach(^{
                relativeObject = objectInListHead;
                [linkedList insertObject:newObject beforeObject:relativeObject];
                newListCount = [linkedList count];
            });

            it(@"the list's head becomes the inserted object", ^{
                [[[linkedList headObject] should] equal:newObject];
            });
        });
    });
});

describe(@"-insertObjectsFromLinkedList:afterObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NPLinkedList *inputLinkedList = nil;
    __block NSString *inputObject = nil;
    __block NSString *firstObject = @"A";
    __block NSString *secondObject = @"B";
    __block NSString *thirdObject = @"C";
    __block NSUInteger listCount = 0;
    __block NSUInteger newListCount = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
        listCount = [linkedList count];
        newListCount = 0;
        inputLinkedList = nil;
        inputObject = nil;
    });

    context(@"with a nil relative object", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObject:@"foo"];
            inputObject = nil;
            [linkedList insertObjectsFromLinkedList:inputLinkedList afterObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with a nil linked list", ^{
        beforeEach(^{
            inputLinkedList = nil;
            inputObject = firstObject;
            [linkedList insertObjectsFromLinkedList:inputLinkedList afterObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedList];
            inputObject = firstObject;
            [linkedList insertObjectsFromLinkedList:inputLinkedList afterObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with an object not in the target linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObject:@"NEW_OBJECT"];
            inputObject = @"NOT_IN_LIST";
            [linkedList insertObjectsFromLinkedList:inputLinkedList afterObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with an object in the target linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObjects:@"A1", @"A2", nil];
            inputObject = firstObject;
            [linkedList insertObjectsFromLinkedList:inputLinkedList afterObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"inserts all the objects from the linked list after the relative object", ^{
            NSArray *expectedArray = @[firstObject, @"A1", @"A2", secondObject, thirdObject];
            NSArray *linkedListArray = [linkedList allObjects];
            BOOL didSucceed = [expectedArray isEqualToArray:linkedListArray];
            [[theValue(didSucceed) should] beTrue];
        });

        it(@"increases the linked list count by the amount of objects in the input linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount + [inputLinkedList count])];
        });

        context(@"when the object is the head of the list", ^{
            beforeEach(^{
                inputObject = firstObject;
                [linkedList insertObjectsFromLinkedList:inputLinkedList afterObject:inputObject];
            });

            it(@"leaves the head unmodified", ^{
                [[[linkedList headObject] should] equal:firstObject];
            });
        });

        context(@"when the object is the tail of the list", ^{
            beforeEach(^{
                inputObject = thirdObject;
                [linkedList insertObjectsFromLinkedList:inputLinkedList afterObject:inputObject];
            });

            it(@"makes the head point to the last object in the input linked list", ^{
                [[[linkedList tailObject] should] equal:@"A2"];
            });
        });
    });
});

describe(@"-insertObjectsFromLinkedList:beforeObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NPLinkedList *inputLinkedList = nil;
    __block NSString *inputObject = nil;
    __block NSString *firstObject = @"A";
    __block NSString *secondObject = @"B";
    __block NSString *thirdObject = @"C";
    __block NSUInteger listCount = 0;
    __block NSUInteger newListCount = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
        listCount = [linkedList count];
        newListCount = 0;
        inputLinkedList = nil;
        inputObject = nil;
    });

    context(@"with a nil relative object", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObject:@"foo"];
            inputObject = nil;
            [linkedList insertObjectsFromLinkedList:inputLinkedList beforeObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with a nil linked list", ^{
        beforeEach(^{
            inputLinkedList = nil;
            inputObject = thirdObject;
            [linkedList insertObjectsFromLinkedList:inputLinkedList beforeObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with an empty linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedList];
            inputObject = thirdObject;
            [linkedList insertObjectsFromLinkedList:inputLinkedList beforeObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with an object not in the target linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObject:@"NEW_OBJECT"];
            inputObject = @"NOT_IN_LIST";
            [linkedList insertObjectsFromLinkedList:inputLinkedList beforeObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"doesn't insert anything into the linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount)];
        });
    });

    context(@"with an object in the target linked list", ^{
        beforeEach(^{
            inputLinkedList = [NPLinkedList linkedListWithObjects:@"A1", @"A2", nil];
            inputObject = thirdObject;
            [linkedList insertObjectsFromLinkedList:inputLinkedList beforeObject:inputObject];
            newListCount = [linkedList count];
        });

        it(@"inserts all the objects from the linked list after the relative object", ^{
            NSArray *expectedArray = @[firstObject, secondObject, @"A1", @"A2", thirdObject];
            NSArray *linkedListArray = [linkedList allObjects];
            BOOL didSucceed = [expectedArray isEqualToArray:linkedListArray];
            [[theValue(didSucceed) should] beTrue];
        });

        it(@"increases the linked list count by the amount of objects in the input linked list", ^{
            [[theValue(newListCount) should] equal:theValue(listCount + [inputLinkedList count])];
        });

        context(@"when the object is the head of the list", ^{
            beforeEach(^{
                inputObject = firstObject;
                [linkedList insertObjectsFromLinkedList:inputLinkedList beforeObject:inputObject];
            });

            it(@"makes the head point to the first object in the input linked list", ^{
                [[[linkedList headObject] should] equal:@"A1"];
            });
        });

        context(@"when the object is the tail of the list", ^{
            beforeEach(^{
                inputObject = thirdObject;
                [linkedList insertObjectsFromLinkedList:inputLinkedList beforeObject:inputObject];
            });

            it(@"leaves the tail unmodified", ^{
                [[[linkedList tailObject] should] equal:thirdObject];
            });
        });
    });
});

describe(@"-removeAllObjects", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSUInteger countAfter = 0;

    beforeEach(^{
        linkedList = nil;
        countAfter = 0;
    });

    context(@"when the list is empty", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            [linkedList removeAllObjects];
            countAfter = [linkedList count];
        });

        it(@"remains empty", ^{
            [[theValue(countAfter) should] equal:theValue(0)];
        });
    });

    context(@"when the list contains least one object", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObjects:@"A", @"B", @"C", nil];
            [linkedList removeAllObjects];
            countAfter = [linkedList count];
        });

        it(@"removes all objects from the list", ^{
            [[theValue(countAfter) should] equal:theValue(0)];
        });
    });
});

describe(@"-removeHeadObject", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *headObject = @"A";
    __block NSString *nextObject = @"B";
    __block NSUInteger listCount = 0;
    __block NSUInteger countAfter = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:headObject, nextObject, nil];
        listCount = [linkedList count];
        [linkedList removeHeadObject];
        countAfter = [linkedList count];
    });

    context(@"when the list is empty", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            [linkedList removeHeadObject];
            countAfter = [linkedList count];
        });

        it(@"remains empty", ^{
            [[theValue(countAfter) should] equal:theValue(0)];
        });
    });

    context(@"when the list contains exactly one object", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObject:headObject];
            [linkedList removeHeadObject];
            countAfter = [linkedList count];
        });

        it(@"the list becomes empty", ^{
            [[theValue(countAfter) should] equal:theValue(0)];
        });
        it(@"the head points to nil", ^{
            [[linkedList headObject] shouldBeNil];
        });
    });

    context(@"when the list contains at least 2 objects", ^{
        it(@"drops the object count by 1", ^{
            [[theValue(countAfter) should] equal:theValue(listCount - 1)];
        });
        it(@"has a different head", ^{
            [[[linkedList headObject] shouldNot] equal:headObject];
        });
        it(@"has a head pointing to the next object in line", ^{
            [[[linkedList headObject] should] equal:nextObject];
        });
    });
});

describe(@"-removeTailObject", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *prevObject = @"A";
    __block NSString *tailObject = @"B";
    __block NSUInteger listCount = 0;
    __block NSUInteger countAfter = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:prevObject, tailObject, nil];
        listCount = [linkedList count];
        [linkedList removeTailObject];
        countAfter = [linkedList count];
    });

    context(@"when the list is empty", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            [linkedList removeTailObject];
            countAfter = [linkedList count];
        });

        it(@"remains empty", ^{
            [[theValue(countAfter) should] equal:theValue(0)];
        });
    });

    context(@"when the list contains exactly one object", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedListWithObject:tailObject];
            [linkedList removeTailObject];
            countAfter = [linkedList count];
        });

        it(@"the list becomes empty", ^{
            [[theValue(countAfter) should] equal:theValue(0)];
        });
        it(@"the tail points to nil", ^{
            [[linkedList tailObject] shouldBeNil];
        });
    });

    context(@"when the list contains at least 2 objects", ^{
        it(@"drops the object count by 1", ^{
            [[theValue(countAfter) should] equal:theValue(listCount - 1)];
        });
        it(@"has a different tail", ^{
            [[[linkedList tailObject] shouldNot] equal:tailObject];
        });
        it(@"has a tail pointing to the previous object", ^{
            [[[linkedList tailObject] should] equal:prevObject];
        });
    });
});

describe(@"-removeObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *anObject = nil;
    __block NSString *firstObject = @"A";
    __block NSString *secondObject = @"B";
    __block NSString *thirdObject = @"C";
    __block NSUInteger listCount = 0;
    __block NSUInteger afterCount = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
        listCount = [linkedList count];
        anObject = nil;
    });

    context(@"when the object is nil", ^{
        beforeEach(^{
            [linkedList removeObject:anObject];
            afterCount = [linkedList count];
        });

        it(@"leaves the linked list unchanged", ^{
            [[theValue(afterCount) should] equal:theValue(listCount)];
        });
    });

    context(@"when the list is empty", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            anObject = firstObject;
            [linkedList removeObject:anObject];
            afterCount = [linkedList count];
        });

        it(@"remains empty", ^{
            [[theValue(afterCount) should] equal:theValue(0)];
        });
    });

    context(@"when the object is not in the list", ^{
        beforeEach(^{
            anObject = @"foo";
            [linkedList removeObject:anObject];
            afterCount = [linkedList count];
        });

        it(@"leaves the linked list unchanged", ^{
            [[theValue(afterCount) should] equal:theValue(listCount)];
        });
    });

    context(@"when the object is in the list", ^{
        beforeEach(^{
            anObject = secondObject;
            [linkedList removeObject:anObject];
            afterCount = [linkedList count];
        });

        it(@"decreases the linked list count by 1", ^{
            [[theValue(afterCount) should] equal:theValue(listCount - 1)];
        });
        it(@"removes the object from the list", ^{
            BOOL isInList = [linkedList containsObject:anObject];
            [[theValue(isInList) should] beFalse];
        });

        context(@"when the list contains at least 2 objects", ^{
            context(@"when the object is the tail", ^{
                beforeEach(^{
                    linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                    listCount = [linkedList count];
                    anObject = thirdObject;
                    [linkedList removeObject:anObject];
                    afterCount = [linkedList count];
                });

                it(@"has a non-nil tail", ^{
                    [[linkedList tailObject] shouldNotBeNil];
                });
                it(@"has a tail pointing to the previous object", ^{
                    [[[linkedList tailObject] should] equal:secondObject];
                });
            });

            context(@"when the object is the head", ^{
                beforeEach(^{
                    linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                    listCount = [linkedList count];
                    anObject = firstObject;
                    [linkedList removeObject:anObject];
                    afterCount = [linkedList count];
                });

                it(@"has a non-nil head", ^{
                    [[linkedList headObject] shouldNotBeNil];
                });
                it(@"has a head pointing to the next object", ^{
                    [[[linkedList headObject] should] equal:secondObject];
                });
            });
        });

        context(@"when the list contains only one object", ^{
            beforeEach(^{
                anObject = firstObject;
                linkedList = [NPLinkedList linkedListWithObject:firstObject];
                [linkedList removeObject:anObject];
                afterCount = [linkedList count];
            });

            it(@"becomes empty", ^{
                [[theValue(afterCount) should] equal:theValue(0)];
            });
            it(@"has a nil head pointer", ^{
                [[linkedList headObject] shouldBeNil];
            });
            it(@"has a nil tail pointer", ^{
                [[linkedList tailObject] shouldBeNil];
            });
        });
    });
});

describe(@"-removeNumberOfObjects:startingWithObject:movingForward:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSInteger numObjectsToRemove = 0;
    __block NSString *relativeObject = nil;
    __block BOOL movingForward = YES;
    __block NSString *firstObject = @"A";
    __block NSString *secondObject = @"B";
    __block NSString *thirdObject = @"C";
    __block NSUInteger afterCount = 0;
    __block NSUInteger listCount = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
        listCount = [linkedList count];
        relativeObject = secondObject;
        numObjectsToRemove = 0;
        movingForward = YES;
    });

    context(@"when the list is empty", ^{
        beforeEach(^{
            linkedList = [NPLinkedList linkedList];
            [linkedList removeNumberOfObjects:numObjectsToRemove
                           startingWithObject:relativeObject
                                movingForward:movingForward];
            afterCount = [linkedList count];
        });

        it(@"remains empty", ^{
            [[theValue(afterCount) should] equal:theValue(0)];
        });
    });

    context(@"when the number of objects is 0", ^{
        beforeEach(^{
            [linkedList removeNumberOfObjects:numObjectsToRemove
                           startingWithObject:relativeObject
                                movingForward:movingForward];
            afterCount = [linkedList count];
        });

        it(@"leaves the linked list unchanged", ^{
            [[theValue(afterCount) should] equal:theValue(listCount)];
        });
    });
    
    context(@"when the number of objects is greater than 0", ^{
        beforeEach(^{
            numObjectsToRemove = 1;
        });

        context(@"when the relative object is nil", ^{
            beforeEach(^{
                relativeObject = nil;
                [linkedList removeNumberOfObjects:numObjectsToRemove
                               startingWithObject:relativeObject
                                    movingForward:movingForward];
                afterCount = [linkedList count];
            });

            it(@"leaves the linked list unchanged", ^{
                [[theValue(afterCount) should] equal:theValue(listCount)];
            });
        });
        
        context(@"when the relative object is not in the linked list", ^{
            beforeEach(^{
                relativeObject = @"foo";
                [linkedList removeNumberOfObjects:numObjectsToRemove
                               startingWithObject:relativeObject
                                    movingForward:movingForward];
                afterCount = [linkedList count];
            });

            it(@"leaves the linked list unchanged", ^{
                [[theValue(afterCount) should] equal:theValue(listCount)];
            });
        });
        
        context(@"when the relative object is in the linked list", ^{
            beforeEach(^{
                relativeObject = secondObject;
                numObjectsToRemove = 2;
                [linkedList removeNumberOfObjects:numObjectsToRemove
                               startingWithObject:relativeObject
                                    movingForward:movingForward];
                afterCount = [linkedList count];
            });

            it(@"removes at most number of objects from the list", ^{
                [[theValue(listCount - afterCount) should] beLessThanOrEqualTo:theValue(numObjectsToRemove)];
            });

            it(@"removes the relative object", ^{
                BOOL containsRelativeObject = [linkedList containsObject:relativeObject];
                [[theValue(containsRelativeObject) should] beFalse];
            });

            context(@"when moving forward", ^{
                it(@"removes a number of objects after the relative object", ^{
                    NSArray *predictedArray = @[firstObject];
                    NSArray *listArray = [linkedList allObjects];
                    BOOL didSucceed = [predictedArray isEqualToArray:listArray];
                    [[theValue(didSucceed) should] beTrue];
                });

                context(@"when the removal results in the tail object being removed", ^{
                    beforeEach(^{
                        relativeObject = secondObject;
                        numObjectsToRemove = 2;
                        [linkedList removeNumberOfObjects:numObjectsToRemove
                                       startingWithObject:relativeObject
                                            movingForward:movingForward];
                        afterCount = [linkedList count];
                    });

                    it(@"has a different tail", ^{
                        [[[linkedList tailObject] shouldNot] equal:thirdObject];
                    });
                    it(@"updates the tail to point to the right object", ^{
                        [[[linkedList tailObject] should] equal:firstObject];
                    });
                });
            });

            context(@"when moving backwards", ^{
                beforeEach(^{
                    linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                    listCount = [linkedList count];
                    relativeObject = secondObject;
                    numObjectsToRemove = 2;
                    movingForward = NO;
                    [linkedList removeNumberOfObjects:numObjectsToRemove
                                   startingWithObject:relativeObject
                                        movingForward:movingForward];
                    afterCount = [linkedList count];
                });

                it(@"removes a number of objects before the relative object", ^{
                    NSArray *predictedArray = @[thirdObject];
                    NSArray *listArray = [linkedList allObjects];
                    NSLog(@"Predicted array: %@", predictedArray);
                    NSLog(@"List array: %@", listArray);
                    BOOL didSucceed = [predictedArray isEqualToArray:listArray];
                    [[theValue(didSucceed) should] beTrue];
                });

                context(@"when the removal results in the head object being removed", ^{
                    beforeEach(^{
                        linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                        listCount = [linkedList count];
                        relativeObject = secondObject;
                        numObjectsToRemove = 2;
                        movingForward = NO;
                        [linkedList removeNumberOfObjects:numObjectsToRemove
                                       startingWithObject:relativeObject
                                            movingForward:movingForward];
                        afterCount = [linkedList count];
                    });

                    it(@"has a different head", ^{
                        [[[linkedList tailObject] shouldNot] equal:firstObject];
                    });
                    it(@"updates the head to the right object", ^{
                        [[[linkedList tailObject] should] equal:thirdObject];
                    });
                });
            });

            context(@"when the removal causes all objects to be removed", ^{
                beforeEach(^{
                    linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                    listCount = [linkedList count];
                    relativeObject = firstObject;
                    numObjectsToRemove = 3;
                    movingForward = YES;
                    [linkedList removeNumberOfObjects:numObjectsToRemove
                                   startingWithObject:relativeObject
                                        movingForward:movingForward];
                    afterCount = [linkedList count];
                });

                it(@"sets the tail to nil", ^{
                    [[linkedList tailObject] shouldBeNil];
                });
                it(@"sets the head to nil", ^{
                    [[linkedList headObject] shouldBeNil];
                });
                it(@"removes all objects from the list", ^{
                    [[theValue(afterCount) should] equal:theValue(0)];
                });
            });
        });
    });
});

describe(@"-replaceObject:withObject:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NSString *targetObject = nil;
    __block NSString *newObject = nil;
    __block NSString *firstObject = @"A";
    __block NSString *secondObject = @"B";
    __block NSString *thirdObject = @"C";
    __block NSUInteger listCount = 0;
    __block NSUInteger afterCount = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
        listCount = [linkedList count];
        afterCount = 0;
        targetObject = nil;
        newObject = nil;
    });

    context(@"when the target object is nil", ^{
        beforeEach(^{
            targetObject = nil;
            newObject = @"Z";
            [linkedList replaceObject:targetObject withObject:newObject];
            afterCount = [linkedList count];
        });

        it(@"leaves the list unchanged", ^{
            [[theValue(afterCount) should] equal:theValue(listCount)];
        });
    });

    context(@"when the target object is not in the list", ^{
        beforeEach(^{
            targetObject = @"Y";
            newObject = @"Z";
            [linkedList replaceObject:targetObject withObject:newObject];
            afterCount = [linkedList count];
        });

        it(@"leaves the list unchanged", ^{
            [[theValue(afterCount) should] equal:theValue(listCount)];
        });
    });

    context(@"when the target object is in the list", ^{
        beforeEach(^{
            targetObject = secondObject;
            newObject = @"Z";
            [linkedList replaceObject:targetObject withObject:newObject];
            afterCount = [linkedList count];
        });

        it(@"removes the target object from the list", ^{
            [[theValue([linkedList containsObject:targetObject]) should] beFalse];
        });

        context(@"when the new object is nil", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                listCount = [linkedList count];
                targetObject = secondObject;
                newObject = nil;
                [linkedList replaceObject:targetObject withObject:newObject];
                afterCount = [linkedList count];
            });

            it(@"removes the target object from the list", ^{
                [[theValue([linkedList containsObject:targetObject]) should] beFalse];
            });
        });

        context(@"when the new object is valid", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                listCount = [linkedList count];
                targetObject = secondObject;
                newObject = @"Z";
                [linkedList replaceObject:targetObject withObject:newObject];
                afterCount = [linkedList count];
            });

            it(@"adds the new object to the list", ^{
                [[theValue([linkedList containsObject:newObject]) should] beTrue];
            });

            context(@"when the target object is the head of the list", ^{
                beforeEach(^{
                    linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                    listCount = [linkedList count];
                    targetObject = firstObject;
                    newObject = @"Z";
                    [linkedList replaceObject:targetObject withObject:newObject];
                    afterCount = [linkedList count];
                });

                it(@"changes the head to point to the new object", ^{
                    [[[linkedList headObject] should] equal:newObject];
                });
            });

            context(@"when the target object is the tail of the list", ^{
                beforeEach(^{
                    linkedList = [NPLinkedList linkedListWithObjects:firstObject, secondObject, thirdObject, nil];
                    listCount = [linkedList count];
                    targetObject = thirdObject;
                    newObject = @"Z";
                    [linkedList replaceObject:targetObject withObject:newObject];
                    afterCount = [linkedList count];
                });

                it(@"changes the tail to point to the new object", ^{
                    [[[linkedList tailObject] should] equal:newObject];
                });
            });
        });
    });
});

describe(@"-replaceObject:withLinkedList:", ^{
    __block NPLinkedList *linkedList = nil;
    __block NPLinkedList *newLinkedList = nil;
    __block NSString *targetObject = nil;
    __block NSString *oldFirstObject = @"A";
    __block NSString *oldSecondObject = @"B";
    __block NSString *oldThirdObject = @"C";
    __block NSString *newFirstObject = @"D";
    __block NSString *newSecondObject = @"E";
    __block NSString *newThirdObject = @"F";
    __block NSUInteger listCount = 0;
    __block NSUInteger newListCount = 0;
    __block NSUInteger afterCount = 0;

    beforeEach(^{
        linkedList = [NPLinkedList linkedListWithObjects:oldFirstObject, oldSecondObject, oldThirdObject, nil];
        listCount = [linkedList count];
        newLinkedList = [NPLinkedList linkedListWithObjects:newFirstObject, newSecondObject, newThirdObject, nil];
        newListCount = [newLinkedList count];
        afterCount = 0;
        targetObject = nil;
    });

    context(@"when the target object is nil", ^{
        beforeEach(^{
            [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
            afterCount = [linkedList count];
        });

        it(@"leaves the list unchanged", ^{
            [[theValue(afterCount) should] equal:theValue(listCount)];
        });
    });

    context(@"when the target object is not in the list", ^{
        beforeEach(^{
            targetObject = @"foo";
            [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
            afterCount = [linkedList count];
        });

        it(@"leaves the list unchanged", ^{
            [[theValue(afterCount) should] equal:theValue(listCount)];
        });
    });

    context(@"when the target object is in the list", ^{
        beforeEach(^{
            targetObject = oldSecondObject;
            [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
            afterCount = [linkedList count];
        });

        it(@"removes the target object from the list", ^{
            [[theValue([linkedList containsObject:targetObject]) should] beFalse];
        });

        context(@"when the new linked list is nil", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:oldFirstObject, oldSecondObject, oldThirdObject, nil];
                listCount = [linkedList count];
                targetObject = oldSecondObject;
                newLinkedList = nil;
                [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
                afterCount = [linkedList count];
            });

            it(@"removes the target object from the list", ^{
                [[theValue([linkedList containsObject:targetObject]) should] beFalse];
            });
        });

        context(@"when the new linked list is empty", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:oldFirstObject, oldSecondObject, oldThirdObject, nil];
                listCount = [linkedList count];
                targetObject = oldSecondObject;
                newLinkedList = [NPLinkedList linkedList];
                [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
                afterCount = [linkedList count];
            });

            it(@"removes the target object from the list", ^{
                [[theValue([linkedList containsObject:targetObject]) should] beFalse];
            });
        });

        context(@"when the new linked list contains exactly one object", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:oldFirstObject, oldSecondObject, oldThirdObject, nil];
                listCount = [linkedList count];
                targetObject = oldSecondObject;
                newLinkedList = [NPLinkedList linkedListWithObject:newFirstObject];
                [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
                afterCount = [linkedList count];
            });

            it(@"doesn't change the list count", ^{
                [[theValue(afterCount) should] equal:theValue(listCount)];
            });
            it(@"adds the object from the new linked list into this linked list", ^{
                [[theValue([linkedList containsObject:newFirstObject]) should] beTrue];
            });
        });

        context(@"when the new linked list contains more than one object", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:oldFirstObject, oldSecondObject, oldThirdObject, nil];
                listCount = [linkedList count];
                targetObject = oldSecondObject;
                [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
                afterCount = [linkedList count];
            });

            it(@"increases the list count by the count of the new list - 1", ^{
                [[theValue(afterCount) should] equal:theValue(listCount + newListCount -1)];
            });
            it(@"adds all the objects from the new linked list into this linked list", ^{
                BOOL hasAllNewItems = YES;
                hasAllNewItems &= [linkedList containsObject:newFirstObject];
                hasAllNewItems &= [linkedList containsObject:newSecondObject];
                hasAllNewItems &= [linkedList containsObject:newThirdObject];
                [[theValue(hasAllNewItems) should] beTrue];
            });
        });

        context(@"when the target object is the head", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:oldFirstObject, oldSecondObject, oldThirdObject, nil];
                listCount = [linkedList count];
                targetObject = oldFirstObject;
                [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
                afterCount = [linkedList count];
            });

            it(@"makes the head point to the first object in the new linked list", ^{
                [[[linkedList headObject] should] equal:newFirstObject];
            });
        });

        context(@"when the target object is the tail", ^{
            beforeEach(^{
                linkedList = [NPLinkedList linkedListWithObjects:oldFirstObject, oldSecondObject, oldThirdObject, nil];
                listCount = [linkedList count];
                targetObject = oldThirdObject;
                [linkedList replaceObject:targetObject withLinkedList:newLinkedList];
                afterCount = [linkedList count];
            });

            it(@"makes the tail point to the last object in the new linked list", ^{
                [[[linkedList tailObject] should] equal:newThirdObject];
            });
        });
    });
});

describe(@"-map:", ^{
    // TODO
});

SPEC_END