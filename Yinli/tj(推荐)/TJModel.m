//
//  TJModel.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/5.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "TJModel.h"

@implementation TJModel
-(NSString *)cellClassName
{
    return @"TJCell";
}
-(void)setInfoWithDict:(NSDictionary *)dict
{
    
    self.daysStr     = @"周一、阳光、工作";
    self.titleStr    = @"你的最新专属搭配";
    self.subTitleStr = @"男士衣品搭配进阶指南-夏季篇 ";
    self.bigImageUrl  = @"https://zhijj.oss-cn-zhangjiakou.aliyuncs.com/images/head/1510198811194391953.png";
    self.img1Str = @"https://zhijj.oss-cn-zhangjiakou.aliyuncs.com/images/head/1504143518989242724.png";
    self.img2Str = @"https://zhijj.oss-cn-zhangjiakou.aliyuncs.com/images/head/1504143518989242724.png";
    self.img3Str = @"https://zhijj.oss-cn-zhangjiakou.aliyuncs.com/images/head/1504143518989242724.png";
    self.img4Str = @"https://zhijj.oss-cn-zhangjiakou.aliyuncs.com/images/head/1504143518989242724.png";
    self.modelId     = @"1";
    
    
    
    
    //    self.dateStr     = [dict safeObjectForKey:@""];
    //    self.daysStr     = [dict safeObjectForKey:@""];
    //    self.titleStr    = [dict safeObjectForKey:@""];
    //    self.subTitleStr = [dict safeObjectForKey:@""];
    //    self.contentStr  = [dict safeObjectForKey:@""];
    //    self.nickName    = [dict safeObjectForKey:@""];
    //    self.headImgUrl  = [dict safeObjectForKey:@""];
    //    self.bgImageUrl  = [dict safeObjectForKey:@""];
    //    self.modelId     = [dict safeObjectForKey:@""];
    
}

@end
