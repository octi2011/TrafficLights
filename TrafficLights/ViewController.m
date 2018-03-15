//
//  ViewController.m
//  TrafficLights
//
//  Created by Duminica Octavian on 15/03/2018.
//  Copyright © 2018 Duminica Octavian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scoreInt = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startStopButton:(id)sender {
    if (scoreInt == 0) {
        timerInt = 3;
        self.trafficLights.image = [UIImage imageNamed:@"trafficLight.png"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
        
        self.startButton.enabled = NO;
        
        [self.startButton setTitle:@"" forState:UIControlStateNormal];
        
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    } else {
        [scoreTimer invalidate];
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
    }
    
    if (timerInt == 0) {
        scoreInt = 0;
        timerInt = 3;
    }
}

- (void)startCounter {
    timerInt -= 1;
    
    if (timerInt == 2) {
        self.trafficLights.image = [UIImage imageNamed:@"trafficLight3.png"];
    } else if (timerInt == 1) {
        self.trafficLights.image = [UIImage imageNamed:@"trafficLight2.png"];
    } else if (timerInt == 0) {
        self.trafficLights.image = [UIImage imageNamed:@"trafficLight1.png"];
        
        [timer invalidate];
        
        self.startButton.enabled = YES;
        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
    }
}

- (void)scoreCounter {
    scoreInt += 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}
@end
