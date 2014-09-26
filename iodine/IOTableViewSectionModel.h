//
//  RPRTableViewSectionModel.h
//  rprtr
//
//  Created by Karolis Stasaitis on 27/08/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import "IOViewModel.h"
#import "IOTableViewHeaderFooterViewModel.h"

@interface IOTableViewSectionModel : IOViewModel

@property (nonatomic, strong) IOTableViewHeaderFooterViewModel *headerViewModel;
@property (nonatomic, strong) NSMutableArray *cellViewModels;
@property (nonatomic, strong) IOTableViewHeaderFooterViewModel *footerViewModel;

@end
