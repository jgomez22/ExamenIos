//
//  ViewController.m
//  Examen1
//
//  Created by Josue on 12/7/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "ViewController.h"
#import "AutorTableViewCell.h"
#import "ListUserViewController.h"
#import "TCSAuthor.h"


@interface ViewController ()

@property(nonatomic,strong) NSString*code;//@"value"
//@property(nonatomic,strong) NSString*title;//@value
@property(nonatomic,strong) NSString*date;
@property(nonatomic,strong) NSString*startTime;
@property(nonatomic,strong) NSString*endTime;
@property(nonatomic,strong) NSString*address;
@property(nonatomic,strong) NSString*created_at;
@property(nonatomic,strong) NSString*modify_at;




@end

@implementation ViewController{
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton*btnLogin = [[UIButton alloc] init];
    [btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    [btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btnLogin setBackgroundColor:[UIColor orangeColor]];
    [btnLogin setFrame:CGRectMake((self.view.frame.size.width-80)/2, 100, 80, 40)];
    
    [self.view addSubview:btnLogin];
    
    
    

    
    
}

- (IBAction)addTaskAsync:(id)sender {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadTableView:) name:@"GetListAuthor" object:nil];
    [self RequestListTicket];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

//KVO o Patron Observer
-(void)loadTableView:(NSNotification*)notification{
    NSArray*listAuthors= (NSArray*)[notification object];
    ListUserViewController*listView = [[ListUserViewController alloc] init];
    [listView setListAutors:listAuthors];
    [self presentViewController:listView animated:true completion:nil];
}
- (void)RequestListTicket{
    NSURL*urlTicket = [NSURL URLWithString:@"https://api.myjson.com/bins/tp1am"];
    NSMutableURLRequest*request = [NSMutableURLRequest requestWithURL:urlTicket
                                                          cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *postdataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
    
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (error==nil){
            if([httpResponse statusCode] == 200){
                
                NSDictionary*dictFromdata=[NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingAllowFragments error:&error];
                NSArray*listAuthors = (NSArray*)dictFromdata;
                NSMutableArray*sendListAuthor = [[NSMutableArray alloc] init];
                for (NSDictionary*autorDictionary in listAuthors) {
                    TCSAuthor*newAuthor = [[TCSAuthor alloc] init];
                    [newAuthor initWithDictionary:autorDictionary];
                    [sendListAuthor addObject: newAuthor];
                
            }
                dispatch_async(dispatch_get_main_queue(),^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"GetListAuthor" object:sendListAuthor];
        });
            }
        }
                
    }];
    [postdataTask resume];
    
}


@end
