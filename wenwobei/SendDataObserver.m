//
//  SendDataObserver.m
//  wenwobei
//
//  Created by HanQi on 16/8/17.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendDataObserver.h"
#import "SendTotalView.h"

@implementation SendDataObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    SendTotalView *totalView = (__bridge SendTotalView *)(context);
    
    NSLog(@"------ %@ 在监听------", self.name);
    NSLog(@"change: %@", change);
    NSLog(@"object: %@", object);
    
    if ([self.name isEqualToString:@"image"]) {
    
        totalView.selectImageView.icon.image = [UIImage imageNamed:totalView.selectImageView.finishImageName];
        totalView.selectImageView.line.backgroundColor = totalView.selectImageView.finishLineColor;
    
    } else if ([self.name isEqualToString:@"type"]) {
    
//        if () {
//        
//        
//        }
    
    } else if ([self.name isEqualToString:@"reason"]) {
        
    
    
    } else if ([self.name isEqualToString:@"detail"]) {
    
    
    } else if ([self.name isEqualToString:@"shopName"]) {
    
    } else if ([self.name isEqualToString:@"positionX"]) {
    
    
    } else if ([self.name isEqualToString:@"positionY"]) {
    
    
    } else if ([self.name isEqualToString:@"price"]) {
    
    }
    

}

@end
