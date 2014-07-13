//
//  RatingViewController.h
//  RatingController
//
//  Created by Ajay on 2/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RatingView;

@protocol RatingViewDelegate
@optional
- (void)ratingChanged:(float)newRating;
- (void)ratingView:(RatingView *)ratingView DidChangeRating:(float)rating;
@end


@interface RatingView : UIView {
	UIImageView *s1, *s2, *s3, *s4, *s5;
	UIImage *unselectedImage, *partlySelectedImage, *fullySelectedImage;
	id<RatingViewDelegate> viewDelegate;

	float starRating, lastRating;
	float height, width,space; // of each image of the star!
}

@property (nonatomic, retain) UIImageView *s1;
@property (nonatomic, retain) UIImageView *s2;
@property (nonatomic, retain) UIImageView *s3;
@property (nonatomic, retain) UIImageView *s4;
@property (nonatomic, retain) UIImageView *s5;
@property (assign , nonatomic) CGFloat itemWidth;

-(void)setImagesDeselected:(NSString *)deselectedImage
			partlySelected:(NSString *)halfSelectedImage
			  fullSelected:(NSString *)fullSelectedImage
			   andDelegate:(id<RatingViewDelegate>)d
                     space:(CGFloat)s;

-(void)displayRating:(float)rating;
-(float)rating;

@end
