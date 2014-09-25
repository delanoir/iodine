//
//  RMViewControllerProtocol.h
//  rprtr
//
//  Created by Karolis Stasaitis on 19/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IOViewModel;

@protocol IOViewControllerProtocol

//Default Model container.
@property (nonatomic, strong) IOViewModel *viewModel;

//Default Model Initializer
- (instancetype)initWithViewModel:(IOViewModel *)viewModel;

//Pre-binding Model (before views are loaded).
- (void)pre;

//Seting up views.
- (void)setupViews;

//Binding the Model after the views have been set up.
- (void)post;

@end
