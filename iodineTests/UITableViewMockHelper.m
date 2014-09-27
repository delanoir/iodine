//
//  UITableViewMockHelper.m
//  iodine
//
//  Created by Karolis Stasaitis on 27/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewMockHelper.h"

@interface UITableView (Private)

- (void)_setViewDelegate:(UIViewController *)viewController;
- (void)_setRefreshControl:(UIRefreshControl *)refreshControl;

@end

@implementation UITableViewMockHelper

+ (id)tableViewMockWithTableViewController:(UITableViewController *)tableViewController
{
    id tableViewMock = OCMPartialMock([[UITableView alloc] init]);
    
    OCMExpect([tableViewMock reloadData]);
    OCMExpect([tableViewMock _setViewDelegate:[OCMArg isEqual:tableViewController]]);
    OCMExpect([tableViewMock _setRefreshControl:nil]);
    OCMStub([tableViewMock subviews]).andReturn(nil);
    OCMStub([tableViewMock dataSource]).andReturn(tableViewController);
    OCMStub([tableViewMock delegate]).andReturn(tableViewController);
    
    return tableViewMock;
}

+ (void)setupTableViewMock:(id)tableViewMock withCellRegisterMethodsForIdentifier:(NSString *)classString
{
    OCMExpect([tableViewMock registerClass:[OCMArg isEqual:NSClassFromString(classString)] forCellReuseIdentifier:[OCMArg isEqual:classString]]);
    OCMStub([tableViewMock registerClass:[OCMArg isEqual:NSClassFromString(classString)] forCellReuseIdentifier:[OCMArg isEqual:classString]]);
}

+ (void)setupTableViewMock:(id)tableViewMock withHeaderFooterRegisterMethodsForIdentifier:(NSString *)classString
{
    OCMExpect([tableViewMock registerClass:[OCMArg isEqual:NSClassFromString(classString)] forHeaderFooterViewReuseIdentifier:[OCMArg isEqual:classString]]);
    OCMStub([tableViewMock registerClass:[OCMArg isEqual:NSClassFromString(classString)] forHeaderFooterViewReuseIdentifier:[OCMArg isEqual:classString]]);
}

@end
