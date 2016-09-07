//
//  HQNavigationController.m
//  wenwobei
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "HQNavigationController.h"
#import "Config.h"

@implementation HQNavigationController 

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    CGRect frame = self.navigationBar.frame;
    frame.size.height = 45;
    self.navigationBar.frame = frame;
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:TITLE_COLER, NSFontAttributeName:[UIFont systemFontOfSize:20], }];
    
    self.navigationBar.backItem.title = @"返回";
    
    [self.navigationBar setTintColor:TITLE_COLER];
    
//    self.navigationBar.backItem
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

//    [self.navigationController.navigationBar setHidden:NO];
//    NSLog(@"%@", viewController);
    
    [super pushViewController:viewController animated:animated];
    
    if ([NSStringFromClass([viewController class]) isEqualToString:@"DetailViewController"]) {
    
        self.tabBarController.tabBar.hidden = YES;
        
    }
    
    
    
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    if ([NSStringFromClass([self.topViewController class]) isEqualToString:@"DetailViewController"]) {
    
        self.tabBarController.tabBar.hidden = NO;
        
    }

    return [super popViewControllerAnimated:animated];

}


@end
