//
//  WebViewController.m
//  wenwobei
//
//  Created by HanQi on 16/9/16.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "WebViewController.h"
#import "CarouselDataModel.h"
#import "Config.h"

@interface WebViewController ()

@property (nonatomic, strong) CarouselDataModel *model;

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self webView];
    
    self.title = self.model.carouselName;
    
    NSLog(@"%@", self.model.carouselClickURL);
    
}

- (UIWebView *)webView {

    if (!_webView) {
    
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _webView.backgroundColor = [UIColor whiteColor];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?type=app", self.model.carouselClickURL]]]];
//        NSString *script = @"$('.bar').background-color = '#000'";
//        [_webView stringByEvaluatingJavaScriptFromString:script];
        [self.view addSubview:_webView];
        
    }
    
    return _webView;


}

- (instancetype)initWithData:(CarouselDataModel *)data
{
    self = [super init];
    if (self) {
        self.model = data;
    }
    return self;
}



@end
