From: Craig Sanders <cas@taz.net.au>
Subject: idea for iptables
Date: Tue, 9 Nov 2004 08:38:19 +1100
Message-ID: <20041108213819.GE4384@taz.net.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


it would be useful when Appending or Inserting a rule into a chain, to be able
to specify an expiry time for that rule, so that it was automatically deleted
after N seconds, e.g. "--rule_expire 3600" for 1 hour, or "--rule_expire 86400"
for 1 day.

that would be very handy for writing log-watcher scripts (see below for
example) without having to worry about cleaning up old rules - just Insert the
rule with the desired expiry time and forget about it.

the Q&D example below is for postfix (to block connections from spammers who
just keep on trying).  the same idea could be used for monitoring apache logs
or whatever to block connections from annoying IIS worms.  the script is twice
as complicated as it needs to be (and worse, has to iterate through and check
each IP address that has been blocked EVERY time it reads in a line from the
log file) just to auto-expire the rules after one hour.


---cut here---
#!/usr/bin/perl

use File::Tail ;

$logfile = '/var/log/mail.log' ;
$debug = 0;

my $logref=tie(*LOG,"File::Tail",(name=>$logfile,debug=>$debug));

while (<LOG>) {
  chomp;

  # automatically block smtp connections from spammers who won't take no for an answer.
  # too many errors after RCPT from unknown[218.39.165.105]
  if (/too many errors after RCPT/i) {
    s/.*\[([0-9.]*)\].*/$1/;
    my $ip = $_;
    next if $IP{$ip};
    my $now = time; 
    $cmd = "/sbin/iptables -I INPUT -j DROP -s $ip -p TCP --dport 25";
    system($cmd);
    #$cmd = "/sbin/iptables -I INPUT -j DROP -s $ip -p TCP --dport 25 # $now\n";
    #print($cmd);
    $IP{$ip} = $now ;
  } ;


  # check if it's time to remove iptables rules
  my $now = time; 
  foreach $ip (keys %IP) {
    if (($now - $IP{$ip}) > 3600) {  # 1 hour
      $cmd = "/sbin/iptables -D INPUT -j DROP -s $ip -p TCP --dport 25\n";
      system($cmd);
      #$cmd = "/sbin/iptables -D INPUT -j DROP -s $ip -p TCP --dport 25 # " . $IP{$ip} . " $now\n";
      #print($cmd);
      delete $IP{$ip};
    };
  };
} ;

untie $logref ;
---cut here---

craig

-- 
craig sanders <cas@taz.net.au>           (part time cyborg)


