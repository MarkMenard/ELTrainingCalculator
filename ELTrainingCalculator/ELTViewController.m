//
//  ELTViewController.m
//  ELTrainingCalculator
//
//  Created by Mark Menard on 1/11/13.
//  Copyright (c) 2013 Mark Menard. All rights reserved.
//

#import "ELTViewController.h"

@interface ELTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *display;

@end

@implementation ELTViewController

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button Pressed");
    self.display.text = @"Hello World";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
