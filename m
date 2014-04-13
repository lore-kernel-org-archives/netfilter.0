From: Laurent GUERBY <laurent@guerby.net>
Subject: Re: nftables: nft @nh segfault
Date: Sun, 13 Apr 2014 10:12:39 +0200
Message-ID: <1397376759.15058.882.camel@pc2>
References: <1396179281.15058.469.camel@pc2>
	 <20140404095533.GA4413@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140404095533.GA4413@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Fri, 2014-04-04 at 11:55 +0200, Pablo Neira Ayuso wrote:
> On Sun, Mar 30, 2014 at 01:34:41PM +0200, Laurent GUERBY wrote:
> > Hi,
> > 
> > While trying to use @nh I got nft to segfault:
> > 
> > root@h7:~# nft --version
> > nftables v0.100 (keith-alexander-filter)
> > root@h7:~# cat /proc/version 
> > Linux version 3.14-rc7-amd64 (debian-kernel@lists.debian.org) (gcc
> > version 4.8.2 (Debian 4.8.2-16) ) #1 SMP Debian 3.14~rc7-1~exp1
> > (2014-03-17)
> > root@h7:~# nft add rule filter output @nh,16,4 8.8.8.8 counter
> > Segmentation fault
> 
> that shouldn't crash indeed. Please, retry with latest git snapshot
> and if the problem is still there file a bug to netfilter's bugzilla.
> Thanks.

Hi,

Sorry for the delay, since the segfault is present with latest git I
filed with backtrace and poking around:

https://bugzilla.netfilter.org/show_bug.cgi?id=915

And a minor configure bug:

https://bugzilla.netfilter.org/show_bug.cgi?id=914

> > I infered the syntax from src/parser.y:
> > 
> > payload_raw_expr	:	AT	payload_base_spec	COMMA	NUM	COMMA	NUM
> > payload_base_spec	:	LL_HDR		{ $$ = PAYLOAD_BASE_LL_HDR; }
> > 			|	NETWORK_HDR	{ $$ = PAYLOAD_BASE_NETWORK_HDR; }
> > 
> > 
> > But may be I made a mistake, I could not find documentation.
> 
> Have a look at http://wiki.nftables.org
> 
> Let me know if you find some missing information, I'll schedule time
> to expand/enhance it.


Thanks for the offer, I will report on it in another thread. 

My ultimate goal is to check wether nftables supports (or could support)
stateless IPv4 NAT 1:1 using maps, ie replace a list of:

iptables -t nat -A PREROUTING -d $ip1 -j DNAT --to-destination $ipn1
iptables -t nat -A POSTROUTING -s $ipn1 -j SNAT --to-source $ip1
...

by something like:

nft map { $ip1 => $ipn1 , $ip2 => $ipn2, ... }

My use case is a large RFC1918 LAN ($ipnX) where we give unfiltered
public IP ($ipX) to only a small subset of those. This allows us not to
waste public IPv4 with large mostly empty and pre-sized interco subnets
(and yes we're dual stack and we route /56 per end-user in IPv6 :).

Stateless NAT should work perfectly with high performance
and very low/bounded memory usage in this case.

iproute2 had stateless NAT a while ago but it was removed, iptables I
couldn't find (hard to do efficiently without maps), some say tc has it
through patches.

Sincerely,

Laurent

