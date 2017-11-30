# Sample preprocessing code, change or update according to the need
# change below file name to according to your need
open RREAD,'<dataset.txt';
@lines = <RREAD>;
close RREAD;

for $ln (@lines){
	chomp $ln;
	$ln = lc($ln);
	$ln =~ s/\&nbsp;/ /g;
	$ln =~ s/\<[^>]*\>/ /g;
	$ln =~ s/<[^>]+\/      >/ /g;
	$ln =~ s/\<\/[^>]*\>/ /g;
	$ln =~ s/<img[^>]*\>/ /g;
	$ln =~ s/&quot;/ /g;
	$ln =~ s/&quot/ /g;
	$ln =~ s/quot;/ /g;
	$ln =~ s/&amp;/ /g;
	$ln =~ s/&amp/ /g;
	$ln =~ s/amp;/ /g;
	$ln =~ s/\<!-- rich text --\>//g;
	$ln =~ s/\&#039;/'/g;
	$ln =~ s/\&gt;/ > /g;
	$ln =~ s/gt;/ > /g;
	$ln =~ s/\&lt;/ < /g;
	$ln =~ s/lt;/ < /g;
	$ln =~ s/\<[^>]*\>/ /g;
	$ln =~ s/<[^>]+\/\s+>/ /g;
	$ln =~ s/\<br \/\>/ /g;
	$ln =~ s/\(/ \( /g;
	$ln =~ s/\)/ \) /g;
	$ln =~ s/([a-zA-Z]):/\1 :/g;
	$ln =~ s/:([a-zA-Z])/: \1/g;
	$ln =~ s/[\d]+:[\d]+:[\d]+/ /g;
	$ln =~ s/[\d]+\/[\d]+\/[\d]+/ /g;
	$ln =~ s/[-]+/ - /g;
	$ln =~ s/[=]+/ = /g;

	$ln =~ s/aren't/are not/g;
	$ln =~ s/can't/cannot/g;
	$ln =~ s/didn't/did not/g;
	$ln =~ s/doesn't/does not/g;
	$ln =~ s/don't/do not/g;
	$ln =~ s/haven't/have not/g;
	$ln =~ s/here's/here is/g;
	$ln =~ s/isn't/is not/;
	$ln =~ s/it's/it is/g;
	$ln =~ s/i've/i have/g;
	$ln =~ s/shouldn't/should not/g;
	$ln =~ s/we're/we are/g;
	$ln =~ s/weren't/were not/g;
	$ln =~ s/we've/we have/g;
	$ln =~ s/won't/will not/g;
	$ln =~ s/what's/what is/g;
	$ln =~ s/you'll/you will/g;
	$ln =~ s/sync'd/synced/g;
	$ln =~ s/i'd/i would/g;
	$ln =~ s/t'est/ /g;
	$ln =~ s/'s/ /g;
	$ln =~ s/they're/they are/g;
	$ln =~ s/isn't/is not/;
	$ln =~ s/isn'r/is not/;

	$ln =~ s/<img.*//;
	$ln =~ s/([a-z0-9])'/\1 '/g;
	$ln =~ s/'([a-z0-9])/' \1/g;
	$ln =~ s/ +/ /g;
	$ln =~ s/"//g;
	$ln =~ s/^\s+//g;
	$ln =~ s/\s+$//g;
	print $ln,"\n";
}
