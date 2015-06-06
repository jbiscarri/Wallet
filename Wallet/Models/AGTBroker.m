//
//  AGTBroker.m
//  Wallet
//
//  Created by Joan on 03/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTBroker.h"
#import "AGTMoney.h"

@interface AGTBroker ()

@end

@implementation AGTBroker

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rates = [@{} mutableCopy];
    }
    return self;
}

- (AGTMoney*)reduce:(id<AGTMoney>)money toCurrency:(NSString*)currency
{
    //double dispatch    
    return [money reduceToCurrency:currency withBroker:self];
}


- (void)addRate:(NSInteger)rate
   fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency {
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    double inverse = (double)1/rate;
    [self.rates setObject:@(inverse) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}


- (NSString *)keyFromCurrency:(NSString *)fromCurrency
                   toCurrency:(NSString *)toCurrency {
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}



@end
