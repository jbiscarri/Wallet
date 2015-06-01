//
//  AGTDollarTest.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTDollar.h"

@interface AGTDollarTest : XCTestCase

@end

@implementation AGTDollarTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMultiplication {
    AGTDollar *five = [[AGTDollar alloc] initWithAmount:5];
    AGTDollar *product = [five times:2];
    XCTAssertEqualObjects([[AGTDollar alloc] initWithAmount:10], product);
}

@end
