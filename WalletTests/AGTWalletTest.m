//
//  AGTWalletTest.m
//  Wallet
//
//  Created by Joan on 03/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"
#import "AGTWallet.h"

@interface AGTWalletTest : XCTestCase

@end

@implementation AGTWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//eur40 = usd30 = usd100 2:1

- (void)testAdditionWithReduction {
    AGTBroker *broker = [AGTBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[AGTMoney dollarWithAmount:20]];
    
    AGTMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:100]);
}

- (void)testAddMoney {
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    XCTAssertEqual(1, wallet.count);
    [wallet addMoney:[AGTMoney dollarWithAmount:20]];
    [wallet addMoney:[AGTMoney dollarWithAmount:20]];
    XCTAssertEqual(3, wallet.count);
}

- (void)testTakeMoney{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    AGTMoney *money1 = [AGTMoney dollarWithAmount:20];
    AGTMoney *money2 = [AGTMoney dollarWithAmount:20];
    [wallet addMoney:money1];
    [wallet addMoney:money2];
    XCTAssertEqual(3, wallet.count, @"I have added 3 moneys");
    [wallet takeMoney:money1];
    XCTAssertEqual(2, wallet.count, @"I have taken 1 moneys, I will have 1");
    [wallet takeMoney:money1];
    XCTAssertEqual(2, wallet.count, @"Taking a money not in my wallet should do nothing");
    [wallet takeMoney:money2];
    XCTAssertEqual(1, wallet.count, @"I have taken 1 moneys, I will have 1");

}

@end