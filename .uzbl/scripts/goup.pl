#!/usr/bin/perl

my ($config,$pid,$xid,$fifo,$socket,$url,$title,$cmd) = @ARGV;
if($fifo eq "") { die "No fifo"; };

# Delete last slash
chop($url);

my $index = index(reverse($url), '/');

# if youre already on top of the directory structure
if ($index == -1)
{
	print $url;	
	exit;
}

# Workaround for missing reverse index
$url = (substr(reverse($url), $index, length($url) ));
$url = reverse($url);
print $url."\n";

# This could look prettier with native fifo access
qx(echo "act uri $url" >> $fifo);
