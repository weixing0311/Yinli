//
//  YLFace2ViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2017/9/25.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "YLFace2ViewController.h"
#import "PerfectInfoViewController.h"
@interface YLFace2ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *locationImageView;
@property(nonatomic) CGAffineTransform transform;
@end

@implementation YLFace2ViewController
{
    double imageProportion;//图片比例
    float getFajixianX;
    float getFajixianY;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _infoDic = [NSDictionary dictionary];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self upLoadimage:self.image];
    self.headerImageView.image = self.image;
    // Do any additional setup after loading the view from its nib.
//    [self getLocationCreateD];
    self.locationImageView.userInteractionEnabled = YES;
}

-(void)getLocationCreateD
{
    NSArray * landmarkArr = [[[self.infoDic objectForKey:@"result"]objectAtIndex:0]safeObjectForKey:@"landmark72"];
    for (int i =0; i<landmarkArr.count; i++) {
        NSDictionary * dict = [landmarkArr objectAtIndex:i];
        float x = [[dict safeObjectForKey:@"x"]floatValue];
        float y = [[dict safeObjectForKey:@"y"]floatValue];

        CGFloat Imagex = self.image.size.width;
        double imagex = JFA_SCREEN_WIDTH-100;
        imageProportion = imagex/Imagex;
        
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x*imageProportion, y*imageProportion, 2, 2)];

        
        
//        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x*imageProportion, y*imageProportion, 1, 1)];
        view.backgroundColor = [UIColor redColor];
        [self.bgView addSubview:view];
    }
}
//当开始触摸屏幕的时候调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    UITouch *touch = [touches anyObject];
    if (![touch.view isKindOfClass:[self.locationImageView class]]) {
        return;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //做UIView拖拽
    UITouch *touch = [touches anyObject];
    
    
    //求偏移量 = 手指当前点的X - 手指上一个点的X
    CGPoint curP = [touch locationInView:self.bgView];
    NSLog(@"curP====%@",NSStringFromCGPoint(curP));
    
    //平移
//    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    self.locationImageView.frame = CGRectMake(curP.x, curP.y, 20, 20);
}

//当手指离开屏幕时调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    UITouch *touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self.bgView];
    self.locationImageView.frame = CGRectMake(curP.x, curP.y, 20, 20);

    getFajixianX = curP.x;
    getFajixianY = curP.y;
    

}


//当发生系统事件时就会调用该方法(电话打入,自动关机)
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

- (IBAction)didTrue:(id)sender {
    PerfectInfoViewController * face3 =[[PerfectInfoViewController alloc]init];
    [face3.params safeSetObject:@(getFajixianX) forKey:@"centerX"];
    [face3.params safeSetObject:@(getFajixianX) forKey:@"centerY"];
    face3.image = _image;
    [self.navigationController pushViewController:face3 animated:YES];
}
- (IBAction)didCancel:(id)sender {
}
-(void)upLoadimage:(UIImage * )image
{
    
    
    
    NSData *data = UIImageJPEGRepresentation(image, 1);
    float lenght = data.length;
    float m = lenght/1024/1024;
    
    if (m>2) {
        data  =UIImageJPEGRepresentation(image,2/m);
    }
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSMutableDictionary * params= [NSMutableDictionary dictionary];
    [params safeSetObject:[UserModel shareInstance].access_token forKey:@"access_token"];
    [params setObject:encodedImageStr forKey:@"image"];
    [params setObject:@"age,beauty,expression,faceshape,gender,glasses,landmark,race,qualities" forKey:@"face_fields"];
    [[BaseSerVice sharedManager]postBaidu:@"https://aip.baidubce.com/rest/2.0/face/v1/detect?Content-Type=application/x-www-form-urlencoded" paramters:params success:^(NSDictionary *dic) {
        
        self.infoDic = dic;
        [self getLocationCreateD];
//        YLFace2ViewController * face2 = [[YLFace2ViewController alloc]init];
//        face2.infoDic = dic;
//        face2.image = image;
//        [self.navigationController pushViewController:face2 animated:YES];
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
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
