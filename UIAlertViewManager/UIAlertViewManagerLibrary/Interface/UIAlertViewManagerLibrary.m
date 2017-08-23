//
//  UIAlertViewManagerLibrary.m
//  UIAlertViewManagerLibrary
//
//  Created by xianjunwang on 2017/8/21.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//

#import "UIAlertViewManagerLibrary.h"
#import "UIAlertViewManager.h"
#import "MBProgressHUD.h"

@interface UIAlertViewManagerLibrary ()
@property (nonatomic,strong) UIAlertViewManager * manager;
@end

@implementation UIAlertViewManagerLibrary


#pragma mark  ----  自定义函数
+(UIAlertViewManagerLibrary *)sharedManager{
    
    static UIAlertViewManagerLibrary * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UIAlertViewManagerLibrary alloc] init];
    });
    return manager;
}

#pragma mark  ----  将需要弹出展示的view给管理类(可接收 UIView,UIAlertView,UIAlertController,UIViewController类型)
+(void)addShowView:(id)showView{
    
    if (showView && ([showView isKindOfClass:[UIView class]] || [showView isKindOfClass:[UIAlertView  class]] || [showView isKindOfClass:[UIAlertController class]] || [showView isKindOfClass:[UIActionSheet class]])){
        
        [[UIAlertViewManagerLibrary sharedManager].manager addView:showView];
    }
    else{
    
        [MBProgressHUD displayHudError:@"不支持此种类型"];
    }
}

#pragma mark  ----  将已隐藏的view从管理类中移除
+(void)deleShowView:(id)showView{
    
    if (showView && ([showView isKindOfClass:[UIView class]] || [showView isKindOfClass:[UIAlertView  class]] || [showView isKindOfClass:[UIAlertController class]] || [showView isKindOfClass:[UIActionSheet class]])){
        
        [[UIAlertViewManagerLibrary sharedManager].manager deleteView:showView];
    }
    else{
    
        [MBProgressHUD displayHudError:@"不支持此种类型"];
    }
}

#pragma mark  ----  传入字符串，判空处理后传出
+(NSString *)getString:(NSString *)str
{
    NSString * titleString;
    if (str && str.length > 0)
    {
        titleString = @"";
    }
    else
    {
        titleString = str;
    }
    return titleString;
}


#pragma mark  ----  懒加载
-(UIAlertViewManager *)manager
{
    if (!_manager)
    {
        _manager = [[UIAlertViewManager alloc] init];
    }
    return _manager;
}
@end
