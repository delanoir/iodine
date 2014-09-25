//
//  RPRTableViewHeaderFooterView.h
//  rprtr
//
//  Created by Karolis Stasaitis on 01/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IOTableViewHeaderFooterViewModel.h"
#import "IOReusableViewProtocol.h"

@interface IOTableViewHeaderFooterView : UITableViewHeaderFooterView <IOReusableViewProtocol>

@property (nonatomic, strong) IOTableViewHeaderFooterViewModel *viewModel;

+ (NSString *)identifier;

- (void)setupWithViewModel:(IOTableViewHeaderFooterViewModel *)viewModel;

@end