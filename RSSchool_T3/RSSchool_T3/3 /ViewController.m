#import "ViewController.h"

@interface ViewController() <UITextFieldDelegate>
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
//MARK: -TextFieldArray
@property(nonatomic, retain) NSArray<UITextField *> *textFields;
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
    
    self.textFields = [NSArray new];
    
    //MARK: Delegate
    self.textFieldRed.delegate = self;
    self.textFieldGreen.delegate = self;
    self.textFieldBlue.delegate = self;
    
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
    
    self.resultColorLabel.text = @"Color";
    //MARK: AssigningTextToElements
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldBlue.placeholder = @"0..255";
    
    [self.processButton setTitle:@"Process" forState: UIControlStateNormal];
    
    self.redLabel.text = @"RED";
    self.greenLabel.text = @"GREEN";
    self.blueLabel.text = @"BLUE";
    
    
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
    
    self.mainView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<UIView*> *labelArray = @[self.resultColorLabel, self.redLabel, self.greenLabel, self.blueLabel];
    self.textFields = @[
        self.textFieldRed,
        self.textFieldGreen,
        self.textFieldBlue];
    
    NSMutableArray *allViews = [NSMutableArray arrayWithArray:labelArray];
    [allViews addObjectsFromArray:self.textFields];
    [allViews addObjectsFromArray:@[self.resultColorView, self.processButton]];
    for(UIView *view in allViews){
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [self.view addSubview:self.mainView];
    
    [self.mainView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0].active = YES;
    [self.mainView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0].active = YES;
    [self.mainView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0].active = YES;
    [self.mainView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0].active = YES;
    
    //MARK: AddSubview
    [self.mainView addSubview:self.textFieldRed];
    [self.mainView addSubview:self.textFieldGreen];
    [self.mainView addSubview:self.textFieldBlue];
    [self.mainView addSubview:self.processButton];
    [self.mainView addSubview:self.redLabel];
    [self.mainView addSubview:self.greenLabel];
    [self.mainView addSubview:self.blueLabel];
    [self.mainView addSubview:self.resultColorLabel];
    [self.mainView addSubview:self.resultColorView];
    
    [self.processButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //MARK: AddConstraint
    for(UIView *view in allViews){
        [view.heightAnchor constraintEqualToConstant:30].active = YES;
    }
    
    for(NSInteger i = 0; i < labelArray.count; i++){
        if(!i){
            [labelArray[i].leadingAnchor constraintEqualToAnchor:self.mainView.leadingAnchor constant:20].active = YES;
            [labelArray[i].topAnchor constraintEqualToAnchor:self.mainView.topAnchor constant:60].active = YES;
            [labelArray[i].widthAnchor constraintEqualToConstant:100].active = YES;
            continue;
        }
        
        [labelArray[i].widthAnchor constraintEqualToConstant:60].active = YES;
        [labelArray[i].leadingAnchor constraintEqualToAnchor:labelArray[i-1].leadingAnchor constant:0].active = YES;
        [labelArray[i].topAnchor constraintEqualToAnchor:labelArray[i-1].topAnchor constant:60].active = YES;
    }
    
    //MARK: AddConstraint
    [self.textFieldGreen.bottomAnchor constraintEqualToAnchor:self.greenLabel.bottomAnchor constant:0].active = YES;
    [self.textFieldRed.bottomAnchor constraintEqualToAnchor:self.redLabel.bottomAnchor constant:0].active = YES;
    [self.textFieldBlue.bottomAnchor constraintEqualToAnchor:self.blueLabel.bottomAnchor constant:0].active = YES;
    
    [self.textFieldGreen.leadingAnchor constraintEqualToAnchor:self.greenLabel.trailingAnchor constant:30].active = YES;
    [self.textFieldRed.leadingAnchor constraintEqualToAnchor:self.textFieldGreen.leadingAnchor constant:0].active = YES;
    [self.textFieldBlue.leadingAnchor constraintEqualToAnchor:self.textFieldGreen.leadingAnchor constant:0].active = YES;
    
    [self.textFieldGreen.trailingAnchor constraintEqualToAnchor:self.mainView.trailingAnchor constant:-30].active = YES;
    [self.textFieldRed.trailingAnchor constraintEqualToAnchor:self.mainView.trailingAnchor constant:-30].active = YES;
    [self.textFieldBlue.trailingAnchor constraintEqualToAnchor:self.mainView.trailingAnchor constant:-30].active = YES;
    
    [self.resultColorView.bottomAnchor constraintEqualToAnchor:self.resultColorLabel.bottomAnchor constant:0].active = YES;
    [self.resultColorView.leadingAnchor constraintEqualToAnchor:self.resultColorLabel.trailingAnchor constant:30].active = YES;
    [self.resultColorView.trailingAnchor constraintEqualToAnchor:self.mainView.trailingAnchor constant:-30].active = YES;
    
    [self.processButton.centerXAnchor constraintEqualToAnchor:self.mainView.centerXAnchor constant:0].active = YES;
    [self.processButton.widthAnchor constraintEqualToConstant:100].active = YES;
    [self.processButton.topAnchor constraintEqualToAnchor:self.blueLabel.bottomAnchor constant:30].active = YES;
    
    [self.processButton.centerXAnchor constraintEqualToAnchor:self.mainView.centerXAnchor constant:0].active = YES;
    [self.processButton.widthAnchor constraintEqualToConstant:100].active = YES;
    [self.processButton.topAnchor constraintEqualToAnchor:self.blueLabel.bottomAnchor constant:40].active = YES;
}

//MARK: TextFieldDidBeginEditing
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.resultColorLabel.text = @"Color";
}

//MARK: - Action
-(void) buttonAction:(UIButton *)sender{
    NSString *redValueString = self.textFieldRed.text;
    NSString *greenValueString = self.textFieldGreen.text;
    NSString *blueValueString = self.textFieldBlue.text;
    NSMutableString *rgbColorString = [NSMutableString new];
    [rgbColorString appendFormat:@"%@%@%@",redValueString,greenValueString,blueValueString];
    
    for (UITextField *textField in self.textFields) {
          [textField resignFirstResponder];
          textField.text = @"";
      }
    if(redValueString.length && greenValueString.length && blueValueString.length){
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([rgbColorString rangeOfCharacterFromSet:notDigits].location == NSNotFound) {
            int red = redValueString.intValue;
            int green = greenValueString.intValue;
            int blue = blueValueString.intValue;
            if(red >=0 && red <= 255 && green >= 0 && green <= 255 && blue >= 0 && blue <= 255){
                
                self.resultColorLabel.text = [NSString stringWithFormat:@"0x%02X%02X%02X", red, green, blue];
                
                self.resultColorView.backgroundColor = [UIColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:1];
                return;
            }
        }
    }
    
    self.resultColorLabel.text = @"Error";
    self.resultColorView.backgroundColor = UIColor.clearColor;
}

@end
