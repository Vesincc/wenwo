//
//  ClassifyCollectionViewHeader.m
//  wenwobei
//
//  Created by HanQi on 2016/9/30.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ClassifyCollectionViewHeader.h"
#import "Config.h"

@implementation ClassifyCollectionViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self textLable];
//        self.backgroundColor = [UIColor redColor];
        
    }
    return self;
}

- (UILabel *)textLable {

    if (!_textLable) {
    
        _textLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _textLable.text = @"火锅";
        _textLable.textColor = HQ_RGBA(100, 100, 100, 1);
        _textLable.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_textLable];
    
    }
    
    return _textLable;

}

@end
