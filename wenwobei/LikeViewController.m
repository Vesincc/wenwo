//
//  LikeViewController.m
//  wenwobei
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "LikeViewController.h"
#import "SimpleTableViewCell.h"
#import "SimpleTableViewCellModel.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "Config.h"
#import "AFNetworking.h"
#import "InfoNetworkModel.h"
#import "MJRefresh.h"


@interface LikeViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *cellData;

@end

@implementation LikeViewController

- (void)viewDidLoad {
    self.cellData = [NSMutableArray array];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSBlockOperation *taskNetwork = [NSBlockOperation blockOperationWithBlock:^{
            [self.cellData removeAllObjects];
            [self getInfoFromNetwork];
        }];
        [taskNetwork start];
    }];
    
    if (self.cellData.count == 0) {
        [self.tableView.mj_header beginRefreshing];
    }
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
    titleLable.center = CGPointMake(SCREEN_WIDTH/2, 35);
    titleLable.text = @"想吃";
    titleLable.font = [UIFont systemFontOfSize:20 weight:0.1];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.textColor = TITLE_COLER;
    self.navigationItem.titleView = titleLable;
    
    
    
    [self tableView];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSBlockOperation *taskNetwork = [NSBlockOperation blockOperationWithBlock:^{
            [self getInfoFromNetwork];
        }];
        [taskNetwork start];
    }];
    [self.tableView.mj_footer endRefreshing];

}


- (void)getInfoFromNetwork {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manger = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *urlStr = @"http://www.wenwobei.com/hode/foodlikelist";
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"username"] = @"573b0c63ad5b950057533669";
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlStr parameters:params error:nil];
    
    NSURLSessionDataTask *dataTask = [manger dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            
//                        NSLog(@"%@", responseObject);
            NSDictionary *resulte = responseObject;
            NSString *resultCode = [NSString stringWithFormat:@"%@", [resulte valueForKey:@"code"]];
            //            NSLog(@"%@", resultCode.class);
            if ([resultCode  isEqualToString: @"200"]) {
                
                NSArray *data = [resulte valueForKey:@"askDetail"];
                
                NSArray *infoArray = [InfoNetworkModel analysisNetworkData:data];
                
                [self.cellData addObjectsFromArray:[SimpleTableViewCellModel analysisFromInfoNetworkMode:infoArray]];
                
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
            }
            
        }
    }];
    [dataTask resume];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 125;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cellData.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SimpleTableViewCell *cell = [[SimpleTableViewCell alloc] initWithReusedID:@"discoverTableViewCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.cellData = self.cellData[indexPath.row];
    
    SimpleTableViewCellModel *model = self.cellData[indexPath.row];
    
    [cell.userHeadImageView sd_setImageWithURL:[NSURL URLWithString:model.createByUrl] placeholderImage:[UIImage imageNamed:@"default_userhead"]];
    
    return cell;
    
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = HQ_RGBA(244, 232, 227, 1);
        
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;
    
    
}



@end
