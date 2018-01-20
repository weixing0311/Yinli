//
//  YLFaceViewController.m
//  Yinli
//
//  Created by iOSdeveloper on 2017/9/25.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "YLFaceViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "YLFace2ViewController.h"


#define BAIDUAPIKEY  @"jlcFM4yIbox8TgT817a65T3h"
#define BAIDUSECERTKEY @"0dMy3Dnaz60VPAyv8GeLSAEvQk391VBE"

@interface YLFaceViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate>
//捕获设备，通常是前置摄像头，后置摄像头，麦克风（音频输入）
@property(nonatomic)AVCaptureDevice *device;

//AVCaptureDeviceInput 代表输入设备，他使用AVCaptureDevice 来初始化
@property(nonatomic)AVCaptureDeviceInput *input;

//当启动摄像头开始捕获输入
@property(nonatomic)AVCaptureMetadataOutput *output;

@property (nonatomic)AVCaptureStillImageOutput *ImageOutPut;

//session：由他把输入输出结合在一起，并开始启动捕获设备（摄像头）
@property(nonatomic)AVCaptureSession *session;

//图像预览层，实时显示捕获的图像
@property(nonatomic)AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic)BOOL canCa;
@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,assign)UIImage     * image;
@end

@implementation YLFaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getToken];
    
//    _canCa = [self canUserCamear];
//    if (_canCa) {
//        [self customCamera];
//        [self customUI];
//
//    }else{
//        return;
//    }
    
    
    
    UIButton * button =[UIButton new];
    [button setTitle:@"" forState:UIControlStateNormal];
    button.backgroundColor =[UIColor redColor];

    button.frame = CGRectMake(150, 150, 100, 100);
    [button addTarget:self action:@selector(getImage) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}
////设置相机UI
//- (void)customUI{
//
//    UIView * bottomView =[[UIView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-60, JFA_SCREEN_WIDTH, 60)];
//
//    UIButton * leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 40, 40)];
//    leftBtn.backgroundColor = [UIColor redColor];
//    [bottomView addSubview:leftBtn];
//
//    UIButton * midBtn = [[UIButton alloc]initWithFrame:CGRectMake(JFA_SCREEN_WIDTH/2-20, 10, 40, 40)];
//    midBtn.backgroundColor = [UIColor redColor];
//    [midBtn addTarget:self action:@selector(shutterCamera) forControlEvents:UIControlEventTouchUpInside];
//
//    [bottomView addSubview:midBtn];
//
//    UIButton * rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(JFA_SCREEN_WIDTH-60, 10, 40, 40)];
//    rightBtn.backgroundColor = [UIColor redColor];
//    [rightBtn addTarget:self action:@selector(changeCamera) forControlEvents:UIControlEventTouchUpInside];
//
//    [bottomView addSubview:rightBtn];
//    [self.view addSubview:bottomView];
//
//
//}
////自定义相机
//- (void)customCamera{
//    self.view.backgroundColor = [UIColor whiteColor];
//
//    //使用AVMediaTypeVideo 指明self.device代表视频，默认使用后置摄像头进行初始化
////    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    self.device = [self cameraWithPosition:AVCaptureDevicePositionFront];
//    //使用设备初始化输入
//    self.input = [[AVCaptureDeviceInput alloc]initWithDevice:self.device error:nil];
//
//    //生成输出对象
//    self.output = [[AVCaptureMetadataOutput alloc]init];
//    self.ImageOutPut = [[AVCaptureStillImageOutput alloc] init];
//
//    //生成会话，用来结合输入输出
//    self.session = [[AVCaptureSession alloc]init];
//    if ([self.session canSetSessionPreset:AVCaptureSessionPreset352x288]) {
//
//        self.session.sessionPreset = AVCaptureSessionPreset352x288;
//
//    }
//    if ([self.session canAddInput:self.input]) {
//        [self.session addInput:self.input];
//    }
//
//    if ([self.session canAddOutput:self.ImageOutPut]) {
//        [self.session addOutput:self.ImageOutPut];
//    }
//
//    //使用self.session，初始化预览层，self.session负责驱动input进行信息的采集，layer负责把图像渲染显示
//    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
//
//
//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(50, JFA_SCREEN_HEIGHT-(JFA_SCREEN_WIDTH-100)-100, JFA_SCREEN_WIDTH-100, JFA_SCREEN_WIDTH-100)];
//    [self.view addSubview:view];
//
//    self.previewLayer.frame = CGRectMake(0, 0, JFA_SCREEN_WIDTH-100, JFA_SCREEN_WIDTH-100);
//
//
//
////    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
//    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
////    self.previewLayer.videoGravity = AVLayerVideoGravityResize;
//
//
//    [self.view addSubview:view];
//
//    [view.layer addSublayer:self.previewLayer];
//
//    //开始启动
//    [self.session startRunning];
//    if ([_device lockForConfiguration:nil]) {
//        if ([_device isFlashModeSupported:AVCaptureFlashModeAuto]) {
//            [_device setFlashMode:AVCaptureFlashModeAuto];
//        }
//        //自动白平衡
//        if ([_device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeAutoWhiteBalance]) {
//            [_device setWhiteBalanceMode:AVCaptureWhiteBalanceModeAutoWhiteBalance];
//        }
//        [_device unlockForConfiguration];
//    }
//}
//- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position{
//    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
//    for ( AVCaptureDevice *device in devices )
//        if ( device.position == position ) return device;
//    return nil;
//}
//- (void)changeCamera{
//    NSUInteger cameraCount = [[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] count];
//    if (cameraCount > 1) {
//        NSError *error;
//
//        CATransition *animation = [CATransition animation];
//
//        animation.duration = .5f;
//
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//
//        animation.type = @"oglFlip";
//        AVCaptureDevice *newCamera = nil;
//        AVCaptureDeviceInput *newInput = nil;
//        AVCaptureDevicePosition position = [[_input device] position];
//        if (position == AVCaptureDevicePositionFront){
//            newCamera = [self cameraWithPosition:AVCaptureDevicePositionBack];
//            animation.subtype = kCATransitionFromLeft;
//        }
//        else {
//            newCamera = [self cameraWithPosition:AVCaptureDevicePositionFront];
//            animation.subtype = kCATransitionFromRight;
//        }
//
//        newInput = [AVCaptureDeviceInput deviceInputWithDevice:newCamera error:nil];
//        [self.previewLayer addAnimation:animation forKey:nil];
//        if (newInput != nil) {
//            [self.session beginConfiguration];
//            [self.session removeInput:_input];
//            if ([self.session canAddInput:newInput]) {
//                [self.session addInput:newInput];
//                self.input = newInput;
//
//            } else {
//                [self.session addInput:self.input];
//            }
//
//            [self.session commitConfiguration];
//
//        } else if (error) {
//            NSLog(@"toggle carema failed, error = %@", error);
//        }
//
//    }
//}
//
//#pragma mark - 截取照片
//- (void) shutterCamera
//{
//    AVCaptureConnection * videoConnection = [self.ImageOutPut connectionWithMediaType:AVMediaTypeVideo];
//    if (!videoConnection) {
//        NSLog(@"take photo failed!");
//        return;
//    }
//    videoConnection.videoOrientation = [self.previewLayer connection].videoOrientation;
//
//    [self.ImageOutPut captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
//        if (imageDataSampleBuffer == NULL) {
//            return;
//        }
//        NSData * imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
//         UIImage * image = [UIImage imageWithData:imageData];
//        [self.session stopRunning];
////        [self saveImageToPhotoAlbum:self.image];
//        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 288, 352)];
//
//        [self.view addSubview:_imageView];
//        self.imageView.layer.masksToBounds = YES;
////        self.imageView.image = image;
//        NSLog(@"image size = %@",NSStringFromCGSize(self.image.size));
//        YLFace2ViewController * face2 = [[YLFace2ViewController alloc]init];
//        face2.image = image;
//        [self.navigationController pushViewController:face2 animated:YES];
//    }];
//}



-(void)getToken
{
    NSMutableDictionary * params= [NSMutableDictionary dictionary];
    
    [params setObject:@"client_credentials" forKey:@"grant_type"];
    [params setObject:@"jlcFM4yIbox8TgT817a65T3h" forKey:@"client_id"];
    [params setObject:@"0dMy3Dnaz60VPAyv8GeLSAEvQk391VBE" forKey:@"client_secret"];
    
    
    NSString * urlStr =[NSString stringWithFormat:@"https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=%@&client_secret=%@",BAIDUAPIKEY,BAIDUSECERTKEY];
    
    //https://aip.baidubce.com/oauth/2.0/token
    [[BaseSerVice sharedManager]getbaiduApiWithUrl:urlStr success:^(NSDictionary *dic) {
        
        
//        NSString * baiduToken = [dic safeObjectForKey:@"refresh_token"];
//        NSString * scope = [dic safeObjectForKey:@"scope"];
//        NSString * session_secret = [dic safeObjectForKey:@"session_secret"];
//        NSString * expires_in = [dic safeObjectForKey:@"expires_in"];
        NSString * access_token = [dic safeObjectForKey:@"access_token"];
//        NSString * session_key = [dic safeObjectForKey:@"session_key"];

        [UserModel shareInstance].access_token = access_token;
        
    } failure:^(NSError *error) {
        
    }];
     
}


#pragma mark - 检查相机权限
- (BOOL)canUserCamear{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请打开相机权限" message:@"设置-隐私-相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        alertView.tag = 100;
        [alertView show];
        return NO;
    }
    else{
        return YES;
    }
    return YES;
}








//-(void)upLoadimage:(UIImage * )image
//{
//
//
//
//    NSData *data = UIImageJPEGRepresentation(image, 1);
//    float lenght = data.length;
//    float m = lenght/1024/1024;
//
//    if (m>2) {
//        data  =UIImageJPEGRepresentation(image,2/m);
//    }
//    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//
//    NSMutableDictionary * params= [NSMutableDictionary dictionary];
//    [params safeSetObject:[UserModel shareInstance].access_token forKey:@"access_token"];
//    [params setObject:encodedImageStr forKey:@"image"];
//    [params setObject:@"age,beauty,expression,faceshape,gender,glasses,landmark,race,qualities" forKey:@"face_fields"];
//    [[BaseSerVice sharedManager]postBaidu:@"https://aip.baidubce.com/rest/2.0/face/v1/detect?Content-Type=application/x-www-form-urlencoded" paramters:params success:^(NSDictionary *dic) {
//
//
//        YLFace2ViewController * face2 = [[YLFace2ViewController alloc]init];
//        face2.infoDic = dic;
//        face2.image = image;
//        [self.navigationController pushViewController:face2 animated:YES];
//
//    } failure:^(NSError *error) {
//
//    }];
//
//
//
//}



-(void)getImage
{
UIAlertController *al = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
[al addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        
    }
    pickerImage.delegate = self;
    pickerImage.allowsEditing = YES;
    [self presentViewController:pickerImage animated:YES completion:nil];
}]];
[al addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    
    NSString *mediaType = AVMediaTypeVideo;
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        
        
        
        NSLog(@"相机权限受限");
        
        return;
        
    }
    
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:nil];
}]];
[al addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
[self presentViewController:al animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        //如果是图片
        UIImage *image =info[UIImagePickerControllerEditedImage];
        [image scaledToSize:CGSizeMake(JFA_SCREEN_WIDTH, JFA_SCREEN_WIDTH/image.size.width*image.size.height)];
        
        YLFace2ViewController * face2 = [[YLFace2ViewController alloc]init];
        face2.image = image;
        [self.navigationController pushViewController:face2 animated:YES];

    }
    [self dismissViewControllerAnimated:YES completion:nil];
}




//点击cancel 调用的方法


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
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
