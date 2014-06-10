# ho_manage.pl
#
# $Id: ho_manage.pl,v 1.3 2004/10/24 12:10:08 jvunder REL_0_3 $
#
# Part of the Hybrid Oper Script Collection.
#
# Manages all HOSC scripts.

use strict;
use vars qw($VERSION %IRSSI $SCRIPT_NAME);

use Irssi;
use HOSC::again;
use HOSC::again 'HOSC::Base';
use HOSC::again 'HOSC::Tools';

eval {
	require_again("LWP::UserAgent");
};
if ($@) {
	Irssi::print("You need LWP::UserAgent for this script. Please install ".
		"it.");
	return 0;
}

# This is the file that contains the most recent CVS versions of each
# script and each module.
my $VERSION_FILE_URI = 'http://garion.org/hosc/data/hosc_versions.txt';

# This file contains the most recent stable release.
my $RELEASE_FILE_URI = 'http://garion.org/hosc/data/RELEASE';

# The local file which tells us which release we're using.
my $CURRENT_VERSION_FILE = Irssi::get_irssi_dir() . '/scripts/HOSC/VERSION';

# ---------------------------------------------------------------------

($VERSION) = '$Revision: 1.3 $' =~ / (\d+\.\d+) /;
%IRSSI = (
    authors	    => 'Garion',
    contact	    => 'garion@efnet.nl',
    name	    => 'ho_manage',
    description	=> 'Manages all HOSC scripts.',
    license	    => 'Public Domain',
    url		    => 'http://garion.org/hosc/',
    changed	    => '19 October 2004 22:27:30',
);
$SCRIPT_NAME = 'Manage';

# ---------------------------------------------------------------------

sub cmd_manage {
    my ($data, $server, $item) = @_;
    if ($data =~ m/^[(help)|(check)]/i ) {
        Irssi::command_runsub ('manage', $data, $server, $item);
		return;
    }

    ho_print("Use /MANAGE HELP for help.");
}

# ---------------------------------------------------------------------

sub cmd_manage_help {
    print_help();
}

# ---------------------------------------------------------------------

sub cmd_manage_check {
    my ($data, $server, $item) = @_;

    ho_print("Checking versions of loaded scripts.");

    my $version = get_current_version();

    if ($version eq "CVS") {
        check_cvs();
    } else {
        check_stable($version);
    }
}

sub get_current_version {
    # If there is no version file, assume we're running CVS.
    if (!-f $CURRENT_VERSION_FILE) {
        ho_print_warning("No version file $CURRENT_VERSION_FILE found. " .
            "Assuming that we're running CVS.");
        return "CVS";
    }
    
    open(F, $CURRENT_VERSION_FILE) or
        ho_print_error("Could not open current version file: $!"),
        return "CVS";
    
    my $version = <F>;
    chomp $version;
    close F or
        ho_print_error("Could not open current version file: $!"),
        return "CVS";

    return $version;
}

sub check_stable {
    my ($current_version) = @_;

    my $ua = LWP::UserAgent->new;
    my $response = $ua->get($RELEASE_FILE_URI);

    if (!$response->is_success) {
        ho_print_error("Could not retrieve $RELEASE_FILE_URI: " .
            $response->status_line);
        return;
    }

    my $remote_version;

    if ($response->content =~ /^(\d+\.\d+)/) {
        $remote_version = $1;
    } else {
        ho_print_error("Got unexpected data in release uri; expected ".
            "<number>.<number>, but got " . $response->content);
        return;
    }
        
    if ($remote_version > $current_version) {
        ho_print("You are running stable release $current_version, but ".
            "$remote_version is the latest stable release.");
    } else {
        ho_print("You are running stable release $current_version, which ".
            "is the latest.");
    }
}

sub check_cvs() {
    # Get the version file first.
    my $ua = LWP::UserAgent->new;
    my $response = $ua->get($VERSION_FILE_URI);

    if (!$response->is_success) {
        ho_print_error("Could not retrieve $VERSION_FILE_URI: " .
            $response->status_line);
        return;
    }
  
    # Obtain currently loaded ho_ scripts.
    my %hosc_scripts;
    my %scripts = %Irssi::Script::;
    my $num_out_of_date = 0;
    no strict 'refs';
    for my $name (sort keys %scripts) {
        next unless $name =~ /ho_/;
        $name =~ s/:://;
        $hosc_scripts{"$name.pl"}->{version} = 
            ${ "Irssi::Script::${name}::VERSION" };
    }
    
    # Do a version check on all of them.
    for my $line (split /\n/, $response->content) {
        if ($line =~ /^(ho_.*.pl)\s+(\d+\.\d+)$/) {
            my ($script, $version) = ($1, $2);
            if ($hosc_scripts{$script}) {
                if ($hosc_scripts{$script}->{version} < $version) {
                    $num_out_of_date++;
                    ho_print("$script " . (' ' x (20 - length $script)) .
                        "loaded " . 
                        $hosc_scripts{$script}->{version} .
                        " - available " . $version) . ".";
                }
            }
        }
    }
   
    if ($num_out_of_date == 0) {
        ho_print("All scripts up to date.");
    } elsif ($num_out_of_date == 1) {
        ho_print("One script out of date.");
    } else {
        ho_print("$num_out_of_date scripts out of date.");
    }
}

# ---------------------------------------------------------------------

ho_print_init_begin();

Irssi::command_bind('manage',       'cmd_manage');
Irssi::command_bind('manage help',  'cmd_manage_help');
Irssi::command_bind('manage check', 'cmd_manage_check');

ho_print_init_end();
ho_print("Use /MANAGE HELP for help.");

# ---------------------------------------------------------------------

sub print_help {
    ho_print_help('head', $SCRIPT_NAME);

    ho_print_help('section', 'Description');
    ho_print_help("This script can be used to keep your HOSC collection ".
        "up to date. For the moment it can only check which versions you ".
        "have loaded, and which are available on the website.");
    ho_print_help("To check how up to date your scripts are, use ".
        "/MANAGE CHECK");
    ho_print_help("No downloads yet. Just checking. That'll be in the next ".
        "version!");

    ho_print_help('section', 'Syntax');
    ho_print_help('syntax', 'MANAGE HELP');
    ho_print_help('syntax', 'MANAGE CHECK');
}

# ---------------------------------------------------------------------

