//
//  PerfectInfoModel.h
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/20.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "BaseCellModel.h"

@interface PerfectInfoModel : BaseCellModel
@property (nonatomic,copy)NSString * titleStr;
@property (nonatomic,copy)NSString * subTitleStr;

////-----标尺数据
///一个大格几个小格
@property (nonatomic,assign)int smallCount;
/// 最小值
@property (nonatomic,assign)int minValue;
/// 最大值
@property (nonatomic,assign)int maxValue;
/// 两个标记刻度之间相差大小
@property (nonatomic,assign)int valueStep;
///默认值
@property (nonatomic,assign)int selectedValue;


@end
