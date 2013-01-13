//
//  ELTViewController.m
//  ELTrainingCalculator
//
//  Created by Mark Menard on 1/11/13.
//  Copyright (c) 2013 Mark Menard. All rights reserved.
//

#import "ELTViewController.h"
#import "ELTCalculatorBrain.h"

@interface ELTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) ELTCalculatorBrain *brain;

@end

@implementation ELTViewController

- (IBAction)numberButtonPressed:(id)sender {
    [self appendInputToDisplay:[sender titleLabel].text];
}

-(void) appendInputToDisplay:(NSString *)input {
    if (userEnteringArgument) {
        self.display.text = [self.display.text stringByAppendingString:input];
    } else {
        userEnteringArgument = YES;
        self.display.text = input;
    }
}

- (IBAction)addPressed:(id)sender {
    [self displayResult:[self.brain add]];
}

- (IBAction)subtractPressed:(id)sender {
    [self displayResult:[self.brain subtract]];
}

- (IBAction)multiplyPressed:(id)sender {
    [self displayResult:[self.brain multiply]];
}

- (IBAction)dividePressed:(id)sender {
    [self displayResult:[self.brain divide]];
}

- (void) displayResult:(double)result {
    self.display.text = [NSString stringWithFormat:@"%f", result];
}

- (IBAction)enterPressed:(id)sender {
    NSLog(@"enter pressed pushing %@ onto the argument stack.", self.display.text);
    [self.brain pushArgument:[self.display.text doubleValue]];
    userEnteringArgument = NO;
    self.display.text = @"0";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.brain = [[ELTCalculatorBrain alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
