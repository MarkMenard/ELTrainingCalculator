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
    [self performOperation:@selector(add)];
}

- (IBAction)subtractPressed:(id)sender {
    [self performOperation:@selector(subtract)];
}

- (IBAction)multiplyPressed:(id)sender {
    [self performOperation:@selector(multiply)];
}

- (IBAction)dividePressed:(id)sender {
    [self performOperation:@selector(divide)];
}

- (void)performOperation:(SEL)selector {
    [self assureEnterPressed];
    [self displayResult:[self performBrainOperation:selector]];
}

-(double)performBrainOperation:(SEL)selector {
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self.brain class] instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:self.brain];
    [invocation invoke];
    double returnValue;
    [invocation getReturnValue:&returnValue];
    NSLog(@"Returned %f", returnValue);
    return returnValue;
}

- (void) displayResult:(double)result {
    self.display.text = [NSString stringWithFormat:@"%f", result];
}

- (void) assureEnterPressed {
    if (userEnteringArgument) {
        [self enterPressed:nil];
    }
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
