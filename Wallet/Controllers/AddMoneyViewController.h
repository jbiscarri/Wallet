//
//  AddMoneyViewController.h
//  Wallet
//
//  Created by Joan on 07/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddMoneyViewControllerDelegate <NSObject>

- (void)addMoneyViewControllerAddedAmount:(NSInteger)amount currency:(NSString *)currency;

@end

@interface AddMoneyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

@property (weak, nonatomic) id<AddMoneyViewControllerDelegate> delegate;
- (IBAction)addMoney:(id)sender;
@end
