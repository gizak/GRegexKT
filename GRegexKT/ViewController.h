//
//  ViewController.h
//  GRegexKT
//
//  Created by Do'Urden Gizak on 12-8-18.
//  Copyright (c) 2012年 Do'Urden Gizak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (copy, nonatomic) NSString *userInput;
//@property RegexProc *re;

@property (strong,nonatomic) NSArray *pickerContent;
- (IBAction)doSwitchFile:(id)sender;

@end
