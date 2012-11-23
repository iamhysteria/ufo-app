//
//  AXLBannerView.m
//  People
//
//  Created by Axel Lundbäck on 2012-10-30.
//
//

#import "AXLBannerView.h"
#import "SBJson.h"


@implementation AXLBannerView {
    float timerDelay;
    NSString *bannerExeption;
    BOOL animates;
}

@synthesize imageView = _imageView;
@synthesize header = _header;
@synthesize back = _back, description = _description;

-(id)initWithAnimationUp:(BOOL)up delay:(float)delay exeption:(NSString *)exeption andRect:(CGRect)rect {
    self = [super init];
    
    if (self) {
        animates = up;
        
        timerDelay = delay;
        bannerExeption = exeption;
        self.frame = rect;
        NSLog(@"is it up %d", up);
        [self loadImage];
    }
    return self;
}
-(void)loadImage {
    
    count = 0;
    self.back = [[UIView alloc] initWithFrame:self.frame];
    
    [self addSubview:self.back];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, 46, 46)];
    self.imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imageView.layer.borderWidth = 1;
    self.imageView.backgroundColor = [UIColor whiteColor];
    CALayer * l = [self.imageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:10.0];
    
    UIImageView *downloadImg = [[UIImageView alloc] initWithFrame:CGRectMake(272, 2, 46, 46)];
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.iandwe.se/bannerImages/Download-icon@2x.png"]];
    
    downloadImg.image = [UIImage imageWithData:imgData];
    [self.back addSubview:downloadImg];
   
    self.header = [[UILabel alloc] initWithFrame:CGRectMake(55, 2, 220, 20)];
    self.header.textColor = [UIColor whiteColor];
    self.header.backgroundColor = [UIColor clearColor];
    self.header.font = [UIFont fontWithName:@"Arial-Bold" size:15];

    
    self.description = [[UILabel alloc] initWithFrame:CGRectMake(55, 25, 220, 25)];
    self.description.textColor = [UIColor whiteColor];
    self.description.backgroundColor = [UIColor clearColor];
    self.description.numberOfLines = 0;
    self.description.font = [UIFont fontWithName:@"Arial" size:10];
    
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedBanner)];
    [self addGestureRecognizer:tap];
    
    
    [self startJsonRequest];
   
}
-(void)startJsonRequest {
    self.back.backgroundColor = [UIColor clearColor];
    images = [[NSMutableArray alloc] init];
    headers =[[NSMutableArray alloc] init];
    descriptions =[[NSMutableArray alloc] init];
    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"banners" ofType:@"json"];
    NSString *jsonStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.iandwe.se/banners_international.json"] encoding:NSUTF8StringEncoding error:nil];
    
    SBJsonParser *json = [SBJsonParser new];
    jsonDict = [json objectWithString:jsonStr];
    
    
    for (int i = 0; i<[[jsonDict valueForKey:@"banners"] count]; i++) {
        
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[[jsonDict valueForKey:@"banners"] valueForKey:@"image_url"]objectAtIndex:i]]];
        UIImage *image = [UIImage imageWithData:imgData];
        NSString *headerText = [[[jsonDict valueForKey:@"banners"] valueForKey:@"app_name"]objectAtIndex:i];
        NSString *descText = [[[jsonDict valueForKey:@"banners"] valueForKey:@"description"]objectAtIndex:i];
        
        if (![headerText isEqualToString:bannerExeption]) {
            
            [descriptions addObject:descText];
            [images addObject:image];
            [headers addObject:headerText];
        }
    }

  
    
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:timerDelay target:self selector:@selector(fadeInImage) userInfo:nil repeats:YES];
    [timer fire];
    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:timerDelay target:self selector:@selector(fadeOutImage) userInfo:nil repeats:YES];
    [timer2 fire];
    
    [self.back addSubview:self.imageView];
    [self.back addSubview:self.header];
    [self.back addSubview:self.description];
    [self setAnimatesUp:animates];
}
- (void)fadeInImage {

    //[UIView beginAnimations:nil context:NULL];
    //[UIView setAnimationDuration:0.8f];
    
    self.back.alpha = 0.0f;
                       
}
-(void)setAnimatesUp:(BOOL)animatesUp {
    CGRect frame = self.frame;
    if (animatesUp) {
        frame.origin.y = 460;
        self.frame = frame;
        /*[UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:3.0];
        [UIView setAnimationDuration:0.8f];*/
        frame.origin.y = 410;
        self.frame = frame;
    }
    else {
        frame.origin.y = -50;
        self.frame = frame;
        /*[UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:3.0];
        [UIView setAnimationDuration:0.8f];*/
        frame.origin.y = 0;
        self.frame = frame;
    }
    
    
}
- (void)fadeOutImage {
    self.header.text = [headers objectAtIndex:count];
    self.description.text = [descriptions objectAtIndex:count];
    self.imageView.image = [images objectAtIndex:count];
    url = [NSURL URLWithString:[[[jsonDict valueForKey:@"banners"] valueForKey:@"appstore_link"]objectAtIndex:count]];
    
    //[UIView beginAnimations:nil context:NULL];
    //[UIView setAnimationDuration:0.8f];
    self.back.alpha = 1.0f;
    
    if (count < [images count]-1) {
    count ++;
    }
    else {
        count = 0;
        
        
    }
  
}


-(void)tappedBanner {

    [[UIApplication sharedApplication] openURL:url];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 1.0, 0.35,  // Start color
        1.0, 1.0, 1.0, 0.06 }; // End color
    
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
    
    CGRect currentBounds = self.back.bounds;
    CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
    CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
    CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, midCenter, 0);
    
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);
}


@end
