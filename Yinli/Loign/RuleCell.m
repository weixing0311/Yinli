//
//  RuleCell.m
//  Yinli
//
//  Created by iOSdeveloper on 2017/11/9.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "RuleCell.h"

@implementation RuleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.ruleImgView = [[UIImageView alloc]init];
    self.ruleImgView.frame = CGRectMake(0, 0, 880, 61);
    self.scrollerView.contentSize = CGSizeMake(880, 0);
    [self.scrollerView addSubview:self.ruleImgView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
