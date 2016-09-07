//
//  DetailViewController.h
//  wenwobei
//
//  Created by HanQi on 16/8/30.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTableViewCellModel.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) SimpleTableViewCellModel *detailData;

- (instancetype)initWithData:(SimpleTableViewCellModel *)data;

@end
