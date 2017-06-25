//
//  FootballAPI.m
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "HockeyAPI.h"
#import "APIKeys.h"
#import "Game.h"
@interface HockeyAPI()
@property(strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation HockeyAPI

-(NSString *)getTodaysDate{
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [self.dateFormatter stringFromDate:[NSDate date]];
}

- (void)fetchHockeyDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *todaysDate = [self getTodaysDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/nhl-t3/games/%@/schedule.json?api_key=%@", todaysDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *games = json[@"games"];
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc] initWithNHLGame:dict];
        [gameObjects addObject:game];
    }
    
    completion(gameObjects);
}

@end
