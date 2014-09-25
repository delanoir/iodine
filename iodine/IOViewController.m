//
//  RMViewController.m
//  rprtr
//
//  Created by Karolis Stasaitis on 19/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import "IOViewController.h"

@implementation IOViewController

- (void)pre
{
    //Implemented in child
}

- (void)setupViews
{
    //Implemented in child
}

- (void)post
{
    //Implemented in child
}

- (instancetype)initWithViewModel:(IOViewModel *)viewModel
{
    self = [self init];
    if (self) {
        _viewModel = viewModel;
        [self pre];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];
    [self post];
}

@end
