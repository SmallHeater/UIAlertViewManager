//
//  ViewController.m
//  UIAlertViewManager
//
//  Created by xianjunwang on 2017/8/21.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertViewManagerLibrary.h"


@interface ViewController ()<UIAlertViewDelegate,UIActionSheetDelegate>{
    NSUInteger alertNumber;
    NSUInteger actionNumber;
    NSUInteger viewNumber;
}
@end

@implementation ViewController

#pragma mark  ----  生命周期函数
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    alertNumber = 0;
    actionNumber = 0;
    viewNumber = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark  ----  自定义函数
- (IBAction)addAlert:(id)sender {
    
    NSString * title = [[NSString alloc] initWithFormat:@"第%ld个alert",(long)alertNumber];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:@"弹出alert了呀" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [UIAlertViewManagerLibrary addShowView:alert];
    alertNumber++;
}

- (IBAction)addAction:(id)sender {
    
    NSString * title = [[NSString alloc] initWithFormat:@"第%ld个action",(long)actionNumber];
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"选项一" otherButtonTitles:@"选项二", nil];
    [UIAlertViewManagerLibrary addShowView:actionSheet];
    actionNumber++;
}

- (IBAction)addView:(id)sender {
    
    NSString * title = [[NSString alloc] initWithFormat:@"第%ld个view",(long)viewNumber];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
}


#pragma mark  ----  代理
#pragma mark  ----  UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [UIAlertViewManagerLibrary deleShowView:alertView];
}


#pragma mark  ----  UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [UIAlertViewManagerLibrary deleShowView:actionSheet];
}
@end
