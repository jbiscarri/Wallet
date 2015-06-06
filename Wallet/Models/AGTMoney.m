//
//  AGTMoney.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTMoney.h"
#import "AGTBroker.h"


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

- (id)initWithAmount:(NSUInteger)amount
            currency:(NSString*)currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = [currency copy];
    }
    return self;
}

- (id<AGTMoney>)times:(NSUInteger)multiplier{
    AGTMoney *product = [[AGTMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    return product;
}

- (id<AGTMoney>)plus:(AGTMoney *)other {
    AGTMoney *total = [[AGTMoney alloc] initWithAmount:([self.amount integerValue] + [other.amount integerValue])
                                              currency:_currency];
    return total;
}

- (id<AGTMoney>)reduceToCurrency:(NSString*)currency withBroker:(AGTBroker*)broker {
    AGTMoney *result;
    double rate = [broker.rates[[broker keyFromCurrency:self.currency
                                         toCurrency:currency]] doubleValue];
    //Comprobamos que divisa de origen y destino son las mismas
    if ([self.currency isEqual:currency]){
        result = self;
    }else if (rate == 0){ //No hay tasa de conversion, !excepcion
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        NSInteger newAmount = [self.amount integerValue] * rate;
        AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount:newAmount currency:currency];
        result = newMoney;
    }
    return result;
}


#pragma mark -Overwritten
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %@%ld>", self.class, self.currency, [self.amount integerValue]];
}

- (NSUInteger)hash {
    return (NSUInteger)[self.amount integerValue];
}


- (BOOL)isEqual:(id)object {
    return [self amount] == [object amount] &&
    [self.currency isEqual:[object currency]];
}


@end
