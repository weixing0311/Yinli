//
//  FacePageModel.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/4.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "FacePageModel.h"

@implementation FacePageModel
-(NSString *)cellClassName
{
    return @"FacePageCell";
}
-(void)setInfoWithDict:(NSDictionary *)dict
{
    
    self.dateStr     = @"1.4";
    self.daysStr     = @"今天";
    self.titleStr    = @"-穿衣搭配技巧-";
    self.subTitleStr = @"男士衣品搭配进阶指南-夏季篇 ";
    self.contentStr  = @"让自己魅力大涨让自己魅力大涨让自己魅力大涨让自己魅力大涨让自己魅力大涨让自己魅力大涨让自己魅力大涨让自己魅力大涨";
    self.nickName    = @"万年小逗比";
    self.headImgUrl  = @"https://zhijj.oss-cn-zhangjiakou.aliyuncs.com/images/head/1504143518989242724.png";
    self.bgImageUrl  = @"https://zhijj.oss-cn-zhangjiakou.aliyuncs.com/images/head/1510198811194391953.png";
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
