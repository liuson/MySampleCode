//
//  FJFFirstViewController.m
//  FJFGlobalTimerManager
//
//  Created by fjf on 16/09/2019.
//  Copyright © 2019 fjf. All rights reserved.
//

#import "NSObject+PerformTimer.h"
#import "FJFFirstViewController.h"

@interface FJFFirstViewController ()

@end

@implementation FJFFirstViewController

#pragma mark - Life Circle

- (void)dealloc {
    NSLog(@"FJFFirstViewController dealloc");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (NSInteger index = 0; index < 10; index++) {
        CGFloat buttonVerticalSpacing = 20.0f;
        CGFloat buttonHeight = 30;
        CGFloat buttonWidth = 100;
        CGFloat buttonY = index * (buttonHeight + buttonVerticalSpacing) + 80;
        UIButton *tmpButton = [[UIButton alloc] initWithFrame:CGRectMake(120, buttonY, buttonWidth, buttonHeight)];
        [tmpButton setTitle:[NSString stringWithFormat:@"%u", (arc4random() % 50)] forState:UIControlStateNormal];
        tmpButton.backgroundColor = [UIColor redColor];
        [tmpButton addTarget:self action:@selector(tmpButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tmpButton];
    }
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Response Event

- (void)tmpButtonClicked:(UIButton *)sender {
    [sender fjf_registerWithRemainingTime:[sender.titleLabel.text integerValue] timerCallBack:^(id  _Nonnull receiver, NSInteger remainingTime, BOOL * _Nonnull isStop) {
        [sender setTitle:[NSString stringWithFormat:@"%ld", (long)remainingTime] forState:UIControlStateNormal];
    }];
}

@end
