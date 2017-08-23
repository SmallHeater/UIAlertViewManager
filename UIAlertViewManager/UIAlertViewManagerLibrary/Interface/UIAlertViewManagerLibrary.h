//
//  UIAlertViewManagerLibrary.h
//  UIAlertViewManagerLibrary
//
//  Created by xianjunwang on 2017/8/21.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//  接口类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define DELAYTIMEINTERVAL 0.5//组件内部弹出view的延时，经测试，最少需要0.5秒才可以
@interface UIAlertViewManagerLibrary : NSObject
//将需要弹出展示的view给管理类(可接收 UIView,UIAlertView,UIActionSheet,UIAlertController类型)
+(void)addShowView:(id)showView;
//将已隐藏的view从管理类中移除
+(void)deleShowView:(id)showView;
@end
