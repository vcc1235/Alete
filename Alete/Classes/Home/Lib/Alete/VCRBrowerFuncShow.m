//
//  VCRBrowerFuncShow.m
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import "VCRBrowerFuncShow.h"
#import "UIView+Alete.h"
@implementation VCRBrowerModel


@end

@interface VCRBrowerButton : UIControl

@property (nonatomic, strong) UIImageView *iconImageView ;

@property (nonatomic, strong) UILabel *titleLabel ;

@property (nonatomic, strong) UIView *backView ;

@property (nonatomic, strong) VCRBrowerModel *model ;

@end
@implementation VCRBrowerButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 74, 74)];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup{
    
    CGFloat width = 54.0f ;
    CGFloat margin = (74.0f-width)/2.0 ;
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(margin, 0, width, width)];
    self.backView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    self.backView.al_redius = 6.0f ;
    self.backView.userInteractionEnabled = false ;
    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,10, 34, 34)];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.titleLabel.textColor = [UIColor darkGrayColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter ;
    self.titleLabel.frame = CGRectMake(0,width+1,CGRectGetWidth(self.frame),20);
    [self addSubview:self.backView];
    [self.backView addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    
}



@end


@interface VCRBrowerView : UIView

@property (nonatomic, strong) UIScrollView *firstScrollView ;

@property (nonatomic, strong) UIScrollView *secondScrollView ;

@property (nonatomic, strong) UIView *lineView ;

@property (nonatomic, strong) UILabel *titleLabel ;

@property (nonatomic, strong) UIButton *cancleSender ;

@property (nonatomic, strong) UIView *backView ;

@property (nonatomic, weak) id <VCRBrowerFuncShowDelegate> delegate ;

-(void)show ;

-(void)initWithBrower:(NSArray<VCRBrowerModel *>*)list backList:(NSArray<VCRBrowerModel *>*)data;

@end

@interface VCRBrowerFuncShow  () <VCRBrowerFuncShowDelegate>

@property (nonatomic, strong) NSMutableArray <VCRBrowerModel *>*firstArray ;
@property (nonatomic, strong) NSMutableArray <VCRBrowerModel *>*secondArray ;
@property (nonatomic, strong) VCRBrowerView *view ;
@property (nonatomic, weak) id <VCRBrowerFuncShowDelegate> delegate ;
@property (nonatomic, strong) NSString *title ;

@end

@implementation VCRBrowerFuncShow
-(NSMutableArray<VCRBrowerModel *> *)firstArray{
    if (!_firstArray) {
        _firstArray = [[NSMutableArray alloc]init];
    }
    return _firstArray ;
}
-(NSMutableArray<VCRBrowerModel *> *)secondArray{
    if (!_secondArray) {
        _secondArray = [[NSMutableArray alloc]init];
    }
    return _secondArray ;
}
+(instancetype)initWithBrower:(NSArray<VCRBrowerModel *> *)array delegate:(nonnull id<VCRBrowerFuncShowDelegate>)delegate{
    return [self initWithBrower:array title:@"" delegate:delegate];
}

+(instancetype)initWithBrower:(NSArray<VCRBrowerModel *> *)array title:(NSString *)title delegate:(id<VCRBrowerFuncShowDelegate>)delegate{
    VCRBrowerFuncShow *func = [[VCRBrowerFuncShow alloc]init];
    [array enumerateObjectsUsingBlock:^(VCRBrowerModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.index == 1) {
            [func.firstArray addObject:obj];
        }else{
            [func.secondArray addObject:obj];
        }
    }];
    func.delegate = delegate ;
    func.title = title ;
    [func setup];
    return func ;
}

-(void)initWithBrower:(VCRBrowerModel *)model andIndex:(NSInteger)index{
    if (self.delegate) {
        [self.delegate initWithBrower:model andIndex:index];
    }
}

-(void)setup{
    
    self.view = [[VCRBrowerView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.view.delegate = self.delegate ;
    self.view.titleLabel.text = self.title ;
    [self.view initWithBrower:self.firstArray backList:self.secondArray];
    
}

-(void)show{
   [self.view show];
}

@end

@implementation VCRBrowerView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor ;
        [self setup];
    }
    return self;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        [self addSubview:_lineView];
    }
    return _lineView ;
}
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:UIScreen.mainScreen.bounds];
        _backView.alpha = 0.0f ;
        _backView.hidden = true ;
        _backView.backgroundColor = UIColor.blackColor ;
    }
    return _backView ;
}
-(UIButton *)cancleSender{
    if (!_cancleSender) {
        _cancleSender = [[UIButton alloc]initWithFrame:CGRectZero];
        [_cancleSender setTitle:NSLocalizedString(@"取消", nil) forState:UIControlStateNormal];
        [_cancleSender setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _cancleSender.titleLabel.font = [UIFont systemFontOfSize:15];
        [_cancleSender addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancleSender];
    }
    return _cancleSender ;
}
-(UIScrollView *)firstScrollView{
    if (!_firstScrollView) {
        _firstScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 30, UIScreen.mainScreen.bounds.size.width,90.0)];
        [self addSubview:_firstScrollView];
    }
    return _firstScrollView ;
}
-(UIScrollView *)secondScrollView{
    if (!_secondScrollView) {
        _secondScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.firstScrollView.frame), UIScreen.mainScreen.bounds.size.width,90.0)];
        [self addSubview:_secondScrollView];
    }
    return _secondScrollView ;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 30.0f)];
        [self addSubview:_titleLabel];
        _titleLabel.textAlignment = NSTextAlignmentCenter ;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    }
    return _titleLabel ;
}
-(void)setup{
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window] ;
    [window addSubview:self.backView];
    [window addSubview:self];
    
    
}
-(void)initWithBrower:(NSArray<VCRBrowerModel *> *)list backList:(NSArray<VCRBrowerModel *> *)data{
    
    CGFloat margin = 10.0f ;
    if (list.count) {
        [list enumerateObjectsUsingBlock:^(VCRBrowerModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            VCRBrowerButton *sender = [[VCRBrowerButton alloc]initWithFrame:CGRectZero];
            sender.frame = CGRectMake(margin+idx*(margin+sender.al_width),8.0f,sender.al_width, sender.al_height);
            [sender.iconImageView setImage:[UIImage imageNamed:obj.imageName]];
            sender.titleLabel.text = obj.title ;
            [self.firstScrollView addSubview:sender];
            sender.model = obj ;
            [sender addTarget:self action:@selector(addTargetWithAction:) forControlEvents:UIControlEventTouchUpInside];
        }];
    }
    if (data.count){
        [data enumerateObjectsUsingBlock:^(VCRBrowerModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            VCRBrowerButton *sender = [[VCRBrowerButton alloc]initWithFrame:CGRectZero];
            sender.frame = CGRectMake(margin+idx*(margin+sender.al_width),8.0f,sender.al_width, sender.al_height);
            [sender.iconImageView setImage:[UIImage imageNamed:obj.imageName]];
            sender.titleLabel.text = obj.title ;
            [self.secondScrollView addSubview:sender];
            sender.model = obj ;
            [sender addTarget:self action:@selector(addTargetWithAction:) forControlEvents:UIControlEventTouchUpInside];
        }];
    }
    CGFloat height = 0.0f ;
    if (list.count) {
        height = 30.0f+90.0f+44.0f;
    }
    if (data.count) {
        height = height + 90.0f ;
    }
    self.lineView.frame = CGRectMake(0, height-44.0f, UIScreen.mainScreen.bounds.size.width, 1.0);
    self.cancleSender.frame = CGRectMake(0, height-44.0f, UIScreen.mainScreen.bounds.size.width, 44.0f);
    self.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.height, UIScreen.mainScreen.bounds.size.width,height);
    
}

-(void)addTargetWithAction:(VCRBrowerButton *)sender{
    if (self.delegate) {
        [self.delegate initWithBrower:sender.model andIndex:sender.model.index];
    }
    [self cancle];
}

-(void)cancle{
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backView.alpha = 0.0 ;
        self.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.height,self.al_width, self.al_height);
    } completion:^(BOOL finished) {
        self.backView.hidden = true ;
        [self removeFromSuperview];
        [self.backView removeFromSuperview];
    }];
    
}

-(void)show{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.backView.hidden = false ;
    self.backView.alpha = 0.3 ;
    self.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.height-self.al_height,self.al_width, self.al_height);
    [UIView commitAnimations];
    
}

@end
