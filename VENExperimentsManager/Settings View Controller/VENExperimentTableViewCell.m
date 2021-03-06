#import "VENExperimentTableViewCell.h"

@implementation VENExperimentTableViewCell

- (void)configureWithExperiment:(VENExperiment *)experiment {
    self.experiment = experiment;
    
    self.nameLabel.text     = experiment.name;
    self.detailsLabel.text  = experiment.details;
    
    [self.enabledSwitch setOn:experiment.enabled animated:NO];
    [self.enabledSwitch setEnabled:experiment.userEditable];
    
    if (!experiment) {
        [self.enabledSwitch setOn:NO];
        [self.enabledSwitch setEnabled:NO];
    }
    
    self.detailsLabel.numberOfLines = 3;
    [self.detailsLabel sizeToFit];
}


- (IBAction)switchValueChanged:(id)sender {
    [VENExperimentsManager setExperimentWithIdentifier:self.experiment.identifier isEnabled:[((UISwitch *)sender) isOn]];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

@end
