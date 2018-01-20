//
//  UserModel.h
//  Yinli
//
//  Created by iOSdeveloper on 2017/9/25.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
+(UserModel *)shareInstance;



@property(nonatomic,copy) NSString * access_token;

@property (nonatomic,copy) NSString * token;
@property (nonatomic,copy) NSString * userId;


-(void)setInfoWithDic:(NSDictionary *)dict;

-(id)getXibCellWithTitle:(NSString *)title;
-(void)showSuccessWithStatus:(NSString *)status;
-(void)showErrorWithStatus:(NSString *)status;
-(void)showInfoWithStatus:(NSString *)status;
-(void)dismiss;

@end
