//
//  UIAlertViewManagerLibrary.m
//  UIAlertViewManagerLibrary
//
//  Created by xianjunwang on 2017/8/21.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//

#import "UIAlertViewManagerLibrary.h"
#import <UIKit/UIKit.h>
#import "UIAlertViewManager.h"


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
    if (showView && ([showView isKindOfClass:[UIView class]] || [showView isKindOfClass:[UIAlertView  class]] || [showView isKindOfClass:[UIAlertController class]] || [showView isKindOfClass:[UINavigationController class]] || [showView isKindOfClass:[UIViewController class]]))
    {
        [[UIAlertViewManagerLibrary sharedManager].manager addView:showView];
    }
}

#pragma mark  ----  将已隐藏的view从管理类中移除
+(void)deleShowView:(id)showView{
    if (showView && ([showView isKindOfClass:[UIView class]] || [showView isKindOfClass:[UIAlertView  class]] || [showView isKindOfClass:[UIAlertController class]] || [showView isKindOfClass:[UINavigationController class]] || [showView isKindOfClass:[UIViewController class]]))
    {
        [[UIAlertViewManagerLibrary sharedManager].manager deleteView:showView];
    }
}


#pragma mark  ----  创建一个系统的UIAlertController，并扔给管理类，target不传，则不显示按钮,action不传，则不显示对应的按钮(IOS 8一下，不可用该方法)
+(void)createUIAlertControllerWithTitle:(NSString *)title andContent:(NSString *)content andTarget:(id)target andCancaleButtonSEL:(SEL)cancleAction andagreeButtonSEL:(SEL)agreeAction{
    NSString * titleString = [UIAlertViewManagerLibrary getString:title];
    NSString * contentString = [UIAlertViewManagerLibrary getString:content];
    
    BOOL isShowCancleButton;
    if (cancleAction && target)
    {
        isShowCancleButton = YES;
    }
    
    BOOL isShowAgreeButton;
    if (agreeAction && target)
    {
        isShowAgreeButton = YES;
    }
    
#ifdef __IPHONE_8_0
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:titleString message:contentString preferredStyle:UIAlertControllerStyleAlert];
    if (isShowCancleButton)
    {
        UIAlertAction * cancleAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *  action) {
            
            if ([target respondsToSelector:cancleAction])
            {
                [target performSelector:cancleAction];
            }
            [UIAlertViewManagerLibrary deleShowView:alertController];
        }];
        [alertController addAction:cancleAlertAction];
    }
    
    if (isShowAgreeButton)
    {
        UIAlertAction * agreeAlertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
            
            if ([target respondsToSelector:agreeAction])
            {
                [target performSelector:agreeAction];
            }
            
            [UIAlertViewManagerLibrary deleShowView:alertController];
        }];
        [alertController addAction:agreeAlertAction];
    }
    [UIAlertViewManagerLibrary addShowView:alertController];
#else
    NSLog(@"IOS 8以下 创建自定义view有问题，点击事件无法和alertView绑定");
#endif
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
