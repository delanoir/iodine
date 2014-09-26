#import "Specta.h"
#import "IOViewController.h"

SpecBegin(IOViewController)

describe(@"IOViewController", ^{
    it(@"should conform to IOViewControllerProtocol", ^{
        expect([IOViewController conformsToProtocol:@protocol(IOViewControllerProtocol)]).to.beTruthy;
    });
});

SpecEnd
