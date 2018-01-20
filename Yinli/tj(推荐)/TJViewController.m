
//
//  TJViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/4.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "TJViewController.h"
#import "TJModel.h"
@interface TJViewController ()

@end

@implementation TJViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildTitleView];
    [self buildTableView];
    self.tableview.frame = CGRectMake(0, 100, JFA_SCREEN_WIDTH, self.view.frame.size.height-100);
    
    // Do any additional setup after loading the view.
    [self getDataInfo];
}
-(void)buildTitleView
{
    UIView * titleView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, JFA_SCREEN_WIDTH, 100)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    
    UILabel * titlelb = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 200, 30)];
    titlelb.text = @"只为你推荐的";
    titlelb.textColor = [UIColor blackColor];
    titlelb.font = [UIFont boldSystemFontOfSize:22];
    [titleView addSubview:titlelb];
    
    
    UIButton * dp1Btn = [[UIButton alloc]initWithFrame:CGRectMake(JFA_SCREEN_WIDTH-70, 40, 50,50)];
    [dp1Btn addTarget:self action:@selector(diddp1) forControlEvents:UIControlEventTouchUpInside];
    [dp1Btn setBackgroundImage:getImage(@"dp1_s") forState:UIControlStateNormal];
    [titleView addSubview:dp1Btn];
    
    
    UIButton * dp2Btn = [[UIButton alloc]initWithFrame:CGRectMake(JFA_SCREEN_WIDTH-140, 40, 50,50)];
    [dp2Btn addTarget:self action:@selector(diddp2) forControlEvents:UIControlEventTouchUpInside];
    [dp2Btn setBackgroundImage:getImage(@"dp2_s") forState:UIControlStateNormal];
    
    [titleView addSubview:dp2Btn];
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 99, JFA_SCREEN_WIDTH, 1)];
    lineView.backgroundColor =HEXCOLOR(0xeeeeee);
    [titleView addSubview:lineView];

}
-(void)getDataInfo
{
    TJModel * model = [[TJModel alloc]init];
    [model setInfoWithDict:nil];
    [self.dataArray addObject:model];
    [self.tableview reloadData];

}
-(float)cellHeight
{
    return (JFA_SCREEN_WIDTH-20)*0.65+(JFA_SCREEN_WIDTH-30)/2+(((JFA_SCREEN_WIDTH-30)/4+15)*3+40)+160;
}

-(void)diddp1
{
    
}
-(void)diddp2
{
    
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
