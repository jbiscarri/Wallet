//
//  AGTWalletTableTest.m
//  Wallet
//
//  Created by Joan on 04/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTWalletTempTableViewController.h"
#import "AGTWallet.h"

@interface AGTWalletTableTest : XCTestCase

@property (nonatomic, strong) AGTWalletTempTableViewController *walletVc;
@property (nonatomic, strong) AGTWallet *wallet;

@end

@implementation AGTWalletTableTest

- (void)setUp {
    [super setUp];
    self.wallet = [[AGTWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    self.walletVc = [[AGTWalletTempTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatTableHasOneSection {
    NSUInteger sections = [self.walletVc numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 1, @"There can only be one");
}

- (void)testThatNumberOfCellsIsNumberOfMoneysPlusOne {
    XCTAssertEqual(self.wallet.count + 1, [self.walletVc tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1");
}

@end
