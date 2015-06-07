//
//  AddMoneyViewController.m
//  Wallet
//
//  Created by Joan on 07/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AddMoneyViewController.h"
#import "ASDepthModalViewController.h"


@interface AddMoneyViewController ()

@end

@implementation AddMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmented.selectedSegmentIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addMoney:(id)sender {
    [self.delegate addMoneyViewControllerAddedAmount:[self.amountTextField.text integerValue] currency:self.segmented.selectedSegmentIndex==0?@"EUR":@"USD"];
    [ASDepthModalViewController dismiss];
}

@end
