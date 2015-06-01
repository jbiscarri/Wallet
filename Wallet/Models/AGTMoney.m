//
//  AGTMoney.m
//  Wallet
//
//  Created by Joan on 01/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTMoney.h"
#import "NSObject+GNUStep.h"

@implementation AGTMoney

- (instancetype)initWithAmount:(NSUInteger)amount {
    return [self subclassResponsibility:_cmd];
}

- (AGTMoney *)times:(NSUInteger)multiplier {
    return [self subclassResponsibility:_cmd];
}

@end
