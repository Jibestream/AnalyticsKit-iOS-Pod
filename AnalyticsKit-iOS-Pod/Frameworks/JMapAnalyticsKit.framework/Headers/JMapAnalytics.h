//
//  JMapAnalytics.h
//  JMapAnalytics
//
//  Created by Aaron Wong on 2016-12-19.
//  Copyright © 2016 Jibestream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JMapCoreKit/JMapCoreKit.h>

/**
 *  Logging Options - Server
 */
extern NSString * _Nonnull const SERVER;
/**
 *  Logging Options - Map
 */
extern NSString * _Nonnull const MAP;
/**
 *  Logging Options - Icon
 */
extern NSString * _Nonnull const ICON;
/**
 *  Logging Options - Shape
 */
extern NSString * _Nonnull const SHAPE;
/**
 *  Logging Options - Tap
 */
extern NSString * _Nonnull const TAP;
/**
 *  Logging Options - Waypath
 */
extern NSString * _Nonnull const WAYPATH;

@protocol JMapAnalyticsDelegate <NSObject>

@optional

/**
 *  Analytics Kit Did Get Log
 *
 *  @discussion used to receive any recorded data in real time.
 *
 *  @param log An NSDictionary of record data received in real time.
 */
- (void)analyticsKitDidGetLog:(nonnull NSDictionary *)log;

@end

@interface JMapAnalytics : NSObject

/**
 *  Set Delegate
 *
 *  @discussion JMapAnalyticsDelegate used to utilize dispatching logs to the delegate. Refer to the delegate methods above.
 */
@property (nonatomic, weak, nullable) id<JMapAnalyticsDelegate> delegate;

/**
 *  Shared Instance
 *
 *  @return An JMapAnalytics singleton instance
 */
+ (nonnull id)sharedInstance;

/**
 *  Set Logging Options
 *
 *  @discussion Optional API to set parameters to log in analytics.
 *
 *  @param loggingOptions set an array of NSString of logging options. Default is set to all.
 */
- (void)setLoggingOptions:(nonnull NSArray <NSString *>*)loggingOptions;

@end
