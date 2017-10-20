//
//  ViewController.m
//  temperature
//
//  Created by user on 9/27/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmtControl;
@property (weak, nonatomic) IBOutlet UISlider *sliderSize;
@property (weak, nonatomic) IBOutlet UILabel *lblTemp;
@property (getter=getoldMetric,setter=setoldMetric:) int oldMetric;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.lblTemp setText:[NSString stringWithFormat:@"%d",(int)self.sliderSize.value]];
    [self setoldMetric:2];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderChange:(id)sender {
    [self.lblTemp setText:[NSString stringWithFormat:@"%d",(int)self.sliderSize.value]];
}

- (IBAction)sgmtChange:(id)sender {
   
    
    [self CalculateTemperature];
}
              
              
-(void) CalculateTemperature{
    int actualMetric =self.sgmtControl.selectedSegmentIndex;
    int actualValue = self.sliderSize.value;
    int old = [self getoldMetric];
    int newValue = 0;
    switch (actualMetric) {
        case 0: //fahrenheit
            
            self.sgmtControl.numberOfSegments
            //set boundaris from 32 - 132
            self.sliderSize.minimumValue = 32;
            self.sliderSize.maximumValue = 132;
            if( old == 1) //kelvin
            {
                newValue = actualValue - 241;
            }
            else // celcius
            {
                newValue = actualValue + 32;
            }
        break;
            
        case 1: //kelvin
            self.sliderSize.minimumValue = 273;
            self.sliderSize.maximumValue = 373;
            if( old == 0) //fahrenheit
            {
                newValue = 241 + actualValue ;
            }
            else // celcius
            {
                newValue =  273 + actualValue;
            }
            break;
            
        case 2: //celcius
            self.sliderSize.minimumValue = 0;
            self.sliderSize.maximumValue = 100;
            if( old == 1) //kelvin
            {
                newValue = actualValue - 273;
            }
            else // faranheit
            {
                
                newValue = actualValue-32;
            }
            break;
            
        default:
            break;
    }
    
   [self.lblTemp setText:[NSString stringWithFormat:@"%d", newValue]];
    
    self.sliderSize.value = newValue;
    [self setoldMetric:actualMetric];
}



@end
