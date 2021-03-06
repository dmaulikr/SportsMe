//
//  SoccerAPI.h
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoccerAPI : NSObject

- (void)fetchSoccerDataWithCompletion:(void (^)(NSArray *games))completion;

- (void)fetchTomorrowsSoccerDataWithCompletion:(void (^)(NSArray *games))completion;

@end
