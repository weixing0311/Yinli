//
//  PerfectInfoViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/20.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "PerfectInfoViewController.h"
#import "PerfectInfoModel.h"
#import "TabbarViewController.h"
#import "HairWebViewController.h"
@interface PerfectInfoViewController ()

@end

@implementation PerfectInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.params =[NSMutableDictionary dictionary];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeSelectedInfo:) name:@"perfectInfodudu" object:nil];
    [self buildTableView];
    [self.params safeSetObject:[UserModel shareInstance].userId forKey:@"userId"];
    [self.params safeSetObject:@"175" forKey:@"height"];
    [self.params safeSetObject:@"65" forKey:@"weight"];
    [self.params safeSetObject:@"55" forKey:@"waist"];
    [self.params safeSetObject:@"85" forKey:@"armLength"];
    [self.params safeSetObject:@"85" forKey:@"longLeg"];
    [self.params safeSetObject:@"55" forKey:@"shoulderWidth"];
    [self.params safeSetObject:@"75" forKey:@"hipline"];
    [self.params safeSetObject:@"100" forKey:@"thigh"];

    
    self.tableview.frame = CGRectMake(0, 70, JFA_SCREEN_WIDTH, self.view.frame.size.height-130);
    [self buildBottomView];
    // Do any additional setup after loading the view.
    [self getDataInfo];

}
-(void)buildBottomView
{
    UIView * bottomView =[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-60, JFA_SCREEN_WIDTH, 60)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    
    UIButton * okBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 7, JFA_SCREEN_WIDTH-60, 45)];
    [okBtn setTitle:@"完成" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okBtn setBackgroundColor:[UIColor blueColor]];
    
    [bottomView addSubview:okBtn];
    
    [okBtn addTarget:self action:@selector(updateInfo) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
-(void)getDataInfo
{
    
    NSDictionary * dic1 = @{@"title":@"身高"
                            ,@"min":@"150"
                            ,@"max":@"220"
                            ,@"select":@"175"
                            ,@"subTitle":@""
                            };
    NSDictionary * dic2 = @{@"title":@"体重"
                            ,@"min":@"40"
                            ,@"max":@"140"
                            ,@"select":@"65"
                            ,@"subTitle":@""
                            };
    NSDictionary * dic3 = @{@"title":@"肩宽"
                            ,@"min":@"35"
                            ,@"max":@"100"
                            ,@"select":@"55"
                            ,@"subTitle":@""
                            };
    NSDictionary * dic4 = @{@"title":@"腰围"
                            ,@"min":@"60"
                            ,@"max":@"120"
                            ,@"select":@"85"
                            ,@"subTitle":@""
                            };
    NSDictionary * dic5 = @{@"title":@"臀围"
                            ,@"min":@"60"
                            ,@"max":@"120"
                            ,@"select":@"85"
                            ,@"subTitle":@""
                            };
    NSDictionary * dic6 = @{@"title":@"大腿围"
                            ,@"min":@"35"
                            ,@"max":@"100"
                            ,@"select":@"55"
                            ,@"subTitle":@""
                            };
    NSDictionary * dic7 = @{@"title":@"臂长"
                            ,@"min":@"50"
                            ,@"max":@"120"
                            ,@"select":@"75"
                            ,@"subTitle":@""
                            };
    NSDictionary * dic8 = @{@"title":@"腿长"
                            ,@"min":@"80"
                            ,@"max":@"120"
                            ,@"select":@"100"
                            ,@"subTitle":@""
                            };

    NSArray * arr = @[dic1,dic2,dic3,dic4,dic5,dic6,dic7,dic8];
    
    for (int i =0; i<arr.count; i++) {
        PerfectInfoModel * model = [[PerfectInfoModel alloc]init];
        NSDictionary *dic = [arr objectAtIndex:i];
        [model setInfoWithDict:dic];
        [self.dataArray addObject:model];
    }
    [self.tableview reloadData];
}
-(float)cellHeight
{
    return 120;
}

-(void)updateInfo
{
    NSData *  fileDate = UIImageJPEGRepresentation(self.image, 0.001);

    [[BaseSerVice sharedManager]postImage:@"app/information/gainInformation.do" paramters:self.params imageData:fileDate imageName:@"picture" success:^(NSDictionary *dic) {
        HairWebViewController * tab =[[HairWebViewController alloc]init];
        tab.dict = dic;
        [self.view.window setRootViewController:tab];;
        
    } failure:^(NSError *error) {
        
    }];

//    [[BaseSerVice sharedManager]post:@"app/information/gainInformation.do" paramters:self.params success:^(NSDictionary *dic) {
//
//        TabbarViewController * tab =[[TabbarViewController alloc]init];
//
//        [self.view.window setRootViewController:tab];;
//    } failure:^(NSError *error) {
//
//    }];
}

-(void)changeSelectedInfo:(NSNotification*)noti
{
    NSString * info = [noti.userInfo objectForKey:@"info"];
    NSString * index = [NSString stringWithFormat:@"%@",[noti.userInfo objectForKey:@"index"]];
    
    NSString * keyStr =@"";
     if ([index isEqualToString:@"1"])
    {
        keyStr = @"weight";

    }
    else if ([index isEqualToString:@"2"])
    {
        keyStr = @"waist";

    }
    else if ([index isEqualToString:@"3"])
    {
        keyStr = @"armLength";

    }
    else if ([index isEqualToString:@"4"])
    {
        keyStr = @"longLeg";

    }
    else if ([index isEqualToString:@"5"])
    {
        keyStr = @"shoulderWidth";

    }
    else if ([index isEqualToString:@"6"])
    {
        keyStr = @"hipline";
        
    }

    else if ([index isEqualToString:@"7"])
    {
        keyStr = @"thigh";
        
    }
    else{
        keyStr = @"height";

    }
    [self.params safeSetObject:info forKey:keyStr];
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
