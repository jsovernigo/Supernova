#!/usr/bin/perl


use warnings;
use strict;
use version;

my $f_path = "assets/";

my $choice;
$choice = '0';

#
#getYear
#this function gets a year from the user.
#IN:    A message to be printed.
#OUT:   A year as inputted by the user.
#POST:  N/A
#ERROR: msg is invalid.
#
sub getYear
{
    my $msg = shift;
    my $year;

    print $msg."\n";

    $year = <>;
    chomp $year;

    while(not($year =~ /^[0-9]+$/))
    {
        $year = <>;
        chomp $year;
    }

    return int($year);
}

sub choose
{
    my $msg = shift;
    print $msg."\n";
    my $resp = <>;
    chomp $resp;
    return $resp;
}

sub warn_user
{
    print "Sorry, that input wasn't valid.\n";
}

print "Welcome to the Supernova Trend Engine, Alpha v1.0\nPlease note that data aggregated in these statistics may not be entirely accurate,\nas some deaths may not have been reported, recorded, or calculated properly in this software.\nDo not assume any data is entirely accurate as it is presented here.\n\n";

while($choice ne 'q' and $choice ne "quit" and $choice ne '3')
{
    $choice = choose("Please enter your choice:\n1) Birth Stats\n2) Death Stats\n3) Exit");
    if($choice eq '1')# or index("birth", $choice) != -1) # we chose the birth menu
    {
        $choice = '0';
        while(not($choice ne '2' and index("back", $choice) != -1)) # while we havent chosen back
        {
            $choice = choose("Please select an option:\n1) Birth Weight by Month stats\n2) Mother Birth Age stats\n3) Back");
            if($choice eq "1" or index("birth weight", $choice) != -1)
            {
                my $year = 1996;
                $year = getYear("Please enter a year to examine (1996-2014)");
                while($year < 1996 or $year > 2014) # invalid start year.
                {
                    $year = getYear("Please enter a starting year (1996-2014)");
                }
                system("./src/birthWeight.pl $year"); # call birth weight script 
            }
            elsif($choice eq "2" or index("Mother Birth Age stats", $choice) != -1)
            {
                my $syear = 1996;
                my $eyear = 2014;
                $syear = getYear("Please enter a starting year (1996-2013)");
                while($syear < 1996 or $syear > 2013) # invalid start year.
                {
                    warn_user();
                    $syear = getYear("Please enter a starting year (1996-2013)");
                }

                $eyear = getYear("Please enter an ending year (1997-2014)");
                while($eyear < 1997 or $eyear > 2014 or $eyear <= $syear) # while the end year is invalid
                {
                    warn_user();
                    $eyear = getYear("Please enter an ending year (1997-2014)");
                }
                print "\nWorking...\n\n";
                system("./src/motherBirth.pl $syear $eyear $f_path");

            }
            elsif($choice eq "3" or index("back", $choice) != -1)
            {
                $choice = 0;
                last;
            }
        }

    }
    elsif($choice eq '2') # if we selected the death menu
    {
        $choice = 0;
        while(not($choice ne '5' and index("back", $choice) != -1)) # while we havent chosen back
        {
            $choice = choose("Please select an option:\n1) Education and Death Rate stats\n2) Homicide Rates by Race stats\n3) Marriage and Manner of Death stats\n4) Teen Suicide Rates by Year stats\n5) Back");
            if($choice eq '1' or index("education and death rate stats", $choice) != -1) # Education + DR
            {
                my $syear = 1996;
                my $eyear = 2014;
                $syear = getYear("Please enter a starting year (1996-2013)");
                while($syear < 1996 or $syear > 2013) # invalid start year.
                {
                    warn_user();
                    $syear = getYear("Please enter a starting year (1996-2013)");
                }

                $eyear = getYear("Please enter an ending year (1997-2014)");
                while($eyear < 1997 or $eyear > 2014 or $eyear <= $syear) # while the end year is invalid
                {
                    warn_user();
                    $eyear = getYear("Please enter an ending year (1997-2014)");
                }
                print "\nWorking...\n\n";
                system("./src/educationAndDeath.pl $syear $eyear $f_path");
            }
            elsif($choice eq '2' or index("homicide rates by race stats", $choice) != -1) # Homicide by race
            {
                my $syear = 1996;
                my $eyear = 2014;
                $syear = getYear("Please enter a starting year (1996-2013)");
                while($syear < 1996 or $syear > 2013) # invalid start year.
                {
                    warn_user();
                    $syear = getYear("Please enter a starting year (1996-2013)");
                }

                $eyear = getYear("Please enter an ending year (1997-2014)");
                while($eyear < 1997 or $eyear > 2014 or $eyear <= $syear) # while the end year is invalid
                {
                    warn_user();
                    $eyear = getYear("Please enter an ending year (1997-2014)");
                }
                print "\nWorking...\n\n";
                system("./src/homicideAndRace.pl $syear $eyear $f_path");
            }
            elsif($choice eq '3' or index("marriage and manner of death stats", $choice) != -1) # marriage and manner of death
            {
                my $syear = 1996;
                my $eyear = 2014;
                $syear = getYear("Please enter a starting year (1996-2013)");
                while($syear < 1996 or $syear > 2013) # invalid start year.
                {
                    warn_user();
                    $syear = getYear("Please enter a starting year (1996-2013)");
                }

                $eyear = getYear("Please enter an ending year (1997-2014)");
                while($eyear < 1997 or $eyear > 2014 or $eyear <= $syear) # while the end year is invalid
                {
                    warn_user();
                    $eyear = getYear("Please enter an ending year (1997-2014)");
                }
                print "\nWorking...\n\n";
                system("./src/marriageAndDeath.pl $syear $eyear $f_path");
            }
            elsif($choice eq '4' or index("teen suicide rates by year stats", $choice) != -1) # teen suicide
            {
                my $syear = 1996;
                my $eyear = 2014;
                $syear = getYear("Please enter a starting year (1996-2013)");
                while($syear < 1996 or $syear > 2013) # invalid start year.
                {
                    warn_user();
                    $syear = getYear("Please enter a starting year (1996-2013)");
                }

                $eyear = getYear("Please enter an ending year (1997-2014)");
                while($eyear < 1997 or $eyear > 2014 or $eyear <= $syear) # while the end year is invalid
                {
                    warn_user();
                    $eyear = getYear("Please enter an ending year (1997-2014)");
                }
                print "\nWorking...\n\n";
                system("./src/suicideGrowthRate.pl $syear $eyear");            
            }
            elsif($choice eq '5' or index("back", $choice) != -1)
            {
                last;
            }
        }
    }
    elsif($choice eq '3' or index("quit", $choice) != -1)# quit selected
    {
        $choice = choose("Are you sure you want to quit?"); 
        while(index("Yesyes", $choice) == -1 and index("Nono", $choice) == -1) # the user hasn't given valid input
        {
            $choice = choose("Are you sure you want to quit?");
        }
        if(index("Yesyes", $choice) != -1)
        {
            last;
        }
    }
}

print "Goodbye!\n";
