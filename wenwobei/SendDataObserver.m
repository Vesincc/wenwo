//
//  SendDataObserver.m
//  wenwobei
//
//  Created by HanQi on 16/8/17.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SendDataObserver.h"
#import "SendTotalView.h"
#import "SimpleTableViewCellModel.h"

@implementation SendDataObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if (change[@"new"] == change[@"old"]) {
        
        return;
        
    }

    
    SendTotalView *totalView = (__bridge SendTotalView *)(context);
    
    NSLog(@"------ %@ 在监听------", self.name);
    NSLog(@"change: %@", change);
    
    if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SendViewController"]) {
    
        if ([self.name isEqualToString:@"image"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SendViewController"]) {
                
                if ([[NSString stringWithFormat:@"%@", change[@"old"]] isEqualToString:@"<null>"]) {
                    
                    totalView.selectImageView.icon.image = [UIImage imageNamed:totalView.selectImageView.finishImageName];
                    totalView.selectImageView.line.backgroundColor = totalView.selectImageView.finishLineColor;
                    
                }
                
            }
            
            
        }
        
    
    } else {
        
        if ([self.name isEqualToString:@"type"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SimpleTableViewCellModel"]) {
                
                SimpleTableViewCellModel *data = object;
                
                if ([data.askTag isEqualToString:@""]) {
                    
                    if (![change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectTypeView.icon.image = [UIImage imageNamed:totalView.selectTypeView.defaultImageName];
                        totalView.selectTypeView.line.backgroundColor = totalView.selectTypeView.defaultLineColor;
                        
                    }
                    
                } else {
                    
                    if ([change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectTypeView.icon.image = [UIImage imageNamed:totalView.selectTypeView.finishImageName];
                        totalView.selectTypeView.line.backgroundColor = totalView.selectTypeView.finishLineColor;
                        
                    }
                    
                }
                
                
                @try {
                    
                    UILabel *lable = totalView.selectTypeView.mainView.subviews[1];
                    
                    lable.text = data.askTag;
                    
                    if ([lable.text isEqualToString:@""]) {
                    
                        lable.text = @"请填写类别";
                    
                    }
                    
                } @catch (NSException *exception) {
                    
                }
                
                
                
            }
            
        } else if ([self.name isEqualToString:@"reason"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SimpleTableViewCellModel"]) {
                
                SimpleTableViewCellModel *data = object;
                
                if ([data.askReason isEqualToString:@""]) {
                    
                    if (![change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectReasonView.icon.image = [UIImage imageNamed:totalView.selectReasonView.defaultImageName];
                        totalView.selectReasonView.line.backgroundColor = totalView.selectReasonView.defaultLineColor;
                        
                    }
                    
                } else {
                    
                    if ([change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectReasonView.icon.image = [UIImage imageNamed:totalView.selectReasonView.finishImageName];
                        totalView.selectReasonView.line.backgroundColor = totalView.selectReasonView.finishLineColor;
                        
                    }
                    
                }
                
                
                @try {
                    
                    UILabel *lable = totalView.selectReasonView.mainView.subviews[1];
                    
                    lable.text = data.askReason;
                    
                } @catch (NSException *exception) {
                    
                }
                
                
                
            }
            
            
        } else if ([self.name isEqualToString:@"detail"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SimpleTableViewCellModel"]) {
                
                SimpleTableViewCellModel *data = object;
                
                if ([data.askContentShowDetail isEqualToString:@""]) {
                    
                    if (![change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectDetailView.icon.image = [UIImage imageNamed:totalView.selectDetailView.defaultImageName];
                        totalView.selectDetailView.line.backgroundColor = totalView.selectDetailView.defaultLineColor;
                        
                    }
                    
                } else {
                    
                    if ([change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectDetailView.icon.image = [UIImage imageNamed:totalView.selectDetailView.finishImageName];
                        totalView.selectDetailView.line.backgroundColor = totalView.selectDetailView.finishLineColor;
                        
                    }
                    
                }
                
                
                @try {
                    
                    UILabel *lable = totalView.selectDetailView.mainView.subviews[1];
                    
                    lable.text = data.askContentShowDetail;
                    
                } @catch (NSException *exception) {
                    
                }
                
                
                
            }
            
           
            
            
        } else if ([self.name isEqualToString:@"shopName"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SimpleTableViewCellModel"]) {
                
                SimpleTableViewCellModel *data = object;
                
                if ([data.shopName isEqualToString:@""]) {
                    
                    if (![change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectShopNameView.icon.image = [UIImage imageNamed:totalView.selectShopNameView.defaultImageName];
                        totalView.selectShopNameView.line.backgroundColor = totalView.selectShopNameView.defaultLineColor;
                        
                    }
                    
                } else {
                    
                    if ([change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectShopNameView.icon.image = [UIImage imageNamed:totalView.selectShopNameView.finishImageName];
                        totalView.selectShopNameView.line.backgroundColor = totalView.selectShopNameView.finishLineColor;
                        
                    }
                    
                }
                
                
                @try {
                    
                    UILabel *lable = totalView.selectShopNameView.mainView.subviews[1];
                    
                    lable.text = data.shopName;
                    
                } @catch (NSException *exception) {
                    
                }
                
            }
            
        } else if ([self.name isEqualToString:@"positionX"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SimpleTableViewCellModel"]) {
                
                SimpleTableViewCellModel *data = object;
                
                if ([data.GeoX isEqualToString:@""]) {
                    
                    if (![change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectPositionView.icon.image = [UIImage imageNamed:totalView.selectPositionView.defaultImageName];
                        totalView.selectPositionView.line.backgroundColor = totalView.selectPositionView.defaultLineColor;
                        
                    }
                    
                } else {
                    
                    if ([change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectPositionView.icon.image = [UIImage imageNamed:totalView.selectPositionView.finishImageName];
                        totalView.selectPositionView.line.backgroundColor = totalView.selectPositionView.finishLineColor;
                        
                    }
                    
                }
                
            }
            
        } else if ([self.name isEqualToString:@"positionY"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SimpleTableViewCellModel"]) {
                
                SimpleTableViewCellModel *data = object;
                
                if ([data.GeoY isEqualToString:@""]) {
                    
                    if (![change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectPositionView.icon.image = [UIImage imageNamed:totalView.selectPositionView.defaultImageName];
                        totalView.selectPositionView.line.backgroundColor = totalView.selectPositionView.defaultLineColor;
                        
                    }
                    
                } else {
                    
                    if ([change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectPositionView.icon.image = [UIImage imageNamed:totalView.selectPositionView.finishImageName];
                        totalView.selectPositionView.line.backgroundColor = totalView.selectPositionView.finishLineColor;
                        
                    }
                    
                }
                
            }
            
        } else if ([self.name isEqualToString:@"price"]) {
            
            if ([[NSString stringWithFormat:@"%@", [object class]] isEqualToString:@"SimpleTableViewCellModel"]) {
                
                SimpleTableViewCellModel *data = object;
                
                if ([data.askPrice isEqualToString:@""]) {
                    
                    if (![change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectPriceView.icon.image = [UIImage imageNamed:totalView.selectPriceView.defaultImageName];
                        totalView.selectPriceView.line.backgroundColor = totalView.selectPriceView.defaultLineColor;
                        
                    }
                    
                } else {
                    
                    if ([change[@"old"] isEqualToString:@""]) {
                        
                        totalView.selectPriceView.icon.image = [UIImage imageNamed:totalView.selectPriceView.finishImageName];
                        //                    totalView.selectPriceView.line.backgroundColor = totalView.selectPriceView.finishLineColor;
                        
                    }
                    
                }
                
                
//                NSLog(@"%@", totalView.selectTypeView.mainView.subviews);
                @try {
                    
                    UILabel *lable = totalView.selectPriceView.mainView.subviews[1];
                    
                    lable.text = [NSString stringWithFormat:@"%@ 元", data.askPrice];
                    
                } @catch (NSException *exception) {
                    
                }
                
            }
            
        }
            

    }
    
}

@end
