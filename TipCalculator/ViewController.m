//
//  ViewController.m
//  TipCalculator
//
//  Created by Gabriel Santos on 1/15/15.
//  Copyright (c) 2015 Team Nebula. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentSegmentedControl;

- (IBAction)tipPercentChanged:(id)sender;
- (IBAction)billAmountChanged:(id)sender;
- (IBAction)billEditingChanged:(id)sender;
- (void)updateFields;
- (NSString*)formatNumber:(float)amount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long intValue = [defaults integerForKey:@"settings_default_tip_index"];
    self.tipPercentSegmentedControl.selectedSegmentIndex = intValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentChanged:(id)sender
{
    [self updateFields];
}

- (IBAction)billAmountChanged:(id)sender
{
    [self updateFields];
}

- (IBAction)billEditingChanged:(id)sender
{
    [self updateFields];
}

- (void)updateFields
{
    float tipAmount;
    if (self.tipPercentSegmentedControl.selectedSegmentIndex == 0)
    {
        tipAmount = 0.1;
    }
    else if (self.tipPercentSegmentedControl.selectedSegmentIndex == 1)
    {
        tipAmount = 0.15;
    }
    else if (self.tipPercentSegmentedControl.selectedSegmentIndex == 2)
    {
        tipAmount = 0.2;
    }
    else // Johnny Depp
    {
        tipAmount = 1;
    }
    
    float billAmount = self.billField.text.doubleValue;
    tipAmount *= billAmount;
    
    self.tipAmountLabel.text = [self formatNumber:tipAmount];
    self.totalAmountLabel.text = [self formatNumber:tipAmount + billAmount];
}

- (NSString *)formatNumber:(float)amount
{
    return [NSString stringWithFormat:@"$%0.2f", amount];
}
@end
