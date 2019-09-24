//
//  AleteViewController.m
//  Alete
//
//  Created by 1041497818@qq.com on 07/16/2019.
//  Copyright (c) 2019 1041497818@qq.com. All rights reserved.
//

#import "AleteViewController.h"
#import <Alete/UIView+Function.h>
@interface AleteViewController ()

@end

@implementation AleteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
 
}

- (IBAction)functionAction:(id)sender {
    
    [self.view.vcc.title(@"问题").action(@"1", ^(id item) {
        NSLog(@"---%@",item);
    }).action(@"2", ^(id item) {
        NSLog(@"---%@",item);
    }).action(@"3", ^(id item) {
        NSLog(@"---%@",item);
    }) show];
   
}

- (IBAction)shareFuncAction:(id)sender {
    
    [self.view.alete.title(@"问题").function(@"111", @"lt_faxian1", 1, ^(id item) {
        
    }).function(@"123", @"lt_faxian1", 1, ^(id item) {
        
    }).function(@"4321",@"lt_faxian1",1,^(id item) {
        
    }) show];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
