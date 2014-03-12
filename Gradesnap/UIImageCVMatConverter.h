//
//  UIImageCVMatConverter.h
//  Gradesnap
//
//  Created by Nikko Schaff on 3/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageCVMatConverter : NSObject

+ (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;
+ (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat withUIImage:(UIImage*)image;
+ (cv::Mat)cvMatFromUIImage:(UIImage *)image;
+ (cv::Mat)cvMatGrayFromUIImage:(UIImage *)image;
+ (UIImage *)scaleAndRotateImageFrontCamera:(UIImage *)image;
+ (UIImage *)scaleAndRotateImageBackCamera:(UIImage *)image;

@end
