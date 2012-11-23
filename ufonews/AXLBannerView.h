//
//  AXLBannerView.h
//  People
//
//  Created by Axel Lundbäck on 2012-10-30.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface AXLBannerView : UIView<UIApplicationDelegate> {
    NSMutableArray *images;
    NSMutableArray *headers;
    NSMutableArray *descriptions;
    UIImage *currentImage;
    NSDictionary *jsonDict;
    UIActivityIndicatorView *activityIndicator;
    UITapGestureRecognizer *tap;
    int count;
    NSURL *url;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *header;
@property (nonatomic, strong) UILabel *description;
@property (nonatomic, strong) UIView *back;
-(void)loadImage;
-(void)start;
-(void)stop;

-(id)initWithAnimationUp:(BOOL)up delay:(float)delay exeption:(NSString*)exeption andRect:(CGRect)rect;
@end
