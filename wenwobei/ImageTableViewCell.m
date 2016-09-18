//
//  ImageTableViewCell.m
//  wenwobei
//
//  Created by HanQi on 16/9/19.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ImageTableViewCell.h"
#import "Config.h"
#import "SimpleTableViewCellModel.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ImageTableViewCell()

@property (nonatomic, strong) UIView *wrap;
@property (nonatomic, strong) UILabel *reasonLable;
@property (nonatomic, strong) UIView *tagView;
@property (nonatomic, strong) UIView *tagLableWrap;
@property (nonatomic, strong) UILabel *likeNumLable;
@property (nonatomic, strong) UIView *likeView;
@property (nonatomic, strong) UIImageView *likeIcon;
@property (nonatomic, strong) NSString *reusedID;

@property (nonatomic, strong) UIView *infoViewWrap;

@property (nonatomic, strong) SimpleTableViewCellModel *model;

@end

@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier cellData:(SimpleTableViewCellModel *)cellData {
    
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cellData.askImage.count == 0) {
    
        cell.wrap.frame = CGRectMake(0, 5, SCREEN_WIDTH, 120 - 5);
        
    } else {
    
        cell.wrap.frame = CGRectMake(0, 5, SCREEN_WIDTH, 320 - 5);
        
    }
    
    
    if (cell == nil) {
        
        cell = [[ImageTableViewCell alloc] initWithReusedID:identifier cellData:cellData];
        
    }
    
    return cell;
    
    
}


- (instancetype)initWithReusedID:(NSString *)ID cellData:(SimpleTableViewCellModel *)cellData
{
    self = [super init];
    if (self) {
        
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.reusedID = ID;
        self.model = cellData;
        
        self.backgroundColor = [UIColor clearColor];
        if (self.reusedID == nil || [self.reusedID isEqualToString: @""]) {
            
            self.reusedID = @"cell";
            
        }
        
        
        self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reusedID];
        
        if (self) {
            
            [self wrap];
            
            [self photoImageView];
            
            [self infoViewWrap];
            
        }
        
        return self;
        
    }
    return self;
}

- (UIView *)infoViewWrap {

    if (!_infoViewWrap) {
    
        _infoViewWrap = [[UIView alloc] initWithFrame:CGRectMake(0, self.photoImageView.frame.size.height, SCREEN_WIDTH, 320 - 8 - 200)];
        
        [self userHeadImageView];
        
        [self reasonLable];
        
        [self tagView];
        
        [self likeView];
        
        [self.wrap addSubview:_infoViewWrap];
    
    }
    
    return _infoViewWrap;

}

- (UIView *)likeView {

    if (!_likeView) {
    
        _likeView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 80, 18+48+8 - 5, 80, 35)];
//        _likeView.backgroundColor = [UIColor yellowColor];
        
        [self likeIcon];
        
        [self likeNumLable];
        
        [self.infoViewWrap addSubview:_likeView];
        
        
    }
    
    return _likeView;

}

- (UILabel *)likeNumLable {
    if (!_likeNumLable) {
    
        _likeNumLable = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 80 - 40, 35)];
        _likeNumLable.font = [UIFont systemFontOfSize:18];
        _likeNumLable.text = self.model.likeNum;
        _likeNumLable.textColor = TITLE_COLER;
        
        
        [self.likeView addSubview:_likeNumLable];
    
    }
    
    return _likeNumLable;

}

- (UIImageView *)likeIcon {

    if (!_likeIcon) {
    
        _likeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
        if (self.model.liked == 1) {
        
            _likeIcon.image = [UIImage imageNamed:@"like_selected"];
            
        } else {
        
            _likeIcon.image = [UIImage imageNamed:@"like"];
            
        }
        
        [self.likeView addSubview:_likeIcon];
    
    }
    
    return _likeIcon;
    
}

- (UIView *)tagView {

    if (!_tagView) {
    
        _tagView = [[UIView alloc] initWithFrame:CGRectMake(15, 18+48+8, SCREEN_WIDTH - 15 - 80, 30)];
//        _tagView.backgroundColor = [UIColor yellowColor];
        _tagView.layer.masksToBounds = YES;
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 25, 25)];
        image.image = [UIImage imageNamed:@"tag-3"];
        [_tagView addSubview:image];
        
        [self tagLableWrap];
        
        [self.infoViewWrap addSubview:_tagView];
        
    }
    
    return _tagView;


}

- (UIView *)tagLableWrap {

    if (!_tagLableWrap) {
    
        _tagLableWrap = [[UIView alloc] initWithFrame:CGRectMake(30, 0, self.tagView.frame.size.width - 30, 30)];
        
//        self.model.askTag = [[NSArray alloc] initWithObjects:@"面食", @"美食一个", @"有什么", nil];
        
        for (int i = 0; i < self.model.askTag.count; i++) {
        
            UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            lable.text = self.model.askTag[i];
            
            lable.numberOfLines = 0;
            NSString *str = self.model.askTag[i];
            UIFont *font = [UIFont systemFontOfSize:15];
            lable.font = font;
            lable.textAlignment = NSTextAlignmentCenter;
            lable.textColor = HQ_RGBA(130, 130, 130, 1);
            lable.layer.cornerRadius = 5;
            lable.layer.borderColor = HQ_RGBA(130, 130, 130, 1).CGColor;
            lable.layer.borderWidth = 0.5;
            CGSize size = CGSizeMake(320,2000);
            CGSize labelsize = [str sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
            lable.tag = i + 1;
            if (i == 0) {
            
                [lable setFrame:CGRectMake(0, 3, labelsize.width + 15, 25)];
                
            } else {
            
                [lable setFrame:CGRectMake([_tagLableWrap viewWithTag:i].frame.origin.x + [_tagLableWrap viewWithTag:i].frame.size.width + 10, 3, labelsize.width + 15, 25)];
                
            }
            
            [_tagLableWrap addSubview:lable];
            
        }
        
        [self.tagView addSubview:_tagLableWrap];
        
    }
    
    return _tagLableWrap;

}

- (UILabel *)reasonLable {

    if (!_reasonLable) {
    
        _reasonLable = [[UILabel alloc] initWithFrame:CGRectMake(20 + 48 + 20, 15, SCREEN_WIDTH - 20 - 20 - 48 - 20, 50)];
        _reasonLable.text = self.model.askReason;
        _reasonLable.numberOfLines = 0;
        _reasonLable.font = [UIFont systemFontOfSize:17 weight:0.4];
        
        
        [self.infoViewWrap addSubview:_reasonLable];
    
    }
    
    return _reasonLable;

}

- (UIImageView *)userHeadImageView {

    if (!_userHeadImageView) {
    
        _userHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 18, 48, 48)];
        [_userHeadImageView sd_setImageWithURL:[NSURL URLWithString:self.model.createByUrl] placeholderImage:[UIImage imageNamed:@"default_userhead"]];
        _userHeadImageView.layer.borderWidth = 0.5;
        _userHeadImageView.layer.borderColor = HQ_RGBA(150, 150, 150, 1).CGColor;
        _userHeadImageView.layer.cornerRadius = 24;
        _userHeadImageView.layer.masksToBounds = YES;
        
        [self.infoViewWrap addSubview:_userHeadImageView];
    }
    
    return _userHeadImageView;

}

- (UIImageView *)photoImageView {

    if (!_photoImageView) {
    
        _photoImageView = [[UIImageView alloc] init];
        _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _photoImageView.layer.masksToBounds = YES;
        if (self.model.askImage.count == 0) {
        
            _photoImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
        
        } else {
        
            _photoImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
            NSLog(@"%@", self.model.askImage[0]);
            [_photoImageView sd_setImageWithURL:[NSURL URLWithString:self.model.askImage[0]] placeholderImage:[UIImage imageNamed:@"defaule_userhead"]];
            
            
            
        }
        
        [self.wrap addSubview:_photoImageView];
    
    }
    
    return _photoImageView;

}

-(UIView *)wrap {
    
    if (!_wrap) {
        
        if (self.model.askImage.count == 0) {
        
            _wrap = [[UIView alloc] initWithFrame:CGRectMake(0, 8, SCREEN_WIDTH, 120 - 8)];
            
        } else {
            
            _wrap = [[UIView alloc] initWithFrame:CGRectMake(0, 8, SCREEN_WIDTH, 320 - 8)];
            
        }
        
        _wrap.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_wrap];
        
    }
    return _wrap;
    
}

- (void)setCellData:(SimpleTableViewCellModel *)cellData {

    if (cellData.askImage.count == 0) {
        self.wrap.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120 - 8);
        self.photoImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
        self.infoViewWrap.frame = CGRectMake(0, self.photoImageView.frame.size.height, self.infoViewWrap.frame.size.width, self.infoViewWrap.frame.size.height);
        
    } else {
        self.wrap.frame = CGRectMake(0, 0, SCREEN_WIDTH, 320 - 8);
        self.photoImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
//        NSLog(@"%@", self.model.askImage[0]);
        [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:cellData.askImage[0]] placeholderImage:[UIImage imageNamed:@"defaule_userhead"]];
        self.infoViewWrap.frame = CGRectMake(0, self.photoImageView.frame.size.height, self.infoViewWrap.frame.size.width, self.infoViewWrap.frame.size.height);
    }
    
    [self.userHeadImageView sd_setImageWithURL:[NSURL URLWithString:cellData.createByUrl] placeholderImage:[UIImage imageNamed:@"defaule_userhead"]];
    
    self.reasonLable.text = cellData.askReason;
    
    [self.tagLableWrap.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < cellData.askTag.count; i++) {
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        lable.text = cellData.askTag[i];
        
        lable.numberOfLines = 0;
        NSString *str = cellData.askTag[i];
        UIFont *font = [UIFont systemFontOfSize:15];
        lable.font = font;
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = HQ_RGBA(130, 130, 130, 1);
        lable.layer.cornerRadius = 5;
        lable.layer.borderColor = HQ_RGBA(130, 130, 130, 1).CGColor;
        lable.layer.borderWidth = 0.5;
        CGSize size = CGSizeMake(320,2000);
        CGSize labelsize = [str sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        lable.tag = i + 1;
        if (i == 0) {
            
            [lable setFrame:CGRectMake(0, 3, labelsize.width + 15, 25)];
            
        } else {
            
            [lable setFrame:CGRectMake([_tagLableWrap viewWithTag:i].frame.origin.x + [_tagLableWrap viewWithTag:i].frame.size.width + 10, 3, labelsize.width + 15, 25)];
            
        }
        
        [_tagLableWrap addSubview:lable];
        
    }
    
    if (cellData.liked == 1) {
        
        _likeIcon.image = [UIImage imageNamed:@"like_selected"];
        
    } else {
        
        _likeIcon.image = [UIImage imageNamed:@"like"];
        
    }
    
    self.likeNumLable.text = cellData.likeNum;

}


@end
