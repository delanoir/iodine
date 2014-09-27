//
//  UITableViewMockHelper.h
//  iodine
//
//  Created by Karolis Stasaitis on 27/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UITableViewMockHelper : NSObject

+ (id)tableViewMockWithTableViewController:(UITableViewController *)tableViewController;
+ (void)setupTableViewMock:(id)tableViewMock withCellRegisterMethodsForIdentifier:(NSString *)classString;
+ (void)setupTableViewMock:(id)tableViewMock withHeaderFooterRegisterMethodsForIdentifier:(NSString *)classString;

@end
