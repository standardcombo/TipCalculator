//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Gabriel Santos on 1/15/15.
//  Copyright (c) 2015 Team Nebula. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentSegmentedControl;

- (IBAction)tipPercentChanged:(id)sender;

@end

@implementation SettingsViewController

- (void) viewWillAppear:(BOOL)animated
{
    // Load
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long intValue = [defaults integerForKey:@"settings_default_tip_index"];
    self.tipPercentSegmentedControl.selectedSegmentIndex = intValue;
}

- (IBAction)tipPercentChanged:(id)sender
{
    // Save
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipPercentSegmentedControl.selectedSegmentIndex forKey:@"settings_default_tip_index"];
    [defaults synchronize];
}

@end