//
//  KnowledgeViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/4.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "KnowledgeViewController.h"
#import "KnowLedgeModel.h"
@interface KnowledgeViewController ()

@end

@implementation KnowledgeViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTableView];

    self.tableview.frame = CGRectMake(0, 130, JFA_SCREEN_WIDTH, self.view.frame.size.height-130);
    [self buildTitleView];
    [self getDataInfo];
    // Do any additional setup after loading the view.
}
-(void)buildTitleView
{
    UIView * titleView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, JFA_SCREEN_WIDTH, 100)];
    titleView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:titleView];
    
    UILabel * titlelb = [[UILabel alloc]initWithFrame:CGRectMake(20, 24, 150, 20)];
    titlelb.text = @"知识库";
    titlelb.font = [UIFont boldSystemFontOfSize:22];
    [titleView addSubview:titlelb];
    
    UIButton * searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(JFA_SCREEN_WIDTH-120, 24, 100, 30)];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [searchBtn setTitleColor:HEXCOLOR(0x666666) forState:UIControlStateNormal];
    [searchBtn setImage:getImage(@"") forState:UIControlStateNormal];
    searchBtn.layer.borderWidth= 1;
    searchBtn.layer.borderColor = HEXCOLOR(0x666666).CGColor;
    searchBtn.layer.masksToBounds = YES;
    searchBtn.layer.cornerRadius  = 10;
    
    [titleView addSubview:searchBtn];
    
    
    double width = (JFA_SCREEN_WIDTH-70)/6;
    
    for (int i =0; i<6; i++) {
        
        NSString * imageName = [NSString stringWithFormat:@"noit_%d",i+1];
        
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(10+i*(width+10), 60, width, width)];
        [btn setBackgroundImage:getImage(imageName) forState:UIControlStateNormal];
        [titleView addSubview:btn];
        
    }
    
    
    
}
-(void)getDataInfo
{
    KnowLedgeModel * model = [[KnowLedgeModel alloc]init];
    [model setInfoWithDict:nil];
    for (int i =0; i<10; i++) {
        [self.dataArray addObject:model];
    }
    [self.tableview reloadData];
    
    //    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    //    [params safeSetObject:@(self.page) forKey:@"page"];
    //    [params safeSetObject:@"30" forKey:@"pageSize"];
    //
    //    [[BaseSerVice sharedManager]post:@"" paramters:params success:^(NSDictionary *dic) {
    //
    //
    //    } failure:^(NSError *error) {
    //
    //    }];
    
}
-(float)cellHeight
{
    return JFA_SCREEN_WIDTH*0.6+70;
}

-(void)didSelectTbWithIndexPath:(NSIndexPath *)indexPath
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
