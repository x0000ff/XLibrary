//
//  MainVC.m
//  XLibDemo
//
//  Created by Konstantin Portnov on 11/3/13.
//  Copyright (c) 2013 FLC Team. All rights reserved.
//

//################################################################################
#import "MainVC.h"

//################################################################################
@interface MainVC ()

- (IBAction)doLoadSomething:(id)sender;

@end

//################################################################################
@implementation MainVC

//################################################################################
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//################################################################################
- (IBAction)doLoadSomething:(id)sender
{
    LoadingButton * btn = (LoadingButton *)sender;
    
    [btn setTitle:@"Loading" forState:UIControlStateNormal];
    [btn showLoaderWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [btn performBlock:^(NSObject *blockOwner) {
        LoadingButton * loadingButton = (LoadingButton *)blockOwner;
        [loadingButton hideLoader];
        [btn setTitle:@"Load" forState:UIControlStateNormal];
    } afterDelay:3];
}

//################################################################################
@end
//################################################################################
