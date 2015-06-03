//
//  AGTBrokerTest.m
//  Wallet
//
//  Created by Joan on 03/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTBrokerTest : XCTestCase
@property (nonatomic, strong) AGTBroker *emptyBroker;
@property (nonatomic, strong) AGTMoney *oneDollar;
@property (nonatomic, strong) AGTMoney *oneEuro;


@end

@implementation AGTBrokerTest

- (void)setUp {
    [super setUp];
    self.emptyBroker = [AGTBroker new];
    self.oneDollar = [AGTMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar =nil;
}


- (void)testSimpleReduction {
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5] plus:[AGTMoney dollarWithAmount:5]];
    AGTMoney *reduced = [self.emptyBroker reduce:sum toCurrency:@"USD"];
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

- (void)testReduction {
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    AGTMoney *dollar = [AGTMoney dollarWithAmount:10];
    AGTMoney *euro = [AGTMoney euroWithAmount:5];
    
    AGTMoney *converted = [self.emptyBroker reduce:dollar toCurrency:@"EUR"];
    XCTAssertEqualObjects(converted, euro, @"10usd == 5eur 1:2");
}

- (void)testThatNoRateRaisesException {
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}

- (void)testThatNilConversionDoesNotChangeMoney {
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversions should have no effect");
}


@end
