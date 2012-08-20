//
//  ViewController.h
//  GRegexKT
//
//  Created by Do'Urden Gizak on 12-8-18.
//  Copyright (c) 2012年 Do'Urden Gizak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *OTRegexIN;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *OTSwitchSrc;
@property (weak, nonatomic) IBOutlet UIPickerView *OTStoreSrc;
@property (copy, nonatomic) NSString *userInput;

- (IBAction)doSwitch:(id)sender;

@end
