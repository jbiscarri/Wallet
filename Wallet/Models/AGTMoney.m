//
//  AGTMoney.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTMoney.h"
#import "AGTMoneyPrivate.h"
#import "NSObject+GNUStep.h"

@implementation AGTMoney

- (instancetype)initWithAmount:(NSUInteger)amount
{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (AGTMoney *)times:(NSUInteger)multiplier{
    AGTMoney *product = [[AGTMoney alloc] initWithAmount:self.amount * multiplier];
    return product;
}

- (BOOL)isEqual:(id)object {
    return [self amount] == [object amount];
}

@end
