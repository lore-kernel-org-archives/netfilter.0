From: Jason Opperisano <opie@817west.com>
Subject: RE: How to block only MX query made to DNS server
Date: Tue, 30 Nov 2004 08:17:50 -0500
Message-ID: <1101820669.2881.11.camel@hubcap.ljm.dom>
References: <20041130072636.72194.qmail@web12308.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041130072636.72194.qmail@web12308.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Tue, 2004-11-30 at 02:26, pravin rane wrote:
> Dear Hudson,
> 
> We are in to the Linux Solution provider.
> 
> One of our client has taken SILVER PLAN from XXX ISP
> According to this plan the client can only use ports
> TCP, UDP. 53,25,110,143,80,81 and ports above 1024 for
> out side.
> Here client can only make normal DNS queries. MX type
> of queries get response like "name server can not be
> reached" .
> 
> We have installed an Internal Mail-server (Sendmail).
> Since ISP have blocked MX query to any DNS server
> Out-side sendmail is not able to send mails out-side. 
> 
> I know I can tell sendmail not to use DNS. But before
> implementing this new setup at client I want to test
> it in my LABS. I want to create the same scenario as
> that ISP have done.
> 
> Seeking Urgent help form Netfilter Experts.
> 
> Bye 
> Pravin

you could also do this (since it's a lab scenario):

1)  make sure your firewall points to whatever DNS server you wish and
can resolve whatever RR types you wish.

2)  use these rules to redirect DNS traffic to what we will call a
"lightweight" DNS proxy on the firewall:

    iptables -t nat -A PREROUTING -i $INSIDE_IF -p udp --dport 53 \
      -j REDIRECT --to-ports 5353

    iptables -A INPUT -i $INSIDE_IF -p udp --dport 5353 -j ACCEPT

3)  grab the Net::DNS perl module and run the following script which
should resolve any query but MX:

--- BEGIN PERL SCRIPT ---
#!/usr/bin/perl

use strict;
use Net::DNS;
use Net::DNS::Nameserver;
use Net::DNS::Resolver;

my $listenip = "127.0.0.1";
my $listenport = "5353";
my $verbose = 1;

my $ns = Net::DNS::Nameserver->new(
       LocalAddr        => $listenip,
       LocalPort        => $listenport,
       ReplyHandler     => \&reply_handler,
       Verbose          => $verbose
);

sub reply_handler {
  my ($qname, $qclass, $qtype, $peerhost) = @_;
  my ($rcode, @ans, @auth, @add);

  if ($qtype eq "MX") {
    $rcode = "NXDOMAIN";
    return ($rcode, \@ans, \@auth, \@add, { aa => 1 });
  } else {
    my $res   = Net::DNS::Resolver->new;
    my $query = $res->search("$qname", "$qtype", "$qclass");
    if ($query) {
      foreach my $rr ($query->answer) {
        next if $rr->type eq "CNAME";
        push @ans, Net::DNS::RR->new($rr->string);
        $rcode = "NOERROR";
        return ($rcode, \@ans, \@auth, \@add);
      }
    }
  }
}

$ns->main_loop;
---  END PERL SCRIPT  ---

  $ dig yahoo.com mx

should return a list of mail servers; whereas,

  $ dig @127.0.0.1 -p 5353 yahoo.com mx

should not.

i do not believe in the string match.

-j

--
"I'm not a bad guy! I work hard, and I love my kids. So why should
 I spend half my Sunday hearing about how I'm going to Hell?"
	--The Simpsons


