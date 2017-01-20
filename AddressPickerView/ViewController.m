//
//  ViewController.m
//  AddressPickerView
//
//  Created by rhcf_wujh on 16/7/14.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "ViewController.h"
#import "AddressPickerView.h"

#define SCREEN [UIScreen mainScreen].bounds.size

@interface ViewController ()<AddressPickerViewDelegate>

@property (nonatomic ,strong) AddressPickerView * pickerView;

@property (nonatomic ,strong) UIButton          * addressBtn;

@property (nonatomic ,strong) UILabel           * addressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.addressBtn];
    [self.view addSubview:self.addressLabel];
}

- (AddressPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [[AddressPickerView alloc]init];
        _pickerView.delegate = self;
        _pickerView.pickerMode = APPickerModeArea;
    }
    return _pickerView;
}

- (UIButton *)addressBtn{
    if (!_addressBtn) {
        _addressBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
        [_addressBtn setTitle:@"弹出地区选择器" forState:UIControlStateNormal];
        [_addressBtn setTitle:@"收回地区选择器" forState:UIControlStateSelected];
        [_addressBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _addressBtn.center = CGPointMake(self.addressLabel.center.x, self.addressLabel.center.y - 50);
    }
    return _addressBtn;
}

- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, 30)];
        _addressLabel.text = @"ready to select address";
        _addressLabel.textColor = [UIColor blackColor];
        _addressLabel.center = CGPointMake(SCREEN.width/2, SCREEN.height/2);
        _addressLabel.textAlignment = 1;
    }
    return _addressLabel;
}

- (void)btnClick:(UIButton *)btn{
    [self.pickerView show];
}

#pragma mark - AddressPickerViewDelegate 
- (void)cancelBtnClick{
    NSLog(@"点击了取消按钮");
}
- (void)sureBtnClickReturnProvince:(NSString *)province City:(NSString *)city Area:(NSString *)area{
    NSArray *address = @[province, city, area];
    self.addressLabel.text = [address componentsJoinedByString:@"-"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
