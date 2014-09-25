//
//  iodineTests.m
//  iodineTests
//
//  Created by Karolis Stasaitis on 25/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "IOTableViewCell.h"
#import "IOTableViewHeaderFooterView.h"

#import "IOViewController.h"
#import "IOTableViewController.h"

@interface iodineTests : XCTestCase

@end

@implementation iodineTests

- (void)testReusableViewProtocolImplementation {
    XCTAssertTrue([IOTableViewCell conformsToProtocol:@protocol(IOReusableViewProtocol)]);
    XCTAssertTrue([IOTableViewHeaderFooterView conformsToProtocol:@protocol(IOReusableViewProtocol)]);
}

- (void)testViewControllerProtocolImplementation {
    XCTAssertTrue([IOViewController conformsToProtocol:@protocol(IOViewControllerProtocol)]);
    XCTAssertTrue([IOTableViewController conformsToProtocol:@protocol(IOViewControllerProtocol)]);
}

@end
