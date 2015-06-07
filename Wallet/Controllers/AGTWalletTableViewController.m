//
//  AGTWalletTableViewController.m
//  Wallet
//
//  Created by Joan on 06/06/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"
#import "MoneyTableViewCell.h"
#import "AGTBroker.h"
#import "ASDepthModalViewController.h"

static NSString *const reuseIdentifier = @"MoneyTableViewCell";


@interface AGTWalletTableViewController ()
@property (nonatomic, strong) AGTWallet *wallet;
@property (nonatomic, strong) AGTBroker *broker;
@property (nonatomic, strong) AddMoneyViewController *addMoneyViewController;
@end

@implementation AGTWalletTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style wallet:(AGTWallet*)wallet {
    self = [super initWithStyle:style];
    if (self) {
        _wallet = wallet;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *currencies = [self.wallet getCurrenciesInMyWallet];
    if (currencies.count > section)
        return currencies[section];
    else
        return @"Total";
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.wallet getCurrenciesInMyWallet].count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.wallet moneysForSection:section].count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    cell.cellTotalText.hidden = YES;
    AGTMoney *money;
    NSArray *currencies = [self.wallet getCurrenciesInMyWallet];
    if (currencies.count > indexPath.section){
        NSArray *moneys = [self.wallet moneysForSection:indexPath.section];
        if (indexPath.row < moneys.count)
            money = moneys[indexPath.row];
        else{
            money = [self.wallet reduceForSection:indexPath.section withBroker:self.broker];
            cell.cellTotalText.hidden = NO;
            cell.cellTotalText.text = [NSString stringWithFormat:@"TOTAL (%@):", currencies[indexPath.section]];
        }
    }else{
        money = [self.wallet reduceToCurrency:@"EUR" withBroker:self.broker];
        cell.cellTotalText.hidden = NO;
        cell.cellTotalText.text = @"TOTAL (EUR):";
    }
    cell.cellTitleLabel.text = [NSString stringWithFormat:@"%ld", (long)[money.amount integerValue]];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *currencies = [self.wallet getCurrenciesInMyWallet];
    if (currencies.count > indexPath.section){
        NSArray *moneys = [self.wallet moneysForSection:indexPath.section];
        if (indexPath.row < moneys.count)
            return YES;
        else
            return NO;
    }else
        return NO;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        cell.cellTotalText.hidden = YES;
        AGTMoney *money;
        NSArray *currencies = [self.wallet getCurrenciesInMyWallet];
        if (currencies.count > indexPath.section){
            NSArray *moneys = [self.wallet moneysForSection:indexPath.section];
            if (indexPath.row < moneys.count)
                money = moneys[indexPath.row];
        }
        if (money != nil){
            [self.wallet takeMoney:money];
            [tableView reloadData];
        }
    }
}


#pragma mark - Lazy load
- (AGTWallet *)wallet
{
    if (_wallet == nil){
        _wallet = [[AGTWallet alloc] init];
    }
    return _wallet;
}

- (AGTBroker *)broker
{
    if (_broker == nil){
        _broker = [[AGTBroker alloc] init];
        [_broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];

    }
    return _broker;
}

#pragma mark - Actions
- (IBAction)addTouchUpInside:(id)sender {

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    self.addMoneyViewController = [storyBoard instantiateViewControllerWithIdentifier:@"AddMoneyViewController"];
    self.addMoneyViewController.view.frame = CGRectMake(0, 0, 280, 150);
    self.addMoneyViewController.view.layer.cornerRadius = 5;
    self.addMoneyViewController.view.layer.masksToBounds = YES;
    self.addMoneyViewController.delegate = self;
    [ASDepthModalViewController presentView:self.addMoneyViewController.view];
    
}

#pragma mark - AddMoneyViewControllerDelegate
- (void)addMoneyViewControllerAddedAmount:(NSInteger)amount currency:(NSString *)currency
{
    if ([currency isEqualToString:@"EUR"])
    {
        [self.wallet plus:[AGTMoney euroWithAmount:amount]];
    }
    else if ([currency isEqualToString:@"USD"])
    {
        [self.wallet plus:[AGTMoney dollarWithAmount:amount]];
    }
    [self.tableView reloadData];
}
@end
