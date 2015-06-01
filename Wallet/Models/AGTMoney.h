//
//  AGTMoney.h
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTMoney : NSObject

- (instancetype)initWithAmount:(NSUInteger)amount;
- (AGTMoney *)times:(NSUInteger)multiplier;

@end
