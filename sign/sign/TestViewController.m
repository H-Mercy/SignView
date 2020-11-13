//
//  TestViewController.m
//  sign
//
//  Created by rockfintech on 2020/11/13.
//  Copyright © 2020 Gzedu. All rights reserved.
//

#import "TestViewController.h"
#import "LJsignView.h"
@interface TestViewController ()<LJsignViewDelegate>
@property (strong, nonatomic)  UIImageView *image;
@property (nonatomic,strong)LJsignView *signView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self forceToOrientation:UIDeviceOrientationLandscapeRight];

    self.view.backgroundColor = [UIColor whiteColor];
    _signView = [[LJsignView alloc]init];
    [self.view addSubview:_signView];
    _signView.frame = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width-100);
    _signView.backgroundColor = [UIColor lightGrayColor];
    _signView.delegate = self;
    
    //添加重置和下一步
    UIButton * clickBrn = [[UIButton alloc]init];
    [clickBrn setTitle:@"重置" forState:UIControlStateNormal];
    [clickBrn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clickBrn.frame = CGRectMake(100, self.view.bounds.size.width-150, 50, 30);
    [self.view addSubview:clickBrn];
    [clickBrn addTarget:self action:@selector(clickResignBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    _image = [[UIImageView alloc]init];
    _image.frame = CGRectMake(600,  self.view.bounds.size.width-90, 100,80);
    _image.backgroundColor = [UIColor redColor];
    [self.view addSubview:_image];
  
}
- (void)LJsignViewDelegateWithImage:(UIImage *)image{
    self.image.image = image;
}
- (void)clickResignBtn:(UIButton *)sender {
    [_signView clearSignature];
    
    self.image.image = nil;
}


#pragma  设置默认横屏
//页面需要的横屏方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

//页面支持屏幕横屏的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}

// 改变页面屏幕方向的方法
- (void)forceToOrientation:(UIDeviceOrientation)orientation
{
    NSNumber *orientationUnknown = [NSNumber numberWithInt:0];
    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];

    NSNumber *orientationTarget = [NSNumber numberWithInt:orientation];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
