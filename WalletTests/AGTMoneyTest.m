//
//  AGTMoneyTest.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "AGTMoney.h"

@interface AGTMoneyTest : XCTestCase

@end

@implementation AGTMoneyTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitRaisesException {
    XCTAssertNoThrow([AGTMoney dollarWithAmount:3]);
    XCTAssertNoThrow([AGTMoney euroWithAmount:3]);

}

- (void)testCurrency {
    AGTMoney *dollars = [AGTMoney dollarWithAmount:1];
    XCTAssertEqualObjects(@"USD", [dollars currency]);
    
    AGTMoney *euros = [AGTMoney euroWithAmount:1];
    XCTAssertEqualObjects(@"EUR", [euros currency]);
}


- (void)testMultiplication {
    //EUR
    AGTMoney *five = [AGTMoney euroWithAmount:5];
    AGTMoney *product = [five times:2];
    XCTAssertEqualObjects([AGTMoney euroWithAmount:10], product);
    
    //USD
    AGTMoney *fiveUSD = [AGTMoney dollarWithAmount:5];
    AGTMoney *productUSD = [fiveUSD times:2];
    XCTAssertEqualObjects([AGTMoney dollarWithAmount:10], productUSD);
}

- (void)testEquality {
    //EUR
    AGTMoney *five = [AGTMoney euroWithAmount:5];
    AGTMoney *otherFive = [AGTMoney euroWithAmount:5];
    XCTAssertEqualObjects(five, otherFive);
    AGTMoney *seven = [AGTMoney euroWithAmount:7];
    XCTAssertNotEqualObjects(five, seven);
    
    //USD
    AGTMoney *fiveUSD = [AGTMoney euroWithAmount:5];
    AGTMoney *otherFiveUSD = [AGTMoney euroWithAmount:5];
    XCTAssertEqualObjects(fiveUSD, otherFiveUSD);
    AGTMoney *sevenUSD = [AGTMoney euroWithAmount:7];
    XCTAssertNotEqualObjects(fiveUSD, sevenUSD);
}

- (void)testDifferentCurrencies {
    AGTMoney *euro = [AGTMoney euroWithAmount:1];
    AGTMoney *dollar = [AGTMoney dollarWithAmount:1];
    XCTAssertNotEqualObjects(euro, dollar);

}

- (void)testHash {
    //EURO
    AGTMoney *five = [AGTMoney euroWithAmount:5];
    AGTMoney *otherFive = [AGTMoney euroWithAmount:5];
    XCTAssertEqual([five hash], [otherFive hash]);
    AGTMoney *ten = [AGTMoney euroWithAmount:10];
    XCTAssertNotEqual([five hash], [ten hash]);
    //USD
    AGTMoney *fiveUSD = [AGTMoney dollarWithAmount:5];
    AGTMoney *otherFiveUSD = [AGTMoney dollarWithAmount:5];
    XCTAssertEqual([fiveUSD hash], [otherFiveUSD hash]);
    AGTMoney *tenUSD = [AGTMoney dollarWithAmount:10];
    XCTAssertNotEqual([fiveUSD hash], [tenUSD hash]);
}

- (void)testHashIsAmount {
    AGTMoney *one = [AGTMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1);
}

- (void)testDescription {
    AGTMoney *one = [AGTMoney dollarWithAmount:1];
    NSString *desc = @"<AGTMoney USD1>";
    XCTAssertEqualObjects(desc, [one description]);
    
}

- (void)testAmountStorage {
    AGTMoney *euro = [AGTMoney euroWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clag diagnostic pop
}

- (void)testSimpleAddition {
    XCTAssertEqualObjects([[AGTMoney dollarWithAmount:5] plus:
                              [AGTMoney dollarWithAmount:5]],
                              [AGTMoney dollarWithAmount:10]);

}



@end
