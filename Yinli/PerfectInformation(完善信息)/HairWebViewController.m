//
//  HairWebViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/20.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "HairWebViewController.h"

@interface HairWebViewController ()

@end

@implementation HairWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString * html = [[self.dict safeObjectForKey:@"data"]objectForKey:@"hair"];
    [self.webView loadHTMLString:html baseURL:nil];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dict = [NSDictionary dictionary];
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
