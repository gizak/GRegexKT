//
//  ViewController.m
//  GRegexKT
//
//  Created by Do'Urden Gizak on 12-8-18.
//  Copyright (c) 2012年 Do'Urden Gizak. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize searchBar;
@synthesize barButton;
@synthesize pickerView;
@synthesize webView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"load ViewController");
    self.re=new RegexProc();
    
    self.pickerContent=[[NSArray alloc] initWithObjects:@"default",@"In0",@"In1",@"In2",nil];
    
    //[NSURL URLWithString:@"http://127.0.0.1"]
    NSURL *uri=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"] isDirectory:NO];
    
    self.htmlTemplate=[NSString stringWithContentsOfURL:uri encoding:NSUTF8StringEncoding error:nil];
    self.baseUri=[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];

    //NSLog(@"load ->%@",newHtml);
    [self loadSegFile:@"test.extjs"];
    [self.webView loadHTMLString:[self embedInTemplate:self.textCurrentFile] baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}

- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [self setPickerView:nil];
    [self setBarButton:nil];
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)doSwitchFile:(id)sender {
    NSLog(@"trigger doSwitchFile %@",sender);
    barButton.style=pickerView.isHidden?UIBarButtonItemStyleDone:UIBarButtonItemStyleBordered;
    [pickerView setHidden:pickerView.isHidden?NO:YES];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    NSLog(@"call searchBarShouldEndEditing");
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)srchBar{
    NSLog(@"call searchBarTextDidEndEditing");
    self.userInput=srchBar.text;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)srchBar{
    NSLog(@"call searchBarSearchButtonClicked ->%@",srchBar.text);
    self.userInput=srchBar.text;
    [self apply];
    [srchBar endEditing:YES];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)srchBar{
    srchBar.text=self.userInput;
    [srchBar endEditing:YES];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSLog(@"call numberOfComponentsInPickerView");
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSLog(@"call numberOfRowsInComponent -> %u",[self.pickerContent count]);
    return [self.pickerContent count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSLog(@"call titleForRow -> \"%@\"",[self.pickerContent objectAtIndex:row]);
    return [self.pickerContent objectAtIndex:row];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"call shouldStartLoadWithRequest ->%@",request);
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webV{
    NSLog(@"call webViewDidStartLoad ->%@",webV);
}

-(void)apply{
    NSLog(@"input -> %s",self.userInput.UTF8String);
    self.re->setRegularExpression(self.userInput.UTF8String);
    self.re->loadText(self.textCurrentFile.UTF8String);
    self.re->wrap("<span class=\"re\">$0</span>","$0");
    self.re->dump();
    NSString *ns=[self embedInTemplate:[[NSString alloc] initWithUTF8String:self.re->getFormatText().c_str()]];
    [self.webView loadHTMLString:ns baseURL:self.baseUri];
}

-(NSString *)embedInTemplate:(NSString *)inner{
    self.re->loadText(inner.UTF8String);
    self.re->setRegularExpression("[\\s\\S]*");
    self.re->wrap(self.htmlTemplate.UTF8String,"$0");
    return [[NSString alloc] initWithUTF8String:self.re->getFormatText().c_str()];
}

-(void)loadSegFile:(NSString *)fn{
    self.fileName=fn;
    NSURL *uriSeg=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fn ofType:@"seg"] isDirectory:NO];
    self.textCurrentFile=[NSString stringWithContentsOfURL:uriSeg encoding:NSUTF8StringEncoding error:nil];
}
@end
