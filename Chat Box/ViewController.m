//
//  ViewController.m
//  Chat Box
//
//  Created by Harish Singh on 08/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "ViewController.h"
#import "KeyboardAnimation.h"
#import "CustomTableViewCell.h"

@interface ViewController () {
    NSString *message;
    NSMutableArray *messageList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dark-wood-image.jpg"]];
    messageList = [[ NSMutableArray alloc] init];    
    [_chatBoxTableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_chatBoxTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"CustomTableViewCell"];

    _chatBoxTableView.estimatedRowHeight = 44.0;
    _chatBoxTableView.rowHeight = UITableViewAutomaticDimension;
    _chatBoxTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _chatBoxTableView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dark-wood-image.jpg"]];
}

- (IBAction)textBoxEditingDidBegin:(id)sender {
    
    [ KeyboardAnimation textFieldDidBeginEditing:_textFieldMessage inView:self];
}

- (IBAction)textBoxEditingDidEnd:(id)sender {
    [KeyboardAnimation textFieldDidEndEditing:_textFieldMessage inView:self];
}

- (IBAction)buttonToSendMessage:(id)sender {
    
    [_textFieldMessage resignFirstResponder];
    message = _textFieldMessage.text;
    [self addMessageToArray:message];
    NSLog(@"%@", message);
    _textFieldMessage.text = @"";
    
   
    
    [_chatBoxTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messageList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    
    NSLog(@"Message is %@", messageList[0]);
    cell.textLabel.text = [messageList objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithWhite:1.5 alpha:1];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(void)addMessageToArray : (NSString *)messageRecieved {
    
    [messageList addObject:messageRecieved];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
