//
//  ImageObserver.m
//  wenwobei
//
//  Created by HanQi on 16/8/16.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ImageObserver.h"
#import "SendTotalView.h"
#import "Config.h"

@implementation ImageObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {

    SendTotalView *totalView = (__bridge SendTotalView *)(context);
    
//    UIImage *image = object;
    
    
    NSLog(@"------ %@ 在监听 ------", self.name);
    NSLog(@"change: %@", change);
//    NSLog(@"%@", image);
    
    
    totalView.imageView.image = totalView.image;
    
    totalView.imageView.frame = CGRectMake(10, 40, SCREEN_WIDTH - 80 - 40, (SCREEN_WIDTH - 80 - 40) * totalView.imageView.image.size.height / totalView.imageView.image.size.width);
    CGFloat height = 40;
    
    
    
    height += totalView.imageView.frame.size.height;
    CGRect mainViewFrame = totalView.selectImageView.mainView.frame;
    mainViewFrame.size.height = height;
    totalView.selectImageView.mainView.frame = mainViewFrame;
    
    CGRect imageBlockFrame = totalView.selectImageView.frame;
    imageBlockFrame.size.height = height;
    totalView.selectImageView.frame = imageBlockFrame;

}

@end
