//
//  TJStyleCell.m
//  Yinli
//
//  Created by iOSdeveloper on 2018/1/8.
//  Copyright © 2018年 -call Me WeiXing. All rights reserved.
//

#import "TJStyleCell.h"

@implementation TJStyleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = HEXCOLOR(0xeeeeee);
    }
    return self;
}

-(void)buildButtonWithCount:(int)count imageName:(NSString *)name
{
    for (int i=0; i<count; i++) {
        UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(10+i*(JFA_SCREEN_WIDTH-50)/4, ((int)i/4+1)*(JFA_SCREEN_WIDTH-50)/4, (JFA_SCREEN_WIDTH-50)/4, (JFA_SCREEN_WIDTH-50)/4)];
        NSString *imageName = [NSString stringWithFormat:@"%@%d_",name,i+1];
        [button setBackgroundImage:getImage(imageName) forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        
        
        
        
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
