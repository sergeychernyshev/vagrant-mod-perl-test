#!/usr/bin/perl

use DBI;

print "Content-type: text/plain\n\n";
print "mod_perl 2.0 works!\n";

my $dbh = DBI->connect
      ("DBI:mysql:wikitrends:10.0.2.2", 'wikitrends', '...pass...',
       {
        PrintError => 1, # warn() on errors
        RaiseError => 0, # don't die on error
        AutoCommit => 1, # commit executes immediately
       }
      ) or die "Cannot connect to database: $DBI::errstr";

$sql = "SELECT * FROM  `calendar` ORDER BY  `calendar`.`doy` ASC LIMIT 0 , 30";
$sth = $dbh->prepare($sql);
$sth->execute or die "SQL Error: $DBI::errstr\n";
while (@row = $sth->fetchrow_array) {
	print "@row\n";
} 
