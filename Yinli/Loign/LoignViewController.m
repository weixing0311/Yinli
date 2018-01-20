//
//  LoignViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2017/9/25.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "LoignViewController.h"
#import "YLFaceViewController.h"
#import "TestPhotoViewController.h"
@interface LoignViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sendSMSBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTf;
@property (weak, nonatomic) IBOutlet UITextField *smsTf;

@end

@implementation LoignViewController
{
    NSTimer * _timer;
    NSInteger timeNumber;

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneNumTf.text = @"15510106271";
    self.smsTf.text = @"1234";
    // Do any additional setup after loading the view from its nib.
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenKeyBoard)]];

}
-(void)hiddenKeyBoard
{
    [self.phoneNumTf resignFirstResponder];
    [self.smsTf resignFirstResponder];
}
- (IBAction)didLoign:(id)sender {
    if ([self.phoneNumTf.text isEqualToString:@""]||[self.phoneNumTf.text isEqualToString:@" "]||!self.phoneNumTf.text) {
        [[UserModel shareInstance] showInfoWithStatus:@"请输入手机号"];
        return;
    }
    if ([self.smsTf.text isEqualToString:@""]||[self.smsTf.text isEqualToString:@" "]||!self.smsTf.text) {
        [[UserModel shareInstance] showInfoWithStatus:@"请输入验证码"];
        return;
    }
    [SVProgressHUD showWithStatus:@"登录中。。。"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    
    NSString * phone = [NSString stringWithFormat:@"%@",self.phoneNumTf.text];
    NSString * encryPhoneNum = [NSString encryptString:phone];
    
    NSMutableDictionary *param =[ NSMutableDictionary dictionary];
    [param setObject:encryPhoneNum forKey:@"mobilePhone"];
    [param setObject:self.smsTf.text forKey:@"vcode"];
    DLog(@"param--%@",param);
    [[BaseSerVice sharedManager]post:loginUrl paramters:param  success:^(NSDictionary *dic) {
        [SVProgressHUD dismiss];
        [[UserModel shareInstance] showSuccessWithStatus:@"登录成功"];
        
        
        [[UserModel shareInstance]setInfoWithDic:[dic safeObjectForKey:@"data"]];
        
        [_timer invalidate];
        [self.sendSMSBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.sendSMSBtn.enabled = YES;
//        TestPhotoViewController * fa = [[TestPhotoViewController alloc]init];
        YLFaceViewController * fa = [[YLFaceViewController alloc]init];
        [self.navigationController pushViewController:fa animated:YES];

        
//        [[UserModel shareInstance]setInfoWithDic:[dic objectForKey:@"data"]];
//        [[NSUserDefaults standardUserDefaults]setObject:[[dic objectForKey:@"data"]objectForKey:@ "userId"] forKey:kMyloignInfo];
        
        
        
//        if ([UserModel shareInstance].nickName.length>0) {
//
//            TabbarViewController *tab = [[TabbarViewController alloc]init];
//            [UserModel shareInstance].tabbarStyle = @"health";
//            self.view.window.rootViewController = tab;
//
//        }else{
//            ADDChengUserViewController *cg =[[ADDChengUserViewController alloc]init];
//            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:cg];
//            cg.isResignUser =YES;
//            [self presentViewController:nav animated:YES completion:nil];
//        }
        
        
        
    } failure:^(NSError *error) {
        
        //        [[UserModel shareInstance] showErrorWithStatus:@"登录失败"];
//        [_timer invalidate];
//        [self.sendSMSBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
//        self.sendSMSBtn.enabled = YES;
        
    }];

}
- (IBAction)didSendSMS:(id)sender {
    timeNumber = 59;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshTime) userInfo:nil repeats:YES];
    self.sendSMSBtn.enabled = NO;
    
    NSMutableDictionary *param =[ NSMutableDictionary dictionary];
    [param setObject:self.phoneNumTf.text forKey:@"mobilePhone"];
    [param setObject:@"0" forKey:@"msgType"];
    
    [[BaseSerVice sharedManager]post:sednSMSUrl paramters:param success:^(NSDictionary *dic) {
        NSDictionary *dict = dic;
        NSString * status = [dict objectForKey:@"status"];
        NSString * msg ;
        if (![status isEqualToString:@"success"]) {
            msg =[dic objectForKey:@"message"];
            [_timer invalidate];
            [self.sendSMSBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            self.sendSMSBtn.enabled = YES;
            
        }else{
            msg = @"已发送";
        }
        DLog(@"%@",msg);
        [[UserModel shareInstance] showSuccessWithStatus:msg];
        

    } failure:^(NSError *error) {
        NSLog(@"faile--%@",error);
        [_timer invalidate];
        [self.sendSMSBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.sendSMSBtn.enabled = YES;
        
        NSDictionary *dic = error.userInfo;
        if ([[dic allKeys]containsObject:@"message"]) {
            UIAlertController *al = [UIAlertController alertControllerWithTitle:@"提示" message:[dic objectForKey:@"message"] preferredStyle:UIAlertControllerStyleAlert];
            
            [al addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            [self presentViewController:al animated:YES completion:nil];
            
        }else{
            [[UserModel shareInstance] showErrorWithStatus:@"发送失败"];
        }

    }];
    

}
-(void)refreshTime
{
    if (timeNumber ==0) {
        [_timer invalidate];
        [self.sendSMSBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.sendSMSBtn.enabled = YES;
        return;
    }
    NSLog(@"%ld",(long)timeNumber);
    [self.sendSMSBtn setTitle:[NSString stringWithFormat: @"%ld秒后可重新获取",(long)timeNumber] forState:UIControlStateNormal];
    timeNumber --;
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
