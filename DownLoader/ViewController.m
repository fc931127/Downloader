//
//  ViewController.m
//  DownLoader
//
//  Created by suning on 2020/6/23.
//  Copyright © 2020 pptiyu. All rights reserved.
//

#import "ViewController.h"
#import "FCDownloadManager.h"

#import "TaskModel.h"
#define kCachePath (NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0])

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray  *_dataArray;
}

@property(nonatomic,strong)UITableView  *tbView;
@property(nonatomic,assign)BOOL  ispause;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton * beginBtn = [[UIButton alloc]init];
    [beginBtn setTitle:@"开始(看日志)" forState:UIControlStateNormal];
    [beginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [beginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    beginBtn.frame  = CGRectMake(100, 200, 100, 50);
    [self.view addSubview:beginBtn];


    _dataArray  = [[NSMutableArray alloc]init];

    TaskModel *model=[TaskModel model];
    model.name=@"GDTSDK.zip";
   model.url=@"http://imgcache.qq.com/qzone/biz/gdt/dev/sdk/ios/release/GDT_iOS_SDK.zip";
    model.destinationPath=[kCachePath stringByAppendingPathComponent:model.name];
    [_dataArray addObject:model];

}
-(void)btnClick:(UIButton*)btn{
    TaskModel * model = _dataArray[0];
    _ispause = !_ispause;

    NSString * titlestr = _ispause ? @"暂停(看日志)" : @"恢复(看日志)";
    [btn setTitle:titlestr forState:UIControlStateNormal];

    if(!_ispause){
        [[FCDownloadManager shredManager] cancelDownloadTask:model.url];
        return;
    }

    //添加下载任务
    [[FCDownloadManager shredManager] downloadUrl:model.url toPath:model.destinationPath process:^(float progress, NSString *sizeString, NSString *speedString) {
        NSLog(@"++++%f******%@",progress,sizeString);
    } completion:^{
        NSLog(@"下载完成");

    } failure:^(NSError *error) {
        [[FCDownloadManager shredManager] cancelDownloadTask:model.url];
        NSLog(@"下载失败");

    }];

}



@end
