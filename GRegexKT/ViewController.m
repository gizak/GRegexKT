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


- (void)viewDidLoad
{
    [super viewDidLoad];
    //OTStoreSrc
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"load ViewController");
    self.pickerContent=[[NSArray alloc] initWithObjects:@"default",@"In0",@"In1",@"In2",nil];
}

- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [self setPickerView:nil];
    [self setBarButton:nil];
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
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"call searchBarTextDidEndEditing");
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)srchBar{
    NSLog(@"call searchBarSearchButtonClicked");
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
@end
