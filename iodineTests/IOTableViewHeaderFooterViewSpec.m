#import "Specta.h"
#import "IOTableViewHeaderFooterView.h"

SpecBegin(IOTableViewHeaderFooterView)

describe(@"IOTableViewHeaderFooterView", ^{
    it(@"should conform to IOReusableViewProtocol", ^{
        expect([IOTableViewHeaderFooterView conformsToProtocol:@protocol(IOReusableViewProtocol)]).to.beTruthy;
    });
});

SpecEnd
