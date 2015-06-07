//
//  AGTWalletTableTest.m
//  Wallet
//
//  Created by Joan on 04/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
//#import "AGTWalletTempTableViewController.h"
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"

@interface AGTWalletTableTest : XCTestCase

@property (nonatomic, strong) AGTWalletTableViewController *walletVc;
@property (nonatomic, strong) AGTWallet *wallet;

@end

@implementation AGTWalletTableTest

- (void)setUp {
    [super setUp];
    self.wallet = [[AGTWallet alloc] init];
    self.walletVc = [[AGTWalletTableViewController alloc] initWithStyle:UITableViewStylePlain
                                                                 wallet:self.wallet];
}

- (void)tearDown {
    [super tearDown];
    self.wallet = nil;
    self.walletVc = nil;
}

- (void)testThatTableHasSectionNumberEqualToCurrenciesAddingOne {
    [self.wallet addMoney:[AGTMoney dollarWithAmount:1]];
    NSUInteger sections = [self.walletVc numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 2, @"It should return 2 sections: USD and Total");
    [self.wallet addMoney:[AGTMoney euroWithAmount:1]];
    sections = [self.walletVc numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 3, @"It should return 2 sections: 2xUSD and Total");

}

- (void)testThatNumberOfCellsForSectionIsNumberOfMoneysPlusOne {
    [self.wallet addMoney:[AGTMoney dollarWithAmount:1]];
    AGTMoney *aMoney = [AGTMoney dollarWithAmount:1];
    [self.wallet addMoney:aMoney];
    XCTAssertEqual(3, [self.walletVc tableView:nil numberOfRowsInSection:0], @"We have two moneys, so We need to have 3 rows ");
    [self.wallet takeMoney:aMoney];
    XCTAssertEqual(2, [self.walletVc tableView:nil numberOfRowsInSection:0], @"We have two moneys, so We need to have 3 rows ");

}

@end
