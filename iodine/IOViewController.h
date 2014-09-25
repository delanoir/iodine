//
//  RMViewController.h
//  rprtr
//
//  Created by Karolis Stasaitis on 19/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IOViewControllerProtocol.h"
#import "IOViewModel.h"

@interface IOViewController : UIViewController <IOViewControllerProtocol>

@property (nonatomic, strong) IOViewModel *viewModel;

- (instancetype)initWithViewModel:(IOViewModel *)viewModel;

- (void)pre NS_REQUIRES_SUPER;
- (void)setupViews NS_REQUIRES_SUPER;
- (void)post NS_REQUIRES_SUPER;

@end
