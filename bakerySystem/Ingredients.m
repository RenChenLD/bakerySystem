//
//  UITableViewController+Ingredient.m
//  bakerySystem
//
//  Created by 陈仁 on 11/23/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "Ingredients.h"
#import "Ingredient.h"
@implementation Ingredients
@synthesize recipeName;
-(void) viewDidLoad
{
    UIApplication *application = [UIApplication sharedApplication];
    id delegate = application.delegate;
    self.managedObjectContext = [delegate managedObjectContext];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    NSLog(@"RecipeTable");
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:NSStringFromClass([Ingredient class])];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    //把排序和分组规则添加到请求中
    [request setSortDescriptors:@[sortDescriptor]];
    
    //把请求的结果转换成适合tableView显示的数据
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"type" cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
    
    //执行fetchedResultsController
    NSError *error;
    if ([self.fetchedResultsController performFetch:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"addIngredient"])
    {
        UIViewController *nextView = segue.destinationViewController;
        [nextView setValue:recipeName forKey:@"type"];
    }
    if ([[segue identifier] isEqualToString:@"ingredientCellTap"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //用frc通过indexPath来获取Person
        Ingredient *ingredient = [self.fetchedResultsController objectAtIndexPath:indexPath];
        UIViewController *nextView = segue.destinationViewController;
        //通过KVC把参数传入目的控制器
        [nextView setValue:ingredient forKey:@"ingredient"];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ingredientCellTap" sender:indexPath];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //我们的数据中有多少个section, fetchedResultsController中的sections方法可以以数组的形式返回所有的section
    //sections数组中存的是每个section的数据信息
    NSArray *sections = [self.fetchedResultsController sections];
    return sections.count;
}

//通过获取section中的信息来获取header和每个secion中有多少数据

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *sections = [self.fetchedResultsController  sections];
    //获取对应section的sectionInfo
    id<NSFetchedResultsSectionInfo> sectionInfo = sections[section];
    
    //返回header
    return [sectionInfo name];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *sections = [self.fetchedResultsController sections];
    id<NSFetchedResultsSectionInfo> sectionInfo = sections[section];
    
    //返回每个section中的元素个数
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"Cell";
<<<<<<< HEAD
UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer];    
=======
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer forIndexPath:indexPath];
    
>>>>>>> FETCH_HEAD
    //获取实体对象
    Ingredient *ingredient = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    
    cell.textLabel.text = ingredient.name;
    NSString *a =[NSString stringWithFormat:@"%@%@%@", ingredient.amount, @"  " ,ingredient.measure_unit];

    cell.detailTextLabel.text =a;
    // Configure the cell...
    
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //通过coreData删除对象
        //通过indexPath获取我们要删除的实体
        //        if ([switchB.titleLabel.text isEqualToString:@"Subscribers"]) {
        Recipe * recipe = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //通过上下文移除实体
        [self.managedObjectContext  deleteObject:recipe];
        
        NSError *error;
        if ([self.managedObjectContext save:&error]) {
            NSLog(@"%@", [error localizedDescription]);
        }
        [self.tableView reloadData];
        
    }
}
//当CoreData的数据正在发生改变是，FRC产生的回调
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
    
}

//分区改变状况
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        default:
            break;
    }
}

//数据改变状况
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            //让tableView在newIndexPath位置插入一个cell
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            //让tableView刷新indexPath位置上的cell
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

//当CoreData的数据完成改变是，FRC产生的回调
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
