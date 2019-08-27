//
//  ViewController.m
//  copy
//
//  Created by 赵鹏 on 2019/8/17.
//  Copyright © 2019 赵鹏. All rights reserved.
//

/**
 拷贝的目的：产生一个副本对象。原对象和副本对象互不影响，即修改原对象不会影响副本对象，修改副本对象，不会影响原对象；
 
 iOS提供了两个拷贝方法：
 1、copy：不可变拷贝，产生不可变的副本；
 2、mutableCopy：可变拷贝，产生可变的副本。
 
 深拷贝和浅拷贝：
 1、深拷贝：也叫内容拷贝，会拷贝出来一个新的对象，并且由一个新的指针指着它；
 2、浅拷贝：也叫指针拷贝，不会产生新的对象，只会产生一个新的指针指着原来的对象。
 
 结论：
 1、不可变对象调用"copy"方法，得到的也是一个不可变对象，是浅拷贝；
 2、不管是可变对象还是不可变对象，只要调用"mutableCopy"方法，得到的都是可变对象，深拷贝。
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self test];
    
//    [self test1];
    
//    [self test2];
    
//    [self test3];
    
//    [self test4];
    
//    [self test5];
    
//    [self test6];
    
    [self test7];
}

- (void)test
{
    NSString *str = [NSString stringWithFormat:@"test"];  //不可变字符串
    
    NSString *str1 = [str copy];  //不可变拷贝，返回的是NSString类型的副本
    NSMutableString *str2 = [str mutableCopy];  //可变拷贝，返回的是NSMutableString类型的副本
    NSLog(@"%@, %@", [str1 class], [str2 class]);
}

- (void)test1
{
    NSMutableString *str = [NSMutableString stringWithFormat:@"test"];  //可变字符串
    
    NSString *str1 = [str copy];  //不可变拷贝，返回的是NSString类型的副本
    NSMutableString *str2 = [str mutableCopy];  //可变拷贝，返回的是NSMutableString类型的副本
    NSLog(@"%@, %@", [str1 class], [str2 class]);
}

#pragma mark ————— 不可变字符串 —————
/**
 对于不可变字符串来说，调用"copy"方法是浅拷贝，调用"mutableCopy"方法是深拷贝。
 */
- (void)test2
{
    NSString *str = [[NSString alloc] initWithFormat:@"test"];
    
    //浅拷贝，str和str1两个指针指向同一个对象。
    NSString *str1 = [str copy];
    
    //深拷贝，会产生一个新的对象，并且会由一个新的指针指向这个新产生的对象。
    NSMutableString *str2 = [str mutableCopy];
    
    NSLog(@"%p, %p, %p", str, str1, str2);
}

#pragma mark ————— 可变字符串 —————
/**
 对于可变字符串来说，不管调用"copy"方法还是调用"mutableCopy"方法，都是深拷贝。
 */
- (void)test3
{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"test"];
    
    NSString *str1 = [str copy];  //深拷贝
    NSMutableString *str2 = [str mutableCopy];  //深拷贝
    
    NSLog(@"%p, %p, %p",str, str1, str2);
}

#pragma mark ————— 不可变数组 —————
/**
 对于不可变数组来说，调用"copy"方法是浅拷贝，调用"mutableCopy"方法是深拷贝。
 */
- (void)test4
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"a", @"b", nil];
    NSArray *array1 = [array copy];  //浅拷贝
    NSMutableArray *array2 = [array mutableCopy];  //深拷贝
    
    NSLog(@"%p, %p, %p",array, array1, array2);
}

#pragma mark ————— 可变数组 —————
/**
 对于可变数组来说，调用"copy"方法是深拷贝，调用"mutableCopy"方法也是深拷贝。
 */
- (void)test5
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"a", @"b", nil];
    NSArray *array1 = [array copy];  //深拷贝
    NSMutableArray *array2 = [array mutableCopy];  //深拷贝
    
    NSLog(@"%p, %p, %p", array, array1, array2);
}

#pragma mark ————— 不可变字典 —————
/**
 对于不可变字典来说，调用"copy"方法是浅拷贝，调用"mutableCopy"方法是深拷贝。
 */
- (void)test6
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"jack", @"name", nil];
    NSDictionary *dict1 = [dict copy];  //浅拷贝
    NSMutableDictionary *dict2 = [dict mutableCopy];  //深拷贝
    
    NSLog(@"%p, %p, %p", dict, dict1, dict2);
}

#pragma mark ————— 可变字典 —————
/**
 对于可变字典来说，调用"copy"方法是深拷贝，调用"mutableCopy"方法也是深拷贝。
 */
- (void)test7
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"jack", @"name", nil];
    NSDictionary *dict1 = [dict copy];  //深拷贝
    NSMutableDictionary *dict2 = [dict mutableCopy];  //深拷贝
    
    NSLog(@"%p, %p, %p", dict, dict1, dict2);
}

@end
