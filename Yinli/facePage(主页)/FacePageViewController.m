//
//  FacePageViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/4.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "FacePageViewController.h"
#import "FacePageModel.h"
@interface FacePageViewController ()

@end

@implementation FacePageViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTableView];
//    [self setRefrshWithTableView:self.tableview];
    // Do any additional setup after loading the view.
    [self getDataInfo];
}



-(void)getDataInfo
{
    FacePageModel * model = [[FacePageModel alloc]init];
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
