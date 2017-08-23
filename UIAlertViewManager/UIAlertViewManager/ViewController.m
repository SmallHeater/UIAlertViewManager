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

    view.backgroundColor = [UIColor grayColor];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 100, 40)];
    label.text = title;
    [view addSubview:label];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(60, 0, 40, 40);
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    [UIAlertViewManagerLibrary addShowView:view];
    viewNumber++;
}


- (IBAction)addAlertAndAction:(id)sender {
    [self addAlert:nil];
    [self addAction:nil];
    [self addAction:nil];
    [self addView:nil];
    [self addAlert:nil];
    [self addAlert:nil];
}

-(void)btnClicked:(UIButton *)btn{
    UIView * parentView = btn.superview;
    [UIAlertViewManagerLibrary deleShowView:parentView];
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
