//
//  RPRTableViewCell.h
//  rprtr
//
//  Created by Karolis Stasaitis on 23/08/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IOTableViewCellModel.h"
#import "IOReusableViewProtocol.h"

@interface IOTableViewCell : UITableViewCell <IOReusableViewProtocol>

@property (nonatomic, assign) BOOL ignoreSignals;
@property (nonatomic, strong) IOTableViewCellModel *viewModel;

+ (NSString *)identifier;

- (void)setupWithViewModel:(IOTableViewCellModel *)viewModel;

@end
