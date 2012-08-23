//
//  ViewController.h
//  GRegexKT
//
//  Created by Do'Urden Gizak on 12-8-18.
//  Copyright (c) 2012年 Do'Urden Gizak. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "RegexProc.h"

@interface ViewController : UIViewController<UISearchBarDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (copy, nonatomic) NSString *userInput;
@property (strong,nonatomic) NSArray *pickerContent;
@property (strong,nonatomic) NSString *htmlTemplate;
@property (strong,nonatomic) NSString *textCurrentFile;
@property (strong,nonatomic) NSURL *baseUri;
@property (strong,nonatomic) NSString *fileName;
@property RegexProc *re;
- (IBAction)doSwitchFile:(id)sender;
- (void)apply;
- (NSString*)embedInTemplate:(NSString*)inner;
- (void) loadSegFile:(NSString*)fn;
@end
