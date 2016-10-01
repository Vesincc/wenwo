//
//  ClassifyCollectionViewCell.m
//  wenwobei
//
//  Created by HanQi on 16/9/26.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ClassifyCollectionViewCell.h"
#import "Config.h"

@interface ClassifyCollectionViewCell()

@end

@implementation ClassifyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self textLable];

    }
    return self;
}


- (UILabel *)textLable {
    
    if (!_textLable) {
        
        _textLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _textLable.text = @"香锅烤鱼";
        _textLable.textColor = HQ_RGBA(100, 100, 100, 1);
        _textLable.textAlignment = NSTextAlignmentCenter;
        _textLable.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_textLable];
        
    }
    
    return _textLable;
    
}

@end
