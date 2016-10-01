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
    
    [self.navigationBar setTintColor:TITLE_COLER];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

//    [self.navigationController.navigationBar setHidden:NO];
//    NSLog(@"%@", viewController);
    

    [super pushViewController:viewController animated:animated];
    
//    if ([NSStringFromClass([viewController class]) isEqualToString:@"DetailViewController"] || [NSStringFromClass([viewController class]) isEqualToString:@"WebViewController"]) {
//    
//        [UIView animateWithDuration:0.2 animations:^{
//            self.tabBarController.tabBar.center = CGPointMake(self.tabBarController.tabBar.center.x, self.tabBarController.tabBar.center.y + self.tabBarController.tabBar.frame.size.height);
//        }];
//        
//    }
    
    
    
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
//    if ([NSStringFromClass([self.topViewController class]) isEqualToString:@"DetailViewController"]) {
//    
//        [UIView animateWithDuration:0.3 animations:^{
//            self.tabBarController.tabBar.center = CGPointMake(SCREEN_WIDTH/2, self.tabBarController.tabBar.center.y);
//        }];
//        
//    }

    return [super popViewControllerAnimated:animated];

}


@end
