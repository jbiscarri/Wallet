//
//  AGTMoney.h
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTMoney : NSObject
@property (nonatomic, strong, readonly) NSNumber* amount;
@property (copy, readonly) NSString *currency;
+ (instancetype)dollarWithAmount:(NSUInteger)amount;
+ (instancetype)euroWithAmount:(NSUInteger)amount;


- (instancetype)initWithAmount:(NSUInteger)amount
                      currency:(NSString*)currency;
- (AGTMoney *)times:(NSUInteger)multiplier;
- (AGTMoney *)plus:(AGTMoney *)other;


@end
