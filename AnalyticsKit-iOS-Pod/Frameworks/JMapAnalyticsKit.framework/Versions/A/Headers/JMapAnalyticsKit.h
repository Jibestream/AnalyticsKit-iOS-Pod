//
//  JMapAnalyticsKit.h
//  JMapAnalytics
//
//  Created by Aaron Wong on 2016-12-19.
//  Copyright © 2016 Jibestream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JMapCoreKit/JMapCoreKit.h>

/*!
 *  Logging Options
 *
 *  @discussion Constants string to pass into
 */
extern NSString * _Nonnull const SERVER;
extern NSString * _Nonnull const MAP;
extern NSString * _Nonnull const ICON;
extern NSString * _Nonnull const SHAPE;
extern NSString * _Nonnull const TAP;
extern NSString * _Nonnull const WAYPATH;

@protocol JMapAnalyticsKitDelegate <NSObject>

@optional

/*!
 *  Analytics Kit Did Get Log
 *
 *  @discussion used to receive any recorded data in real time.
 *
 *  @param log An NSDictionary of record data received in real time.
 */
- (void)analyticsKitDidGetLog:(nonnull NSDictionary *)log;

@end

@interface JMapAnalyticsKit : NSObject

/*!
 *  Set Delegate
 *
 *  @discussion JMapAnalyticsKitDelegate used to utilize dispatching logs to the delegate. Refer to the delegate methods above.
 */
@property (nonatomic, weak, nullable) id<JMapAnalyticsKitDelegate> delegate;

/*!
 *  Shared Instance
 *
 *  @return An JMapAnalyticsKit singleton instance
 */
+ (nonnull id)sharedInstance;

/*!
 *  Set Logging Options
 *
 *  @discussion Optional API to set parameters to log in analytics.
 *
 *  @param loggingOptions set an array of NSString of logging options. Default is set to all.
 */
- (void)setLoggingOptions:(nonnull NSArray <NSString *>*)loggingOptions;

@end
