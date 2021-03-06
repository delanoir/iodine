#import "IOTableViewController.h"
#import "IOTableViewSectionModel.h"
#import "IOTableViewHeaderFooterViewModel.h"
#import "IOTableViewCellModel.h"
#import "IOTableViewCell.h"
#import "IOTableViewHeaderFooterView.h"

#import "UITableViewMockHelper.h"

@interface IOTableViewController (Private)

@property (nonatomic, strong) NSMutableSet *registeredCells;
@property (nonatomic, strong) NSMutableSet *registeredSections;

@end

@interface UITableView (Private)

- (void)_setViewDelegate:(UIViewController *)viewController;
- (void)_setRefreshControl:(UIRefreshControl *)refreshControl;

@end

SpecBegin(IOTableViewController)

__block IOTableViewController *tableViewController;

describe(@"IOViewController", ^{
    it(@"conforms to IOViewControllerProtocol", ^{
        expect([IOTableViewController conformsToProtocol:@protocol(IOViewControllerProtocol)]).to.beTruthy;
    });
});

describe(@"works as it should", ^{
    
    id cellModelMock = OCMStrictClassMock([IOTableViewCellModel class]);
    id headerModelMock = OCMStrictClassMock([IOTableViewHeaderFooterViewModel class]);
    id footerModelMock = OCMStrictClassMock([IOTableViewHeaderFooterViewModel class]);
    
    OCMStub([cellModelMock cellIdentifier]).andReturn(@"IOTableViewCell");
    OCMStub([cellModelMock valueForKey:[OCMArg isEqual:@"cellIdentifier"]]).andReturn(@"IOTableViewCell");
    OCMStub([headerModelMock headerFooterIdentifier]).andReturn(@"IOTableViewHeaderView");
    OCMStub([headerModelMock valueForKeyPath:[OCMArg isEqual:@"headerFooterIdentifier"]]).andReturn(@"IOTableViewHeaderView");
    OCMStub([footerModelMock headerFooterIdentifier]).andReturn(@"IOTableViewFooterView");
    OCMStub([footerModelMock valueForKeyPath:[OCMArg isEqual:@"headerFooterIdentifier"]]).andReturn(@"IOTableViewFooterView");
    
    IOTableViewSectionModel *sectionModel = [[IOTableViewSectionModel alloc] init];
    sectionModel.headerViewModel = headerModelMock;
    sectionModel.cellViewModels = [@[cellModelMock] mutableCopy];
    sectionModel.footerViewModel = footerModelMock;
    
    IOTableViewModel *tableViewModel = [[IOTableViewModel alloc] init];
    tableViewModel.sectionViewModels = [@[sectionModel] mutableCopy];
    
    tableViewController = [[IOTableViewController alloc] initWithViewModel:tableViewModel];
    
    id tableViewMock = [UITableViewMockHelper tableViewMockWithTableViewController:tableViewController];
    
    tableViewController.tableView = tableViewMock;
    
    it(@"successfully registers the classes", ^{
        [UITableViewMockHelper setupTableViewMock:tableViewMock withCellRegisterMethodsForIdentifier:@"IOTableViewCell"];
        [UITableViewMockHelper setupTableViewMock:tableViewMock withHeaderFooterRegisterMethodsForIdentifier:@"IOTableViewHeaderView"];
        [UITableViewMockHelper setupTableViewMock:tableViewMock withHeaderFooterRegisterMethodsForIdentifier:@"IOTableViewFooterView"];
        
        [tableViewController viewDidLoad];
        
        OCMVerifyAll(tableViewMock);
        expect([[tableViewController registeredCells] anyObject]).to.equal(@"IOTableViewCell");
        expect([tableViewController registeredSections]).to.equal([[NSSet alloc] initWithArray:@[@"IOTableViewHeaderView", @"IOTableViewFooterView"]]);
    });
    
    describe(@"implements UITableView protocols", ^{
        
        describe(@"works as a UITableViewDataSource", ^{
            it(@"returns the correct number of sections", ^{
                expect([tableViewController numberOfSectionsInTableView:tableViewMock]).to.equal(1);
            });
            
            it(@"returns the correct number of rows for a section", ^{
                expect([tableViewController tableView:tableViewMock numberOfRowsInSection:0]).to.equal(1);
            });
        });
        
        describe(@"works as a UITableViewDelegate", ^{
            describe(@"for Cells", ^{
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                
                it(@"returns the correct height for a row", ^{
                    expect([tableViewController tableView:tableViewMock heightForRowAtIndexPath:indexPath]).to.equal(UITableViewAutomaticDimension);
                });
                
                it(@"returns the correct cell for a row", ^{
                    id tableCellMock = OCMStrictClassMock([IOTableViewCell class]);
                    
                    OCMExpect([tableCellMock setupWithViewModel:[OCMArg isEqual:cellModelMock]]);
                    OCMStub([tableViewMock dequeueReusableCellWithIdentifier:[OCMArg isEqual:@"IOTableViewCell"] forIndexPath:[OCMArg isEqual:indexPath]]).andReturn(tableCellMock);
                    expect([tableViewController tableView:tableViewMock cellForRowAtIndexPath:indexPath]).to.equal(tableCellMock);
                });
            });
            
            describe(@"for Headers", ^{
                it(@"returns the correct height for a section header", ^{
                    expect([tableViewController tableView:tableViewMock heightForHeaderInSection:0]).to.equal(UITableViewAutomaticDimension);
                });
                
                it(@"returns the correct view for a section header", ^{
                    id headerMock = OCMStrictClassMock([IOTableViewHeaderFooterView class]);
                    
                    OCMExpect([headerMock setupWithViewModel:[OCMArg isEqual:headerModelMock]]);
                    OCMStub([tableViewMock dequeueReusableHeaderFooterViewWithIdentifier:[OCMArg isEqual:@"IOTableViewHeaderView"]]).andReturn(headerMock);
                    expect([tableViewController tableView:tableViewMock viewForHeaderInSection:0]).to.equal(headerMock);
                });
            });
            
            describe(@"for Footers", ^{
                it(@"returns the correct height for a section header", ^{
                    expect([tableViewController tableView:tableViewMock heightForHeaderInSection:0]).to.equal(UITableViewAutomaticDimension);
                });
                
                it(@"returns the correct view for a section header", ^{
                    id footerMock = OCMStrictClassMock([IOTableViewHeaderFooterView class]);
                    
                    OCMExpect([footerMock setupWithViewModel:[OCMArg isEqual:footerModelMock]]);
                    OCMStub([tableViewMock dequeueReusableHeaderFooterViewWithIdentifier:[OCMArg isEqual:@"IOTableViewFooterView"]]).andReturn(footerMock);
                    expect([tableViewController tableView:tableViewMock viewForFooterInSection:0]).to.equal(footerMock);
                });
            });
        });
    });
    
    it(@"deregisters classes when replaced with a different view", ^{
        id tableViewMock1 = [UITableViewMockHelper tableViewMockWithTableViewController:tableViewController];
        [UITableViewMockHelper setupTableViewMock:tableViewMock1 withCellRegisterMethodsForIdentifier:@"IOTableViewCell"];
        [UITableViewMockHelper setupTableViewMock:tableViewMock1 withHeaderFooterRegisterMethodsForIdentifier:@"IOTableViewHeaderView"];
        [UITableViewMockHelper setupTableViewMock:tableViewMock1 withHeaderFooterRegisterMethodsForIdentifier:@"IOTableViewFooterView"];
        
        tableViewController.tableView = tableViewMock1;
        
        expect([[tableViewController registeredCells] count]).to.equal(0);
        expect([[tableViewController registeredSections] count]).to.equal(0);
    });
    
    it(@"reregisters cell classes after the view model has been replaced", ^{
        tableViewController.viewModel = nil;
        tableViewController.viewModel = tableViewModel;
        
        expect([[tableViewController registeredCells] anyObject]).to.equal(@"IOTableViewCell");
        expect([tableViewController registeredSections]).to.equal([[NSSet alloc] initWithArray:@[@"IOTableViewHeaderView", @"IOTableViewFooterView"]]);
    });
});

SpecEnd
