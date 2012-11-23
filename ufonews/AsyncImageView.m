//
//  AsyncImageView.m
//  frisorappen
//
//  Created by Axel Lundbäck on 2012-08-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AsyncImageView.h"
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>

@implementation AsyncImageView

- (void)loadImageFromURL:(NSURL*)url {
    [MBProgressHUD showHUDAddedTo:self animated:YES];

  
    NSURLRequest* request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:60.0];
    
    connection = [[NSURLConnection alloc]
                  initWithRequest:request delegate:self];
    //TODO error handling, what if connection is nil?
}

- (void)connection:(NSURLConnection *)theConnection
    didReceiveData:(NSData *)incrementalData {
    if (data==nil) {
        data =
        [[NSMutableData alloc] initWithCapacity:2048];
    }
    [data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
    
    connection=nil;
    
    if ([[self subviews] count]>0) {
        [[[self subviews] objectAtIndex:0] removeFromSuperview];
    }
    UIImageView* imageView = nil;
    UIImage *image = [UIImage imageWithData:data];
   

    imageView = [[UIImageView alloc] initWithImage:image];
    
    
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    
    imageView.alpha = 0.0f;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    [self addSubview:imageView];
    imageView.alpha = 1.0f;
    
    [UIView commitAnimations];

    imageView.frame = self.bounds;
    [imageView setNeedsLayout];
    [self setNeedsLayout];

    data=nil;
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (UIImage*) image {
    UIImageView* iv = [[self subviews] objectAtIndex:0];
    return [iv image];
}



@end
