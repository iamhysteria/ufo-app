//
//  PAJBlogsViewController.m
//  ufonews
//
//  Created by peder jonsson on 2012-10-31.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import "PAJBlogsViewController.h"
#import "RootViewController.h"


@interface PAJBlogsViewController ()
{
    
    
    
}

@end

@implementation PAJBlogsViewController
@synthesize tableView = _tableView;



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    listOfTitles = [[NSMutableArray alloc] initWithObjects: @"Dr. Greer's Blog",@"De Void",@"BUFOG",@"Canada UFO",@"lightsinthetexassky",nil];
    listOfSubTitles = [[NSMutableArray alloc] initWithObjects:@"Steven M. Greer, MD is Founder of The Disclosure Project",@"by Billy Cox, journalist at Herald Tribune newspaper in Sarasota Florida, USA",@"Birmingham UFO Group",@"Brian Vike posts sightings from Canada.",@"by Sunny Williams, a retired professional photographer from Breckenridge Texas, USA",nil];
    listOfUrls = [[NSMutableArray alloc] initWithObjects: @"http://drgreersblog.disclosureproject.org/?feed=rss2",@"http://devoid.blogs.heraldtribune.com/feed/",@"http://bufognavigation.blogspot.com/feeds/posts/default?alt=rss",@"http://canadaufo.blogspot.com/feeds/posts/default?alt=rss",@"http://lightsinthetexassky.blogspot.com/feeds/posts/default?alt=rss", nil];
    
    //[NSArray arrayWithObjects:@"Sunday", @"MonDay", @"TuesDay", @"WednesDay", @"ThusDay", @"FriDay", @"SaturDay",  nil];
	// Do any additional setup after loading the view, typically from a nib.
    // img = [[UIImageView alloc]init];
    /* img.animationImages=[NSArray arrayWithObjects:[UIImage imageNamed:@"ad1.png"],[UIImage imageNamed:@"ad2.png"],nil];
     img.animationDuration = 5.0;
     img.animationRepeatCount = 0;
     
     [img startAnimating];*/
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier3";
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
    controller.isBlog = YES;
    
    
    
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