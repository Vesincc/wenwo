//
//  MeViewController.h
//  wenwobei
//
//  Created by HanQi on 16/8/30.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTableViewCellModel.h"

@protocol MeViewControllerDelegate <NSObject>

- (void)meView:(UIView *)view KeyDidChanged:(NSString *)key forValue:(NSString *)value;

@end

@interface MeViewController : UIViewController

@property (nonatomic, strong) SimpleTableViewCellModel *data;
@property (nonatomic, weak) id <MeViewControllerDelegate> delegatee;


@end
