
//
//  PerfectInfoModel.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/20.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "PerfectInfoModel.h"

@implementation PerfectInfoModel
-(NSString *)cellClassName
{
    return @"PerfectInfoCell";
}

-(void)setInfoWithDict:(NSDictionary *)dict
{
    DLog(@"dic-=%@",dict);
    self.titleStr    = [dict safeObjectForKey:@"title"];
    self.subTitleStr = [dict safeObjectForKey:@"subTitle"];
    self.minValue = [[dict safeObjectForKey:@"min"]intValue];
    self.maxValue = [[dict safeObjectForKey:@"max"]intValue];
    self.selectedValue = [[dict safeObjectForKey:@"select"]intValue];

}

@end
