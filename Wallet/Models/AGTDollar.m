//
//  AGTDollar.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTDollar.h"


@interface AGTDollar()

@property (nonatomic) NSUInteger amount;

@end




@implementation AGTDollar

- (instancetype)initWithAmount:(NSUInteger)amount
{
    self = [super init];
    if (self) {
        _amount = amount;
    }
    return self;
}

- (AGTMoney *)times:(NSUInteger)multiplier{
    AGTDollar *product = [[AGTDollar alloc] initWithAmount:_amount * multiplier];
    return product;
}

- (BOOL)isEqual:(id)object {
    return [self amount] == [object amount];
}

@end