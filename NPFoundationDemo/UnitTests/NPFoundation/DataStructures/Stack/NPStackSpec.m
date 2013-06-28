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

SPEC_END