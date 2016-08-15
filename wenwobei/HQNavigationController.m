//
//  HQNavigationController.m
//  wenwobei
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "HQNavigationController.h"

@implementation HQNavigationController

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    CGRect frame = self.navigationBar.frame;
    frame.size.height = 45;
    self.navigationBar.frame = frame;
    
}

@end
