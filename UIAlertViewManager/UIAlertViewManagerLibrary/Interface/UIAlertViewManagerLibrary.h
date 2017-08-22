//
//  UIAlertViewManagerLibrary.h
//  UIAlertViewManagerLibrary
//
//  Created by xianjunwang on 2017/8/21.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//  接口类

#import <Foundation/Foundation.h>

#define DELAYTIMEINTERVAL 0.5//组件内部弹出view的延时，经测试，最少需要0.5秒才可以
@interface UIAlertViewManagerLibrary : NSObject
//将需要弹出展示的view给管理类(可接收 UIView,UIAlertView,UIAlertController,UIViewController类型)
+(void)addShowView:(id)showView;
//将已隐藏的view从管理类中移除
+(void)deleShowView:(id)showView;
//创建一个系统的UIAlertController，并扔给管理类，target不传，则不显示按钮,action不传，则不显示对应的按钮(IOS 8一下，不可用该方法)
+(void)createUIAlertControllerWithTitle:(NSString *)title andContent:(NSString *)content andTarget:(id)target andCancaleButtonSEL:(SEL)cancleAction andagreeButtonSEL:(SEL)agreeAction;
@end
