//
//  PAJFirstViewController.m
//  Bilkoll
//
//  Created by peder jonsson on 2012-10-03.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import "PAJFirstViewController.h"
#import "RootViewController.h"


@interface PAJFirstViewController ()
{
    
    
    
}

@end

@implementation PAJFirstViewController
@synthesize tableView = _tableView;



- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar_middle.png"]];
    [self.tabBarController.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"tabBar_middle_selected.png"]];
    
    for (UITabBarItem *item in self.tabBarController.tabBar.items) {
        [item setTitlePositionAdjustment:UIOffsetMake(0, -10)];
        }
    
   

    
    listOfTitles = [[NSMutableArray alloc] initWithObjects: @"Openminds.tv",@"UFO Digest",@"UFO Magazine (US)",@"Dr. Greer's Blog",@"De Void",@"BUFOG",@"Canada UFO",@"lightsinthetexassky",@"UK UFO Sightings",@"UFO stalker",@"National UFO Examiner",@"Paranormal Old Pueblo",@"thenightshirt.com",@"Kevinsmithshow.com",@"Inception Radio Network",@"Disclosur3",nil];
    listOfSubTitles = [[NSMutableArray alloc] initWithObjects:@"media company focused on UFOs. They operate a website, a magazine, a radio show and a television show.",@"by Dirk Vander Ploeg, offers UFO and Paranormal news from around the world",@"by Bill and Nancy Birnes",@"Steven M. Greer, MD is Founder of The Disclosure Project",@"by Billy Cox, journalist at Herald Tribune newspaper in Sarasota Florida, USA",@"Birmingham UFO Group",@"Brian Vike posts sightings from Canada.",@"by Sunny Williams, a retired professional photographer from Breckenridge Texas, USA",@"by Andy Mannion, posts UFO sighting reports as submitted by the public in Britain",@"UFO Stalker automatically posts UFO reports submitted via MUFON Case Management System (MUFON CMS), and plots them onto GoogleMaps (note: MUFON is the largest civilian UFO group in North America)",@"Roger Marsh's feed",@"by Cherlyn Gardner Strong from Tucson Arizona USA",@"by Eric Wargo from Washington, DC USA.",@"KSS News",@"with Jamie Havican, also streaming Jerry Pippin, The UFO Traffic Report, The Joiner Report and others",@"As always you decide",nil];
    listOfUrls = [[NSMutableArray alloc] initWithObjects: @"http://www.openminds.tv/feed/",@"http://www.ufodigest.com/rss.xml",@"http://ufomagazine.squarespace.com/ufo-magazine/rss.xml",@"http://drgreersblog.disclosureproject.org/?feed=rss2",@"http://devoid.blogs.heraldtribune.com/feed/",@"http://bufognavigation.blogspot.com/feeds/posts/default?alt=rss",@"http://canadaufo.blogspot.com/feeds/posts/default?alt=rss",@"http://lightsinthetexassky.blogspot.com/feeds/posts/default?alt=rss",@"http://www.uk-ufo.co.uk/feed/",@"http://feeds2.feedburner.com/ufostalker",@"http://www.examiner.com/user/1565231/1872696/feed",@"http://paranormaloldpueblo.com/feed/",@"http://thenightshirt.com/?feed=rss2",@"http://kevinsmithshow.com/kssnews/kssnews.xml",@"http://inceptionradionetwork.com/feed/",@"http://www.disclosur3.com/index.php?PHPSESSID=kgci2u2tfjrubi66pae4k8r281&type=rss;action=.xml", nil];
    
       //[NSArray arrayWithObjects:@"Sunday", @"MonDay", @"TuesDay", @"WednesDay", @"ThusDay", @"FriDay", @"SaturDay",  nil];
	// Do any additional setup after loading the view, typically from a nib.
    // img = [[UIImageView alloc]init];
    /* img.animationImages=[NSArray arrayWithObjects:[UIImage imageNamed:@"ad1.png"],[UIImage imageNamed:@"ad2.png"],nil];
     img.animationDuration = 5.0;
     img.animationRepeatCount = 0;
     
     [img startAnimating];*/
    
}

-(void)viewDidAppear:(BOOL)animated
{
   /* if(banner == nil && showingAd == NO)
    {
        banner = [[AXLBannerView alloc] initWithAnimationUp:NO delay:12.0f exeption:@"UFO Media Collector" andRect:CGRectMake(0, 44, 320, 50)];
        [self.view addSubview:banner];
        showingAd = YES;
    }
    */
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier2";
    UITableViewCell *cell;
	
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
        cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        // Set up the cell
        int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
		//cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
        UILabel *title = (UILabel *)[cell viewWithTag:12];
        UILabel *ingressLabel = (UILabel *)[cell viewWithTag:13];
        //      NSLog(@"searching");
       
            title.text =[listOfTitles objectAtIndex: storyIndex];
            ingressLabel.text =[listOfSubTitles objectAtIndex: storyIndex];
        
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 68)];
        av.backgroundColor = [UIColor clearColor];
        av.opaque = NO;
        av.image = [UIImage imageNamed:@"ufonewsCell.png"];
        cell.backgroundView = av;
            
       
        // [cell setText:[[stories objectAtIndex: storyIndex] objectForKey: @"title"]];
	}
	
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@"ska seguea");
    // shoFlow *aBarber = [myBarbers objectAtIndex:self.myTableView.indexPathForSelectedRow.row];
    //  del.isBackFromDetail = YES;
    RootViewController *controller = (RootViewController*)[segue destinationViewController];
    NSString *url;
    NSString *titleToSend;
    
        url = [listOfUrls objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        titleToSend = [listOfTitles objectAtIndex:self.tableView.indexPathForSelectedRow.row];
   
    controller.aTitle = titleToSend;
    controller.urlToFetch = url;
    controller.isBlog = NO;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
        return [listOfTitles count];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
        
    [super viewDidUnload];
}

@end
