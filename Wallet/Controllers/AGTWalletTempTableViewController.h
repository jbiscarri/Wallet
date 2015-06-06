//
//  AGTWalletTableViewController.h
//  Wallet
//
//  Created by Joan on 04/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTWallet;

@interface AGTWalletTempTableViewController : UITableViewController
- (id)initWithModel:(AGTWallet *)wallet;
@end
