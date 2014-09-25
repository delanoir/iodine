//
//  RPRTableViewHeaderFooterView.m
//  rprtr
//
//  Created by Karolis Stasaitis on 01/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import "IOTableViewHeaderFooterView.h"

@implementation IOTableViewHeaderFooterView

+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

- (void)setupWithViewModel:(IOTableViewHeaderFooterViewModel *)viewModel
{
    _viewModel = viewModel;
}

@end
