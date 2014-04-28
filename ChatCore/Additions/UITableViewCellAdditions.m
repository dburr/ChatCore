#import "UITableViewCellAdditions.h"
#import "UITableViewAdditions.h"

@implementation UITableViewCell (UITableViewCellColloquyAdditions)
+ (id) reusableTableViewCellInTableView:(UITableView *) tableView {
	return [self reusableTableViewCellInTableView:tableView withIdentifier:NSStringFromClass([self class])];
}

+ (id) reusableTableViewCellWithStyle:(UITableViewCellStyle) style inTableView:(UITableView *) tableView {
	NSString *identifierFormat = nil;

	switch (style) {
	case UITableViewCellStyleDefault:
		identifierFormat = @"%@:UITableViewCellStyleDefault";
		break;
	case UITableViewCellStyleValue1:
		identifierFormat = @"%@:UITableViewCellStyleValue1";
		break;
	case UITableViewCellStyleValue2:
		identifierFormat = @"%@:UITableViewCellStyleValue2";
		break;
	case UITableViewCellStyleSubtitle:
		identifierFormat = @"%@:UITableViewCellStyleSubtitle";
		break;
	}

	NSString *identifier = [[NSString alloc] initWithFormat:identifierFormat, NSStringFromClass([self class])];
	id cell = [self reusableTableViewCellWithStyle:style inTableView:tableView withIdentifier:identifier];
	[identifier release];

	return cell;
}

+ (id) reusableTableViewCellInTableView:(UITableView *) tableView withIdentifier:(NSString *) identifier {
	return [self reusableTableViewCellWithStyle:UITableViewCellStyleDefault inTableView:tableView withIdentifier:identifier];
}

+ (id) reusableTableViewCellWithStyle:(UITableViewCellStyle) style inTableView:(UITableView *) tableView withIdentifier:(NSString *) identifier {
	id cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell) return cell;

	return [[[[self class] alloc] initWithStyle:style reuseIdentifier:identifier] autorelease];
}

#pragma mark -

- (void) performAction:(SEL) action sender:(id) sender {
	UITableView *tableView = (UITableView *)self.superview;
	if (![tableView isKindOfClass:[UITableView class]])
		return;

	[tableView performAction:action forCell:self sender:sender];
}

#pragma mark -

- (void) join:(id) sender {
	[self performAction:_cmd sender:sender];
}

- (void) leave:(id) sender {
	[self performAction:_cmd sender:sender];
}

- (void) connect:(id) sender {
	[self performAction:_cmd sender:sender];
}

- (void) disconnect:(id) sender {
	[self performAction:_cmd sender:sender];
}

@end
