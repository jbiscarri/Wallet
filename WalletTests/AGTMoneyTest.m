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

@end
