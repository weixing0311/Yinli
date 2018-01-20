//
//  RuleCell.h
//  Yinli
//
//  Created by iOSdeveloper on 2017/11/9.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RuleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titlelb;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;
@property (weak, nonatomic) IBOutlet UILabel *resultlb;
@property (strong, nonatomic)  UIImageView *ruleImgView;

@end
