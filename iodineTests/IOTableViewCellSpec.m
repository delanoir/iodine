#import "Specta.h"
#import "IOTableViewCell.h"

SpecBegin(IOTableViewCell)

describe(@"IOTableViewCell", ^{
    it(@"should conform to IOReusableViewProtocol", ^{
        expect([IOTableViewCell conformsToProtocol:@protocol(IOReusableViewProtocol)]).to.beTruthy;
    });
});

SpecEnd
