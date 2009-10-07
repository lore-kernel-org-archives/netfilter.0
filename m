From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Correctly classifying iptables NAT beahaviour...
Date: Wed, 07 Oct 2009 13:21:15 +0200
Message-ID: <1254914475.31707.8.camel@enterprise.ims-firmen.de>
References: <4ACB3F84.1090107@ideaworkslabs.com>
	 <alpine.DEB.2.00.0910071222560.18065@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910071222560.18065@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Toby Bradshaw <Toby.Bradshaw@ideaworkslabs.com>, netfilter@vger.kernel.org

On Wed, 2009-10-07 at 12:26 +0200, Jozsef Kadlecsik wrote:
> As I wrote at netfilter-devel around May this year,
> 
> - According to the terminology of RFC 3489, netfilter implements port 
>   restricted cone NAT. If the --random flag is specified to the 
>   SNAT/MASQUERADE/... targets, it's better described as a symmetric NAT.


Hmm, seems I got it completely wrong, sorry about that.



use IO::Socket;


my $HOSTNAME="www.leo.org";
my $PORT1="33333";
my $PORT2="44444";

my $handle = IO::Socket::INET->new(Proto => 'udp', LocalPort => 22222);

my $ipaddr   = inet_aton($HOSTNAME);
my $portaddr1 = sockaddr_in($PORT1, $ipaddr);
my $portaddr2 = sockaddr_in($PORT2, $ipaddr);

send($handle, "test", 0, $portaddr1);
send($handle, "test", 0, $portaddr2);



results in the following two conntack entries (port restricted) =>

udp      17 25 src=<INTERNAL> dst=80.190.158.9 sport=22222 dport=33333
packets=1 bytes=32 [UNREPLIED] src=80.190.158.9 dst=<EXTERNAL>
sport=33333 dport=22222 packets=0 bytes=0 mark=0 use=1

udp      17 25 src=<INTERNAL> dst=80.190.158.9 sport=22222 dport=44444
packets=1 bytes=32 [UNREPLIED] src=80.190.158.9 dst=<EXTERNAL>
sport=44444 dport=22222 packets=0 bytes=0 mark=0 use=1


And in the following with --random (symmetric) =>

udp      17 28 src=<INTERNAL> dst=80.190.158.9 sport=22222 dport=44444
packets=1 bytes=32 [UNREPLIED] src=80.190.158.9 dst=<EXTERNAL>
sport=44444 dport=3407 packets=0 bytes=0 mark=0 use=1

udp      17 28 src=<INTERNAL> dst=80.190.158.9 sport=22222 dport=33333
packets=1 bytes=32 [UNREPLIED] src=80.190.158.9 dst=<EXTERNAL>
sport=33333 dport=6327 packets=0 bytes=0 mark=0 use=1


