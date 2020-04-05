#import "ViewController.h"

@interface ViewController()
//MARK: UILabel
@property(nonatomic, retain) UILabel *resultColorLabel;
@property(nonatomic, retain) UILabel *redLabel;
@property(nonatomic, retain) UILabel *blueLabel;
@property(nonatomic, retain) UILabel *greenLabel;
//MARK: TextField
@property(nonatomic, retain) UITextField *textFieldRed;
@property(nonatomic, retain) UITextField *textFieldGreen;
@property(nonatomic, retain) UITextField *textFieldBlue;
//MARK: UIButton
@property(nonatomic, retain) UIButton *processButton;
//MARK: UIView
@property(nonatomic, retain) UIView *resultColorView;
@property(nonatomic, retain) UIView *mainView;
@end

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: Initialization
    self.resultColorLabel = [UILabel new];
    self.redLabel = [UILabel new];
    self.blueLabel = [UILabel new];
    self.greenLabel = [UILabel new];
    
    self.textFieldRed = [UITextField new];
    self.textFieldGreen = [UITextField new];
    self.textFieldBlue = [UITextField new];
    
    self.processButton = [UIButton new];
    
    self.resultColorView = [UIView new];
    self.mainView = [UIView new];
    
    //MARK: SetAccessibilityIdentifier
    self.mainView.accessibilityIdentifier = @"mainView";
    
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    
    self.processButton.accessibilityIdentifier = @"buttonProcess";
    
    self.redLabel.accessibilityIdentifier = @"labelRed";
    self.greenLabel.accessibilityIdentifier = @"labelGreen";
    self.blueLabel.accessibilityIdentifier = @"labelBlue";
    self.resultColorLabel.accessibilityIdentifier = @"labelResultColor";
    
    self.resultColorView.accessibilityIdentifier = @"viewResultColor";
    
    //MARK: AssigningTextToElements
    self.textFieldRed.placeholder = @" 0..255";
    self.textFieldGreen.placeholder = @" 0..255";
    self.textFieldBlue.placeholder = @" 0..255";
    
    [self.processButton setTitle:@"Process" forState: UIControlStateNormal];
    
    self.redLabel.text = @"RED";
    self.greenLabel.text = @"GREEN";
    self.blueLabel.text = @"BLUE";
    self.resultColorLabel.text = @"Color";
    
    //MARK: AppearanceOfElement
    CGColorRef borderColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2  alpha:1].CGColor;
    CGFloat borderWidth = 1.f;
    CGFloat cornerRadius = 7.f;
    
    self.textFieldRed.layer.borderColor = borderColor;
    self.textFieldGreen.layer.borderColor = borderColor;
    self.textFieldBlue.layer.borderColor = borderColor;
    
    self.textFieldRed.layer.cornerRadius = cornerRadius;
    self.textFieldGreen.layer.cornerRadius = cornerRadius;
    self.textFieldBlue.layer.cornerRadius = cornerRadius;
    
    self.textFieldRed.layer.borderWidth = borderWidth;
    self.textFieldGreen.layer.borderWidth = borderWidth;
    self.textFieldBlue.layer.borderWidth = borderWidth;
    
    [self.processButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    
    //MARK:
    [self.processButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //MARK: AddConstraint
    
    
    
    
    
    
    
    //MARK: AddSubview
    [self.mainView addSubview:self.textFieldRed];
    [self.mainView addSubview:self.textFieldGreen];
    [self.mainView addSubview:self.textFieldBlue];
    [self.mainView addSubview:self.processButton];
    [self.mainView addSubview:self.redLabel];
    [self.mainView addSubview:self.textFieldGreen];
    [self.mainView addSubview:self.textFieldBlue];
    [self.mainView addSubview:self.resultColorLabel];
    [self.mainView addSubview:self.resultColorView];
}

//MARK: -Action
-(void) buttonAction:(UIButton *)sender{
    NSString *redStr = self.textFieldRed.text;
    NSString *greenStr = self.textFieldGreen.text;
    NSString *blueStr = self.textFieldBlue.text;
    NSMutableString *all = redStr.mutableCopy;
    [all appendString:greenStr];
    [all appendString:blueStr];
    
    [self.textFieldRed resignFirstResponder];
    [self.textFieldGreen resignFirstResponder];
    [self.textFieldBlue resignFirstResponder];
    
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
    
    if(redStr.length && greenStr.length && blueStr.length){
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([all rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            int red = redStr.intValue;
            int green = greenStr.intValue;
            int blue = blueStr.intValue;
            if(red >=0 && red <= 255 && green >= 0 && green <= 255 && blue >= 0 && blue <= 255){
                
                self.resultColorLabel.text = [NSString stringWithFormat:@"0x%02X%02X%02X", red, green, blue];
                
                self.resultColorView.backgroundColor = [UIColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:1];
                return;
            }
        }
    }
    
    //self.labelResultColor.text = @"Error";
    //self.viewResultColor.backgroundColor = UIColor.clearColor;
}
@end
