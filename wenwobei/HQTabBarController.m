//
//  HQTabBarController.m
//  TableBar
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "HQTabBarController.h"
#import "HQTabBar.h"
#import "DiscoverViewController.h"
#import "LikeViewController.h"
#import "HQNavigationController.h"
#import "Config.h"
#import "SendViewController.h"

@interface HQTabBarController () <HQTabBarDelegate, UINavigationControllerDelegate>

@end

@implementation HQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self addSubviewController:[[DiscoverViewController alloc] init] title:@"发现" image:@"discover" selectedImage:@"discover_selected"];
    
    [self addSubviewController:[[LikeViewController alloc] init] title:@"想吃" image:@"like" selectedImage:@"like_selected"];

    
    [self addSubviewController:[[UIViewController alloc] init] title:@"" image:nil selectedImage:nil];
    
    
    
    
    
    HQTabBar *tabBar = [[HQTabBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 100) tabBarSize:3];
    tabBar.delegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)viewDidLayoutSubviews {

    [super viewDidLayoutSubviews];
    
    CGRect frame = self.tabBar.frame;
    frame.size.height = 54;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    self.tabBar.frame = frame;
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
//    self.tabBar.barStyle = UIBarStyleBlack;
    

}

- (void)addSubviewController:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    childViewController.title = title;
    
    if (image != nil || selectedImage != nil) {
        
        childViewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : HQ_RGBA(255, 118, 2, 1)} forState:UIControlStateNormal];
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : HQ_RGBA(255, 118, 2, 1)} forState:UIControlStateSelected];
    
    HQNavigationController *navigationVc = [[HQNavigationController alloc] initWithRootViewController:childViewController];
    navigationVc.delegate = self;
    [self addChildViewController:navigationVc];
    
//    [self addChildViewController:childViewController];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    
    
}

//static int initFlag = 0;

//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    
//    if (initFlag < 3) {
//    
//        initFlag ++;
//        return;
//        
//    }
//    
//    if ([NSStringFromClass([viewController class]) isEqualToString:@"DiscoverViewController"]) {
//        
//        if (self.tabBar.center.y != SCREEN_HEIGHT - self.tabBar.frame.size.height/2 ) {
//        
//            [UIView animateWithDuration:0.2 animations:^{
//                
//                self.tabBar.center = CGPointMake(self.tabBar.center.x, self.tabBar.center.y - self.tabBar.frame.size.height);
//            }];
//        
//        }
//        
//    }
//    
//}

- (void)hQTabBar:(HQTabBar *)tabBar btnDidClick:(UIButton *)button {
    
    NSLog(@"click");
    
    SendViewController *sendVC = [[SendViewController alloc] init];
    [self presentViewController:sendVC animated:YES completion:^{
        
    }];
    
}
@end
