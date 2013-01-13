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

- (IBAction)sevenPressed:(id)sender {
    [self appendInputToDisplay:@"7"];
    NSLog(@"Seven button pressed.");
}

-(void) appendInputToDisplay:(NSString *)input {
    if (userEnteringArgument) {
        self.display.text = [self.display.text stringByAppendingString:input];
    } else {
        userEnteringArgument = YES;
        self.display.text = input;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
