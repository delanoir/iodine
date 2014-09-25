//
//  RPRTableViewCell.m
//  rprtr
//
//  Created by Karolis Stasaitis on 23/08/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import "IOTableViewCell.h"

@implementation IOTableViewCell

+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

- (void)setupWithViewModel:(IOTableViewCellModel *)viewModel
{
    _viewModel = viewModel;
}

@end
