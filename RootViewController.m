//
//  RootViewController.m
//  TAB RSS reader
//
//  Created by Jason Terhorst on 7/28/08.
//  Copyright AstoundingCookie, LLC 2008. All rights reserved.
//

#import "RootViewController.h"
#import "PAJAppDelegate.h"
#import "PAJwebViewController.h"



@implementation RootViewController
@synthesize newsTable = _newsTable;
//@synthesize newTitlem;


- (void)viewDidLoad {
	// Add the following line if you want the list to be editable
	// self.navigationItem.leftBarButtonItem = self.editButtonItem;
  //  [activityIndicator];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.hidesWhenStopped = YES;
    activityIndicator.center = self.view.center;
    [activityIndicator startAnimating];
    [self.view addSubview:activityIndicator];
   /* linkArray = [[NSMutableArray alloc]init];
    for(int i = 0; i < [stories count]; i++)
    {
        NSString *storyLink = [[stories objectAtIndex: i] objectForKey: @"link"];
        storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
        storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
        [linkArray addObject:storyLink];
    }*/
    
   // NSString titlelToSet = @"%@",self.newTitle;
    //NSString * titletoset = self.newTitlem;
    self.title = self.aTitle;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [stories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell;
	
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
         cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        // Set up the cell
        int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
		//cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
        UILabel *title = (UILabel *)[cell viewWithTag:10];
        UILabel *ingressLabel = (UILabel *)[cell viewWithTag:11];
        //      NSLog(@"searching");
        title.text =[[stories objectAtIndex: storyIndex] objectForKey: @"title"];
        
        NSString *str = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
        NSString *newStr = [str substringWithRange:NSMakeRange(0, [str length]-([str length]-10))];
        ingressLabel.text = newStr;
        
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 68)];
        av.backgroundColor = [UIColor clearColor];
        av.opaque = NO;
        av.image = [UIImage imageNamed:@"ufonewsCell.png"];
        cell.backgroundView = av;
        
       // [cell setText:[[stories objectAtIndex: storyIndex] objectForKey: @"title"]];
	}
	
	return cell;
}


 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	 // Navigation logic
	 
	 int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	 
	 NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
     tempTitle = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	 
	 // clean up the link - get rid of spaces, returns, and tabs...
     storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
     storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
     storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
     tempUrl = storyLink;
	 
	 //NSLog(@"första url: %@", tempUrl);
	 // open in Safari
	// [[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
     NSString *segueidentifier;
     if(self.isBlog)
     {
         segueidentifier = @"hejweb3";
     }
     else
     {
         segueidentifier = @"hejweb2";
     }
     [self performSegueWithIdentifier:segueidentifier sender:self];
 
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"andra url: %@", tempUrl);
    //tempUrl = [linkArray objectAtIndex:self.newsTable.indexPathForSelectedRow.row];
    //RootViewController *controller = (RootViewController*)[segue destinationViewController];
    PAJwebViewController *controller = (PAJwebViewController*)[segue destinationViewController];
    controller.url = tempUrl;
    controller.aTitle = tempTitle;
   // [self.navigationController pushViewController:controller animated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	if ([stories count] == 0) {
        NSLog(@"nu ska hämta urltofetch: %@",self.urlToFetch);
		NSString * path = self.urlToFetch;
		[self parseXMLFileAtURL:path];
	}
	
	cellSize = CGSizeMake([self.newsTable bounds].size.width, 60);
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)viewDidDisappear:(BOOL)animated {
}




- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	NSLog(@"found file and started parsing");
	
}

- (void)parseXMLFileAtURL:(NSString *)URL
{	
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
       

        
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		//NSLog(@"adding story: %@", currentTitle);
       
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}
	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
	[self.newsTable reloadData];
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}





- (void)viewDidUnload {
    
    [self setNewsTable:nil];
    [super viewDidUnload];
}
@end

