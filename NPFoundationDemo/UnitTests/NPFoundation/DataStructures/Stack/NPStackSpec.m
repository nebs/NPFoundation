#import "NPStack.h"
#import "Kiwi.h"

SPEC_BEGIN(Stack)

describe(@"+stack", ^{
    __block NPStack *newStack = nil;

    beforeEach(^{
        newStack = [NPStack stack];
    });

    it(@"returns a non-nil stack", ^{
        [newStack shouldNotBeNil];
    });
    it(@"returns a new stack instance", ^{
        [[newStack should] beKindOfClass:[NPStack class]];
    });
    it(@"returns an empty stack", ^{
        [[theValue([newStack count]) should] equal:theValue(0)];
    });
});

describe(@"-count", ^{
    __block NPStack *stack = nil;
    __block NSUInteger count = 0;

    beforeEach(^{
        stack = [NPStack stack];
        count = 0;
    });

    context(@"when the stack is empty", ^{
        beforeEach(^{
            count = [stack count];
        });

        it(@"returns 0", ^{
            [[theValue(count) should] equal:theValue(0)];
        });
    });

    context(@"when the stack has at least one item", ^{
        beforeEach(^{
            stack = [NPStack stack];
            [stack pushObject:@"A"];
            [stack pushObject:@"B"];
            [stack pushObject:@"C"];
            count = [stack count];
        });

        it(@"returns the number of items on the stack", ^{
            [[theValue(count) should] equal:theValue(3)];
        });
    });
});

describe(@"-peekObject", ^{
    __block NPStack *stack = nil;
    __block NSString *peekObject = nil;
    __block NSString *topObject = @"C";
    __block NSInteger countBefore = 0;
    __block NSInteger countAfter = 0;

    beforeEach(^{
        stack = [NPStack stack];
        [stack pushObject:@"A"];
        [stack pushObject:@"B"];
        [stack pushObject:topObject];
        peekObject = nil;
        countBefore = [stack count];
        countAfter = 0;
    });

    context(@"when the stack is empty", ^{
        beforeEach(^{
            stack = [NPStack stack];
            peekObject = [stack peekObject];
        });

        it(@"returns nil", ^{
            [peekObject shouldBeNil];
        });
    });

    context(@"when the stack has at least one item", ^{
        beforeEach(^{
            peekObject = [stack peekObject];
            countAfter = [stack count];
        });

        it(@"returns the top object", ^{
            [[peekObject should] equal:topObject];
        });
        it(@"doesn't change the size of the stack", ^{
            [[theValue(countAfter) should] equal:theValue(countBefore)];
        });
    });
});

describe(@"-pushObject:", ^{
    __block NPStack *stack = nil;
    __block NSString *peekObject = nil;
    __block NSString *newObject = nil;
    __block NSInteger countBefore = 0;
    __block NSInteger countAfter = 0;
    __block NSString *topObject = nil;

    beforeEach(^{
        stack = [NPStack stack];
        peekObject = nil;
        countBefore = 0;
        countAfter = 0;
        newObject = @"foo";
        topObject = nil;
    });

    context(@"when the object is nil", ^{
        beforeEach(^{
            newObject = nil;
            [stack pushObject:newObject];
            countAfter = [stack count];
        });

        it(@"doesn't change the size of the stack", ^{
            [[theValue(countAfter) should] equal:theValue(countBefore)];
        });
    });

    context(@"when the object is not nil", ^{
        beforeEach(^{
            [stack pushObject:newObject];
            countAfter = [stack count];
            topObject = [stack peekObject];
        });

        it(@"increments the count by 1", ^{
            [[theValue(countAfter) should] equal:theValue(countBefore + 1)];
        });
        it(@"adds the new object at the top of the stack", ^{
            [[topObject should] equal:newObject];
        });
    });
});

describe(@"-popObject", ^{
    __block NPStack *stack = nil;
    __block NSString *popObject = nil;
    __block NSInteger countBefore = 0;
    __block NSInteger countAfter = 0;
    __block NSString *topObject = @"C";
    __block NSString *newTopObject = nil;

    beforeEach(^{
        stack = [NPStack stack];
        [stack pushObject:@"A"];
        [stack pushObject:@"B"];
        [stack pushObject:topObject];
        countBefore = [stack count];
        popObject = nil;
        countAfter = 0;
        newTopObject = nil;
    });

    context(@"when the stack is empty", ^{
        beforeEach(^{
            stack = [NPStack stack];
            popObject = [stack popObject];
            countAfter = [stack count];
        });

        it(@"remains empty", ^{
            [[theValue(countAfter) should] equal:theValue(0)];
        });
        it(@"returns nil", ^{
            [popObject shouldBeNil];
        });
    });

    context(@"when the stack has at least one object", ^{
        beforeEach(^{
            popObject = [stack popObject];
            countAfter = [stack count];
            newTopObject = [stack peekObject];
        });

        it(@"reduces the count by 1", ^{
            [[theValue(countAfter) should] equal:theValue(countBefore - 1)];
        });
        it(@"removes the top object", ^{
            [[newTopObject shouldNot] equal:topObject];
        });
    });
});

SPEC_END