//
//  RPRTableViewController.m
//  rprtr
//
//  Created by Karolis Stasaitis on 27/08/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

#import "IOTableViewController.h"
#import "IOTableViewSectionModel.h"
#import "IOTableViewCellModel.h"
#import "IOTableViewHeaderFooterView.h"
#import "IOTableViewCell.h"

@implementation IOTableViewController

- (void)pre
{
    //Implemented in child
}

- (void)setupViews
{
    [self registerViewsForIdentifiersInModel];
    
    self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.tableView.sectionFooterHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.estimatedSectionHeaderHeight = 40;
    self.tableView.estimatedSectionFooterHeight = 40;
    self.tableView.estimatedRowHeight = 44.0;
}

- (void)post
{
    //Implemented in child
}

- (instancetype)initWithViewModel:(IOTableViewModel *)viewModel
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

- (void)registerViewsForIdentifiersInModel
{
    NSArray *cellIdentifiers = [self.viewModel.sectionViewModels valueForKeyPath:@"@distinctUnionOfArrays.cellViewModels.cellIdentifier"];
    for (NSString *cellId in cellIdentifiers) {
        [self.tableView registerClass:NSClassFromString(cellId) forCellReuseIdentifier:cellId];
    }

    NSArray *headerFooterIdentifiers = [@[
            [self.viewModel.sectionViewModels valueForKeyPath:@"@distinctUnionOfObjects.headerViewModel.headerFooterIdentifier"],
            [self.viewModel.sectionViewModels valueForKeyPath:@"@distinctUnionOfObjects.footerViewModel.headerFooterIdentifier"]
    ] valueForKeyPath:@"@distinctUnionOfArrays.self"];

    for (NSString *headerFooterId in headerFooterIdentifiers) {
        [self.tableView registerClass:NSClassFromString(headerFooterId) forHeaderFooterViewReuseIdentifier:headerFooterId];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.sectionViewModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    IOTableViewSectionModel *sectionModel = self.viewModel.sectionViewModels[section];
    return [sectionModel.cellViewModels count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IOTableViewSectionModel *sectionModel = self.viewModel.sectionViewModels[indexPath.section];
    
    IOTableViewCellModel *cellModel = sectionModel.cellViewModels[indexPath.row];
    IOTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[cellModel cellIdentifier] forIndexPath:indexPath];
    
    [cell setupWithViewModel:cellModel];
    
    return cell;
}

#pragma mark - Section Header & Footer Heights

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    IOTableViewHeaderFooterViewModel *headerModel = [self.viewModel.sectionViewModels[section] headerViewModel];
    if (headerModel) {
        return UITableViewAutomaticDimension;
    }
    else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    IOTableViewHeaderFooterViewModel *footerModel = [self.viewModel.sectionViewModels[section] footerViewModel];
    if (footerModel) {
        return UITableViewAutomaticDimension;
    }
    else {
        return 0;
    }
}

#pragma mark - Section Header & Footer Views

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    IOTableViewHeaderFooterViewModel *headerModel = [self.viewModel.sectionViewModels[section] headerViewModel];
    
    if (headerModel) {
        IOTableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[headerModel headerFooterIdentifier]];
        [headerView setupWithViewModel:headerModel];
        
        return headerView;
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    IOTableViewHeaderFooterViewModel *footerModel = [self.viewModel.sectionViewModels[section] footerViewModel];
    
    if (footerModel) {
        IOTableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[footerModel headerFooterIdentifier]];
        [headerView setupWithViewModel:footerModel];
        
        return headerView;
    }
    
    return nil;
}

@end
