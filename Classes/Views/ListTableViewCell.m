//
//  ListTableViewCell.m
//  Senbei
//
//  Created by Adrian on 2/15/10.
//  Copyright (c) 2010, akosma software / Adrian Kosmaczewski
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//  1. Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//  3. All advertising materials mentioning features or use of this software
//  must display the following acknowledgement:
//  This product includes software developed by akosma software.
//  4. Neither the name of the akosma software nor the
//  names of its contributors may be used to endorse or promote products
//  derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY ADRIAN KOSMACZEWSKI ''AS IS'' AND ANY
//  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL ADRIAN KOSMACZEWSKI BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "ListTableViewCell.h"
#import "AKOImageView.h"

@implementation ListTableViewCell

@dynamic photoView;

#pragma mark -
#pragma mark Static methods

+ (ListTableViewCell *)cellWithReuseIdentifier:(NSString *)reuseIdentifier
{
    ListTableViewCell *cell = [[ListTableViewCell alloc] initWithReuseIdentifier:reuseIdentifier];
    return [cell autorelease];
}

#pragma mark -
#pragma mark Init and dealloc

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle
                    reuseIdentifier:reuseIdentifier]) 
    {
    }
    return self;
}

- (void)dealloc 
{
    [_photoView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Overridden methods

- (void)layoutSubviews 
{
    // This trick is borrowed from
    // http://stackoverflow.com/questions/1132029/labels-aligning-in-uitableviewcell
    [super layoutSubviews];
    if (!_photoView.hidden)
    {
        CGRect rect = self.textLabel.frame;
        self.textLabel.frame = CGRectMake(rect.origin.x + 60.0, 
                                          rect.origin.y,
                                          210.0, 
                                          rect.size.height);
        rect = self.detailTextLabel.frame;
        self.detailTextLabel.frame = CGRectMake(rect.origin.x + 60.0, 
                                          rect.origin.y,
                                          210.0, 
                                          rect.size.height);
    }
}

#pragma mark -
#pragma mark Overridden properties

- (AKOImageView *)photoView
{
    if (_photoView == nil)
    {
        _photoView = [[AKOImageView alloc] initWithFrame:CGRectMake(5.0, 5.0, 50.0, 50.0)];
        [self.contentView addSubview:_photoView];
    }
    return _photoView;
}

@end
