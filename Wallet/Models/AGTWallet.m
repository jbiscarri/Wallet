//
//  AGTWallet.m
//  Wallet
//
//  Created by Joan on 04/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTWallet.h"
#import "AGTBroker.h"

@interface AGTWallet ()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation AGTWallet
- (id)initWithAmount:(NSUInteger)amount
                      currency:(NSString*)currency {
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray arrayWithObject:money];
    }
    return self;
}

- (id<AGTMoney>)plus:(AGTMoney *)other {
    [self.moneys addObject:other];
    return self;
}

- (id<AGTMoney>)times:(NSUInteger)multiplier {
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (id<AGTMoney>  each in self.moneys) {
        id<AGTMoney> newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}


- (id<AGTMoney>)reduceToCurrency:(NSString*)currency withBroker:(AGTBroker*)broker {
    AGTMoney *result = [[AGTMoney alloc] initWithAmount:0 currency:currency];
    for (AGTMoney *  each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    return result;
}

- (NSArray *)moneysForSection:(NSUInteger)section
{
    NSArray *currencies = [self getCurrenciesInMyWallet];
    if (section >= currencies.count) {
        return @[];
    }else {
        NSString *currency = currencies[section];
        NSArray *moneys = [self moneysForCurrency:currency];
        return moneys;
    }
}

- (NSArray *)moneysForCurrency:(NSString *)currency {
    NSMutableArray *moneys = [NSMutableArray array];
    for (AGTMoney * each in self.moneys) {
        if ([each.currency isEqualToString:currency])
            [moneys addObject:each];
    }
    return moneys;
}

- (NSArray*)getCurrenciesInMyWallet
{
    NSMutableArray *currencies = [NSMutableArray array];
    for (AGTMoney *  each in self.moneys) {
        if (![currencies containsObject:each.currency]) {
            [currencies addObject:[each.currency copy]];
        }
    }
    //Order services by date
    currencies = [[currencies sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *currency1 = obj1;
        NSString *currency2 = obj2;
        return [currency1 compare:currency2];
    }] mutableCopy];
    return currencies;
}

@end
