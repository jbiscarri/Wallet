//
//  AGTWallet.h
//  Wallet
//
//  Created by Joan on 04/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTWallet : NSObject <AGTMoney>
@property (nonatomic, readonly) NSUInteger count;

- (NSArray *)moneysForSection:(NSUInteger)section;
- (NSArray*)getCurrenciesInMyWallet;
- (id<AGTMoney>)reduceForSection:(NSUInteger)section withBroker:(AGTBroker*)broker;
- (void)takeMoney:(AGTMoney *)other;
- (id<AGTMoney>)addMoney:(AGTMoney *)other;



@end
