//
//  MineViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/10.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)didEdit:(id)sender {
}
- (IBAction)tapheadImage:(id)sender {
}
- (IBAction)tapShopIngBags:(id)sender {
}
- (IBAction)tapOrder:(id)sender {
}
- (IBAction)tapMyInfo:(id)sender {
}
- (IBAction)tapShare:(id)sender {
}
- (IBAction)tapCallKf:(id)sender {
}
- (IBAction)tapAboutUs:(id)sender {
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
