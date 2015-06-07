//
//  AGTWalletTableViewController.h
//  Wallet
//
//  Created by Joan on 06/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMoneyViewController.h"

@class AGTWallet;

@interface AGTWalletTableViewController : UITableViewController<AddMoneyViewControllerDelegate>
- (instancetype)initWithStyle:(UITableViewStyle)style wallet:(AGTWallet*)wallet;
- (IBAction)addTouchUpInside:(id)sender;
@end
