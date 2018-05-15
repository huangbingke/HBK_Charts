//
//  HBK_BarChartsViewController.m
//  HBK_Charts
//
//  Created by 黄冰珂 on 2018/5/10.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "HBK_BarChartsViewController.h"

@interface HBK_BarChartsViewController ()<IChartAxisValueFormatter>


@property (nonatomic, strong) BarChartView *barChartView;

@property (nonatomic, strong) NSMutableArray *xDataArray;
@property (nonatomic, strong) NSMutableArray *yDataArray;


@end

@implementation HBK_BarChartsViewController

- (NSMutableArray *)xDataArray {
    if (!_xDataArray) {
        _xDataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _xDataArray;
}

- (NSMutableArray *)yDataArray {
    if (!_yDataArray) {
        _yDataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _yDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.barChartView];
    
    NSArray *xArray = @[@"一栋", @"二栋", @"三栋", @"四栋", @"五栋", @"六栋", @"七栋", @"八栋", @"九栋", @"十栋"];
    [self.xDataArray addObjectsFromArray:xArray];
    
    for (int i = 0; i < 31; i++) {
        [self.yDataArray addObject:[NSString stringWithFormat:@"%d层", i]];
    }
    
    NSMutableArray *yVals = [NSMutableArray new];
    NSMutableArray *dataSets = [NSMutableArray new];
    NSMutableArray<UIColor *> *colorArray = [NSMutableArray new];
    [self.xDataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [yVals addObject:[[BarChartDataEntry alloc] initWithX:idx y:30]];
//        if (idx < 5) {
//            [colorArray addObject:kCompleteColor];
//        } else if (idx >= 5 && idx < 15) {
//            [colorArray addObject:kWorkingColor];
//        } else if (idx >= 15 && idx < 20) {
//            [colorArray addObject:kOverTimeColor];
//        } else {
//            [colorArray addObject:kTipsLabelColor];
//        }
    }];
    
    
    NSLog(@"~~~~~  %@  ~~~~~", yVals);
    BarChartDataSet *set = [[BarChartDataSet alloc] initWithValues:yVals label:nil];
//    set.colors = colorArray;
    set.drawValuesEnabled = NO;
    [dataSets addObject:set];
    
    BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.f]];
    data.barWidth = 0.5;
    
    self.barChartView.data = data;
    [self.barChartView setVisibleXRangeMaximum:4.0];
    [self.barChartView setVisibleXRangeMinimum:4.0];
    [self.barChartView notifyDataSetChanged];
}



- (void)configureBarChartView:(BarChartView *)barChartView {
    barChartView.noDataText = @"暂无数据";
//    _barChartView.dragEnabled = NO;
    barChartView.chartDescription.enabled = NO;
    barChartView.pinchZoomEnabled = NO;//捏合
    barChartView.doubleTapToZoomEnabled = NO;
    barChartView.drawGridBackgroundEnabled = NO;//网格背景
    barChartView.drawValueAboveBarEnabled = NO;
    barChartView.drawBarShadowEnabled = NO;
    barChartView.highlightPerTapEnabled = NO;
    barChartView.highlightFullBarEnabled = NO;
    barChartView.highlightPerDragEnabled = NO;
    barChartView.scaleXEnabled = NO;
    barChartView.scaleYEnabled = NO;
    
    NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
    leftAxisFormatter.maximumFractionDigits = 1;
    leftAxisFormatter.negativeSuffix = @"";//负数后缀
    leftAxisFormatter.positiveSuffix = @"";//正数后缀
    
    ChartYAxis *leftAxis = barChartView.leftAxis;
    leftAxis.valueFormatter = self;
    leftAxis.axisMinimum = 0.0;
    leftAxis.drawAxisLineEnabled = YES;
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.spaceMin = 0.5;
    leftAxis.spaceTop = 0.f;
    leftAxis.spaceMax = 0.5;
    
    barChartView.rightAxis.enabled = NO;
    
    ChartXAxis *xAxis = barChartView.xAxis;
    xAxis.valueFormatter = self;
    xAxis.labelFont = [UIFont systemFontOfSize:13];
    xAxis.labelPosition =  XAxisLabelPositionBottom;
    xAxis.drawAxisLineEnabled = YES;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0;
    xAxis.wordWrapEnabled = YES;
    
    ChartLegend *legend = barChartView.legend;
    legend.enabled = false;
}


- (BarChartView *)barChartView {
    if (!_barChartView) {
        _barChartView = [[BarChartView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, kScreenWidth, 500)];
        _barChartView.backgroundColor = [UIColor yellowColor];
        [self configureBarChartView:_barChartView];
    }
    return _barChartView;
}

#pragma mark - IChartAxisValueFormatter -
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    if ([axis isKindOfClass:[ChartXAxis class]]) {
        return self.xDataArray[(int)value];
    } else {
        return self.yDataArray[(int)value];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
