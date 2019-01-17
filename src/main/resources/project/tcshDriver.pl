# -------------------------------------------------------------------------
# Package
#    tcshDriver.pl
#
# Dependencies
#    None
#
# Purpose
#    Executes Tcsh code
#
# Template Version
#    1.0
#
# Date
#    11/03/2011
#
# Engineer
#    Carlos Rojas
#
# Copyright (c) 2011 Electric Cloud, Inc.
# All rights reserved
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# Includes
# -------------------------------------------------------------------------
use ElectricCommander;
use warnings;
use strict; 
$|=1;


########################################################################
# main - contains the whole process to be done by the plugin, it builds 
#        the command line, sets the properties and the working directory
#
# Arguments:
#   -none

#
# Returns:
#   -nothing
#
########################################################################
sub main {
    
    #create a property hash
    my %props;
    my $ec = ElectricCommander->new();
    $ec->abortOnError(0);
    my $tcshCommand = ($ec->getProperty( "tcshCommand" ))->findvalue('//value')->string_value;

   $props{"tcshCommandLine"} = $tcshCommand;
   
    setProperties(\%props);
}

sub setProperties {

    my ($propHash) = @_;

    # get an EC object
    my $ec = new ElectricCommander();
    $ec->abortOnError(0);

    foreach my $key (keys % $propHash) {
        my $val = $propHash->{$key};
        $ec->setProperty("/myCall/$key", $val);
    }
}

main();
