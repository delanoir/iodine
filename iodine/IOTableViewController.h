//
//  RPRTableViewController.h
//  rprtr
//
//  Created by Karolis Stasaitis on 27/08/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IOViewControllerProtocol.h"
#import "IOTableViewModel.h"

@interface IOTableViewController : UITableViewController <IOViewControllerProtocol, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IOTableViewModel *viewModel;

- (instancetype)initWithViewModel:(IOTableViewModel *)viewModel;

- (void)pre NS_REQUIRES_SUPER;
- (void)setupViews NS_REQUIRES_SUPER;
- (void)post NS_REQUIRES_SUPER;

@end
