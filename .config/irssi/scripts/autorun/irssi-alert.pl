# irssi-alert.pl
use Irssi;

# config
my $own_nick = 'haydenh';
my $channel = '#GNU/matrix';

$::VERSION='1';
%::IRSSI = (
	authors => 'haydenh',
	contact => 'haydenh@AT@sdf.DOT.org',
	name => 'irssi-alert',
	description => 'Send the \a escape code on a message containing a certain 
			string, in a private message, or a specified channel',
	license => 'MIT',
);

sub priv {
	system("echo -n '\a'");
}

sub pub {
	my ($server, $msg, $nick, $address, $target) = @_;

	if ($msg =~ $own_nick) {
		system("echo -n '\a'");
	} else {
		if ($target =~ $channel) {
			system("echo -n '\a'");
		}
	}
}

Irssi::signal_add('message public', 'pub');
Irssi::signal_add('message private', 'priv');
