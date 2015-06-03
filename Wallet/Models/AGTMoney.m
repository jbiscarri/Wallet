//
//  AGTMoney.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTMoney.h"


@interface AGTMoney()
@property (nonatomic, strong) NSNumber* amount;
@end

@implementation AGTMoney

+ (instancetype)dollarWithAmount:(NSUInteger)amount {
    AGTMoney *dollar = [[AGTMoney alloc] initWithAmount:amount currency:@"USD"];
    return dollar;
}

+ (instancetype)euroWithAmount:(NSUInteger)amount {
    AGTMoney *euro = [[AGTMoney alloc] initWithAmount:amount currency:@"EUR"];
    return euro;
}

- (instancetype)initWithAmount:(NSUInteger)amount
                      currency:(NSString*)currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = [currency copy];
    }
    return self;
}

- (AGTMoney *)times:(NSUInteger)multiplier{
    AGTMoney *product = [[AGTMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    return product;
}

- (BOOL)isEqual:(id)object {
    return [self amount] == [object amount] &&
    [self.currency isEqual:[object currency]];
}

- (AGTMoney *)plus:(AGTMoney *)other {
    AGTMoney *total = [[AGTMoney alloc] initWithAmount:([self.amount integerValue] + [other.amount integerValue])
                                              currency:_currency];
    return total;
}


#pragma mark -Overwritter
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %@%ld>", self.class, self.currency, [self.amount integerValue]];
}

- (NSUInteger)hash {
    return (NSUInteger)[self.amount integerValue];
}

@end
