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
@property (nonatomic, strong) NSMutableDictionary *rates;
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

- (AGTMoney*)reduce:(AGTMoney*)money toCurrency:(NSString*)currency
{
    AGTMoney *result;
    double rate = [self.rates[[self keyFromCurrency:money.currency
                                            toCurrency:currency]] doubleValue];
    //Comprobamos que divisa de origen y destino son las mismas
    if ([money.currency isEqual:currency]){
        result = money;
    }else if (rate == 0){ //No hay tasa de conversion, !excepcion
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", money.currency, currency];
    }else{
        NSInteger newAmount = [money.amount integerValue] * rate;        
        AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount:newAmount currency:currency];
        result = newMoney;
    }
    return result;
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
