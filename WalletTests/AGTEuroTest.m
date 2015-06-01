//
//  AGTEuroTest.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTEuro.h"

@interface AGTEuroTest : XCTestCase

@end

@implementation AGTEuroTest

- (void)setUp {
    [super setUp];
//Creo entorno

}

- (void)tearDown {
    [super tearDown];
    
    //Me cargo el entorno
}

- (void)testMultiplication {
    AGTEuro *five = [[AGTEuro alloc] initWithAmount:5];
    AGTEuro *product = [five times:2];
    XCTAssertEqualObjects([[AGTEuro alloc] initWithAmount:10], product);
}

- (void)testEquality {
    AGTEuro *five = [[AGTEuro alloc] initWithAmount:5];
    AGTEuro *otherFive = [[AGTEuro alloc] initWithAmount:5];
    XCTAssertEqualObjects(five, otherFive);
    
    AGTEuro *seven = [[AGTEuro alloc] initWithAmount:7];
    XCTAssertNotEqualObjects(five, seven);
}

@end
