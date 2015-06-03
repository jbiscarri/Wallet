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
    [broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[AGTMoney dollarWithAmount:20]];
    
    AGTMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:100]);
    
}

@end