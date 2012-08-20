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
@synthesize OTRegexIN;
@synthesize OTSwitchSrc;
@synthesize OTStoreSrc;


- (void)viewDidLoad
{
    [super viewDidLoad];
    //OTStoreSrc
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"view Load");
}

- (void)viewDidUnload
{
    [self setOTRegexIN:nil];
    [self setOTSwitchSrc:nil];
    [self setOTStoreSrc:nil];
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

- (IBAction)doSwitch:(id)sender {
    NSLog(@"trigger");
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    NSLog(@"call searchBarShouldEndEditing");
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"call searchBarTextDidEndEditing");
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"call searchBarSearchButtonClicked");
    [searchBar resignFirstResponder];
    
}
@end
