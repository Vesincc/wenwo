//
//  MeView.m
//  wenwobei
//
//  Created by HanQi on 16/8/30.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "MeView.h"
#import "Config.h"
#import "UserInfo.h"

@interface MeView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *wrap;

@property (nonatomic, strong) UIView *infoView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UserInfo *userinfo;


@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) UIImageView *userHeadImageView;
@property (nonatomic, strong) UILabel *userNameLable;
@property (nonatomic, strong) UILabel *likeNumLable;
@property (nonatomic, strong) UILabel *totalIncomeLable;

@property (nonatomic, strong) NSArray *action;
@property (nonatomic, strong) NSArray *notice;

@end

@implementation MeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor clearColor];
        
        self.userinfo = [UserInfo shareUserInfo];
        
        self.action = [NSArray arrayWithObjects:@"朕查阅的", @"朕分享的", nil];
        self.notice = [NSArray arrayWithObjects:@"推荐爱卿使用", @"给小问子提意见", nil];
        
        
        [self wrap];
        
    }
    return self;
}

- (UIView *)wrap {

    if(!_wrap) {
    
        _wrap = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 70, SCREEN_HEIGHT)];
        _wrap.backgroundColor = HQ_RGBA(248, 248, 248, 1);
        
        [self infoView];
        
        [self tableView];
        
        [self addSubview:_wrap];
        
    }
    
    return _wrap;

}

- (UIView *)infoView {

    if (!_infoView) {
        
        _infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.wrap.frame.size.width, 220)];
//        _infoView.backgroundColor = HQ_RGBA(0, 0, 0, 1);
        
        self.backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _infoView.frame.size.width, _infoView.frame.size.width)];
//        backgroundImage.image = self.userinfo.userHeadImage;
        self.backgroundImage.image = [UIImage imageNamed:@"bj"];
        self.backgroundImage.contentMode = UIViewContentModeScaleToFill;
        self.backgroundImage.layer.masksToBounds = YES;
        self.backgroundImage.center = CGPointMake(_infoView.center.x, _infoView.center.y);
        self.backgroundImage.alpha = 0.7;
        self.backgroundImage.layer.zPosition = 0;
        _infoView.layer.masksToBounds = YES;
        
        self.userHeadImageView = [[UIImageView alloc] initWithImage:self.userinfo.userHeadImage];
        self.userHeadImageView.frame = CGRectMake(0, 0, 80, 80);
        self.userHeadImageView.center = CGPointMake(_infoView.center.x, _infoView.center.y - 40);
        self.userHeadImageView.layer.cornerRadius = self.userHeadImageView.frame.size.width / 2;
        self.userHeadImageView.layer.borderWidth = 3;
        self.userHeadImageView.layer.borderColor = HQ_RGBA(180, 180, 180, 1).CGColor;
        self.userHeadImageView.layer.masksToBounds = YES;
//        self.userHeadImageView.alpha = 1;
        self.userHeadImageView.layer.zPosition = 1;
        [_infoView addSubview:self.userHeadImageView];
        
        [_infoView addSubview:self.backgroundImage];
        
        self.userNameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _infoView.frame.size.width, 20)];
        self.userNameLable.text = self.userinfo.userName;
        self.userNameLable.textAlignment = NSTextAlignmentCenter;
        self.userNameLable.font = [UIFont systemFontOfSize:20 weight:0.5];
        self.userNameLable.layer.zPosition = 1;
        self.userNameLable.center = CGPointMake(_infoView.center.x, _infoView.center.y + 20);
        
        [_infoView addSubview:self.userNameLable];
        
        UIView *btnLikeNum = [[UIView alloc] initWithFrame:CGRectMake(0, _infoView.frame.size.height - 60, _infoView.frame.size.width/2, 60)];
        
        UILabel *likeNumNotice = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, btnLikeNum.frame.size.width, 15)];
        likeNumNotice.text = @"想吃";
        likeNumNotice.textAlignment = NSTextAlignmentCenter;
        likeNumNotice.font = [UIFont systemFontOfSize:15];
        [btnLikeNum addSubview:likeNumNotice];
        
        self.likeNumLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, btnLikeNum.frame.size.width, 15)];
        self.likeNumLable.text = [NSString stringWithFormat:@"%d", self.userinfo.likeNum];
        self.likeNumLable.textAlignment = NSTextAlignmentCenter;
        self.likeNumLable.font = [UIFont systemFontOfSize:15];
        [btnLikeNum addSubview:self.likeNumLable];
        
        
        UIView *totalIncome = [[UIView alloc] initWithFrame:CGRectMake(_infoView.frame.size.width/2, _infoView.frame.size.height - 60, _infoView.frame.size.width/2, 60)];
        
        UILabel *totalNotice = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, btnLikeNum.frame.size.width, 15)];
        totalNotice.text = @"总收益";
        totalNotice.textAlignment = NSTextAlignmentCenter;
        totalNotice.font = [UIFont systemFontOfSize:15];
        [totalIncome addSubview:totalNotice];
        
        self.totalIncomeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, btnLikeNum.frame.size.width, 15)];
        self.totalIncomeLable.text = [NSString stringWithFormat:@"%.2f", self.userinfo.totalIncome];
        self.totalIncomeLable.textAlignment = NSTextAlignmentCenter;
        self.totalIncomeLable.font = [UIFont systemFontOfSize:15];
        [totalIncome addSubview:self.totalIncomeLable];
        
        
        
        [_infoView addSubview:btnLikeNum];
        [_infoView addSubview:totalIncome];
        
        [self.wrap addSubview:_infoView];
    
    
    }
    
    return  _infoView;
    
}

- (UITableView *)tableView {

    if (!_tableView) {
    
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 220, self.wrap.frame.size.width, SCREEN_HEIGHT - 220)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self.wrap addSubview:_tableView];
    
    }
    return _tableView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"asdfsdf";
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    long temp = 0;
    switch (section) {
        case 0:
            temp = self.action.count;
            break;
            
        case 1:
            temp = self.notice.count;
            break;
    }
    
    return temp;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.wrap.frame.size.width, 10)];
    view.backgroundColor = [UIColor clearColor];
    
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 50;
    
}

@end
