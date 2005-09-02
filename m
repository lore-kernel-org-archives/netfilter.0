From: Andrew Gargan <andrew@iface.co.za>
Subject: Re: NAT and ISP problem: clamp-tcpmss-to-pmtu did not resolve...
Date: Fri, 02 Sep 2005 13:32:39 +0200
Message-ID: <1125660759.6332.23.camel@andrew.iface.lan>
References: <001501c5afaf$02c1a570$0300a8c0@giacomino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001501c5afaf$02c1a570$0300a8c0@giacomino>
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
To: Giacomo <delleceste@gmail.com>
Cc: Netfilter List <netfilter@lists.netfilter.org>

On Fri, 2005-09-02 at 13:10, Giacomo wrote:
> Thanks a lot for answer!
> I tried to add the rule, but my NAT still does not work :(
> 
> Thanks anyway.. and if you have any other suggestion... tahnks
> 
> Giacomo.
> 
> 
> ----- Original Message ----- 
> From: "Taylor, Grant" <gtaylor@riverviewtech.net>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, August 31, 2005 10:54 PM
> Subject: Re: help about NAT and ISP - without attachments
> 
> 
> > Try adding a rule to your FORWARD chain to make sure that the TCP MSS
> > value is not the problem.  I know that you said you are not changing the
> > value, but give this a try to see if it fixes your problem.
> >
> > iptables -t filter -A FORWARD -j TCPMSS --clamp-mss-to-pmtu
> >
> > I don't think that the missing packets is the culprit of your problem as
> > this is the very nature of TCP (retransmission of unacknowledged packets).
> >
> >
> >
> > Grant. . . .
> >
> > Giacomo wrote:
> >> Good morning, I'm Giacomo Strangolino from Italy.
> >>
> >> I finished developing an ipv4 packet filter with NAT/MASQUERADING and
> >> have been
> >> testing it
> >> for some time with success connecting from home to my ISP named "libero".
> >>
> >> Then i changed ISP to another one, called "telecom" and with great
> >> surprise
> >> i discovered that
> >> images from sites and also sites failed to load.
> >>
> >> So now, when i call an ISP all works fine, when i call the other, things
> >> go
> >> wrong.
> >>
> >> I NAT machines behind my firewall changing only ips and ports, and
> >> recalculating checksum (ip and tcp/udp)
> >> to adjust such changes.
> >> I do not touch any other field as window size or seq number or ack, since
> >> the only things i manipulate are
> >> addresses and ports.
> >>
> >> I was wondering what i could do to solve, since iptables and ipfw+natd on
> >> freeBSD or winXP sp2 work fine
> >> with this ISP...
> >>
> >> Tweaking with ethereal i found that probably sometimes a tcp segment gets
> >> lost.
> >>
> >> My firewall is a 2.6.12 kernel module which registers with netfilter
> >> hooks.
> >> A userspace program sends rules to
> >> kernel via netlink.
> >>
> >> I thank you if you could help me find the way to fix the problem or
> >> understand what could be wrong with an
> >> ISP network and anyway work fine with the other.
> >>
> >> Also any indication of where in iptables source is solved such problem
> >> would be appreciated.
> >>
> >> I attach a corrupted image and the ethereal capture related to it if it
> >> could be useful-
> >>
> >> Thanks a lot in advance.
> >>
> >> Giacomo S. Udine, Italy

Hi All

I realize this may be off topic BUT

I have had a similar problem with NAT and an ISP providing PPPoE via
wireless connection. (pretty much vanilla FC3) Most traffic seems to be
fine until over 600k + transfers.

I have had to resort to a windows gateway to solve it for the time being
(which goes against the grain and I did it as a complete last resort). 

My ip_conntrack_max is set really high (24000 for 200 users) and the MTU
is set correctly.

I could not find anything obviously wrong/useful in the logs. :(

TIA

Andrew Gargan
Developer
Interface Media (PTY) Ltd.
Tel: 011 507 3003


