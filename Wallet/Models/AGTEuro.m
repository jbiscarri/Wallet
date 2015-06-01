//
//  AGTEuro.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTEuro.h"

@interface AGTEuro()

@property (nonatomic) NSUInteger amount;

@end




@implementation AGTEuro

- (instancetype)initWithAmount:(NSUInteger)amount
{
    self = [super init];
    if (self) {
        _amount = amount;
    }
    return self;
}

- (AGTMoney *)times:(NSUInteger)multiplier{
    AGTEuro *product = [[AGTEuro alloc] initWithAmount:_amount * multiplier];
    return product;
}

- (BOOL)isEqual:(id)object {
    return [self amount] == [object amount];
}

@end
