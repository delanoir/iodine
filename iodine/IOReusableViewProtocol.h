//
//  IOReusableViewProtocol.h
//  iodine
//
//  Created by Karolis Stasaitis on 25/09/14.
//  Copyright (c) 2014 Karolis Stasaitis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IOViewModel;

@protocol IOReusableViewProtocol <NSObject>

//Default Model container.
@property (nonatomic, strong) IOViewModel *viewModel;

//Default Model Setup
- (void)setupWithViewModel:(IOViewModel *)viewModel;

//Identifier usualy used to link models with cells, though not required
+ (NSString *)identifier;

@end
