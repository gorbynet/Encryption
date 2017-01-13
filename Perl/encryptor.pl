use strict;

my $mod = 26;

my $plain_text = "ILOVEYOU";
my $key___text = "ORLIKEST";
my $ciphertext;

my @plain_text = split "", $plain_text;
my @key___text = split "", $key___text;
my @ciphertext;

my @num_ciphertext;
my @num_plain_text;
my @num_key___text;

my $plain_text_ascii_string;
my $key___text_ascii_string;
foreach (@plain_text) {
	$plain_text_ascii_string .= sprintf("%02d", ord($_) - 65) . "\t";
	push @num_plain_text, ord($_) - 65;
}

foreach (@key___text) {
	$key___text_ascii_string .= sprintf("%02d", ord($_) - 65) . "\t";
	push @num_key___text, ord($_) - 65;
}
print "Encoding\n";
print "Message:\t" . join("\t", @plain_text) . "\n";
print "charnum:\t" . $plain_text_ascii_string . "\n";
print "\n";
print "Key:    \t" . join("\t", @key___text) . "\n";
print "charnum:\t" . $key___text_ascii_string . "\n\n";

my $sum_ascii_string;
my $mod_ascii_string;

for my $i (0..$#num_plain_text) {
	my $sum = $num_plain_text[$i] + $num_key___text[$i];
	$sum_ascii_string .= sprintf("%02d", $sum) . "\t";
	$mod_ascii_string .= sprintf("%02d", $sum % $mod) . "\t";
	push @ciphertext, chr(($sum % $mod) + 65);
	push @num_ciphertext, ($sum % $mod);
}

print "Sum:    \t" . $sum_ascii_string . "\n\n";
print "Mod $mod: \t" . $mod_ascii_string . "\n\n";
print "Cipher: \t" . join("\t", @ciphertext) . "\n\n";

print "Decoding\n";
print "Cipher: \t" . join("\t", @ciphertext) . "\n";
print "Charnum:\t" . $mod_ascii_string . "\n\n";
print "Key:    \t" . join("\t", @key___text) . "\n";
print "charnum:\t" . $key___text_ascii_string . "\n\n";

undef $sum_ascii_string;
undef $mod_ascii_string;

my @message;

for my $i (0..$#num_ciphertext) {
	my $sum = $num_ciphertext[$i] - $num_key___text[$i];
	$sum_ascii_string .= sprintf("%02d", $sum) . "\t";
	$mod_ascii_string .= sprintf("%02d", $sum % $mod) . "\t";
	push @message, chr(($sum % $mod) + 65);
}

print "Diff:   \t" . $sum_ascii_string . "\n\n";
print "Mod $mod: \t" . $mod_ascii_string . "\n\n";
print "Message:\t" . join("\t", @message) . "\n\n";

