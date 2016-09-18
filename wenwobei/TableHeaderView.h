//
//  TableHeaderView.h
//  wenwobei
//
//  Created by HanQi on 16/9/19.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableHeaderView;
@protocol TableHeaderViewDelegate <NSObject>

- (void)tableHeaderView:(TableHeaderView *)view didClick:(UIView *)clickView atIndex:(NSInteger)index;

@end


@interface TableHeaderView : UIView

@property (nonatomic, weak) id <TableHeaderViewDelegate> delegate;

@end
