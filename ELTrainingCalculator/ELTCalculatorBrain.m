//
//  ELTCalculatorBrain.m
//  ELTrainingCalculator
//
//  Created by Mark Menard on 1/11/13.
//  Copyright (c) 2013 Mark Menard. All rights reserved.
//

#import "ELTCalculatorBrain.h"

@interface ELTCalculatorBrain()

@property (strong, nonatomic) NSMutableArray *argumentStack;

@end

@implementation ELTCalculatorBrain

-(id) init {
    self = [super init];
    if (self) {
        _argumentStack = [NSMutableArray new];
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

-(NSArray *)currentArguments {
    return self.argumentStack;
}

-(void) clear {
  [self.argumentStack removeAllObjects];
}

/*
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
    double rightArgument = [self popArgument];
    double leftArgument = [self popArgument];
    double result = action(leftArgument, rightArgument);
    [self pushArgument:result];
    return result;
}
*/

- (double)performCalcWithMode:(CalcMode)calcMode
{
  double rightArgument  = [self popArgument];
  double leftArgument   = [self popArgument];
  double result;
  
  switch (calcMode) {
    case addMode:
      result = leftArgument + rightArgument;
      break;
    case subtractMode:
      result = leftArgument - rightArgument;
      break;
    case multiplyMode:
      result = leftArgument * rightArgument;
      break;
    case divideMode:
      result = leftArgument / rightArgument;
      break;
    default:
      break;
  }
  
  [self pushArgument:result];
  return result;
}

@end
