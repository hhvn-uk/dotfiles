use Irssi;

# it's recommended you use these alias':
# 	/alias part /randompq; /part
# 	/alias quit /randompq; /quit
# 	/alias disconnect /randompq; /disconnect

my $file = glob "~/.irssi/randompq.txt";
use vars qw($VERSION %IRSSI);

$VERSION = "0.0";
%IRSSI = (
	authors		=> "haydenh/hhvn",
	contact 	=> "haydenh @ irc.haydenvh.com",
	name		=> "Random part/quit",
	description 	=> "Implements the command /randompq that takes a random line from a file and sets it as the part & quit message",
	license		=> "WTFPL",
);

# heavily inspired by quitrand.pl
sub cmd_randompq {
	open(f,"<",$file);
	my @contenido = <f>;
	close(f);

	my $numlines = 0;
	foreach my $nada (@contenido) {
		$numlines++;
	}

	my $line = int(rand($numlines))+1;
	my $msg = $contenido[$line];

	chop($msg);
	Irssi::command('/^set part_message '.$msg);
	Irssi::command('/^set quit_message '.$msg);
}

Irssi::command_bind('randompq', 'cmd_randompq');
