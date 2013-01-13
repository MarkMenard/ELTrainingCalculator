//
//  ELTCalculatorBrain.m
//  ELTrainingCalculator
//
//  Created by Mark Menard on 1/11/13.
//  Copyright (c) 2013 Mark Menard. All rights reserved.
//

#import "ELTCalculatorBrain.h"

@implementation ELTCalculatorBrain

-(id) init {
    self = [super init];
    if (self) {
        self.argumentStack = [NSMutableArray new];
    }
    return self;
}

-(void) pushArgument:(double)argument {
    [self.argumentStack addObject:@(argument)];
}

-(double) popArgument {
    NSNumber *argument = [self.argumentStack lastObject];
    if (argument) {
        [self.argumentStack removeLastObject];
    }
    return [argument doubleValue];
}

-(double) add {
    return [self doAction:^double(double argument1, double argument2) {
        return argument1 + argument2;
    }];
}

-(double) subtract {
    return [self doAction:^double(double argument1, double argument2) {
        return argument1 - argument2;
    }];
}

-(double) multiply {
    return [self doAction:^double(double argument1, double argument2) {
        return argument1 * argument2;
    }];
}

-(double) divide {
    return [self doAction:^double(double argument1, double argument2) {
        return argument1 / argument2;
    }];
}

-(double) doAction:(double (^) (double, double))action {
    long rightArgument = [self popArgument];
    long leftArgument = [self popArgument];
    double result = action(leftArgument, rightArgument);
    [self pushArgument:result];
    return result;
}


@end
