From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: help about NAT and ISP - without attachments
Date: Wed, 31 Aug 2005 15:54:52 -0500
Message-ID: <4316191C.5060705@riverviewtech.net>
References: <007f01c5ae22$3e9a2e20$0300a8c0@giacomino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <007f01c5ae22$3e9a2e20$0300a8c0@giacomino>
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

Try adding a rule to your FORWARD chain to make sure that the TCP MSS value is not the problem.  I know that you said you are not changing the value, but give this a try to see if it fixes your problem.

iptables -t filter -A FORWARD -j TCPMSS --clamp-mss-to-pmtu

I don't think that the missing packets is the culprit of your problem as this is the very nature of TCP (retransmission of unacknowledged packets).



Grant. . . .

Giacomo wrote:
> Good morning, I'm Giacomo Strangolino from Italy.
> 
> I finished developing an ipv4 packet filter with NAT/MASQUERADING and
> have been
> testing it
> for some time with success connecting from home to my ISP named "libero".
> 
> Then i changed ISP to another one, called "telecom" and with great surprise
> i discovered that
> images from sites and also sites failed to load.
> 
> So now, when i call an ISP all works fine, when i call the other, things go
> wrong.
> 
> I NAT machines behind my firewall changing only ips and ports, and
> recalculating checksum (ip and tcp/udp)
> to adjust such changes.
> I do not touch any other field as window size or seq number or ack, since
> the only things i manipulate are
> addresses and ports.
> 
> I was wondering what i could do to solve, since iptables and ipfw+natd on
> freeBSD or winXP sp2 work fine
> with this ISP...
> 
> Tweaking with ethereal i found that probably sometimes a tcp segment gets
> lost.
> 
> My firewall is a 2.6.12 kernel module which registers with netfilter hooks.
> A userspace program sends rules to
> kernel via netlink.
> 
> I thank you if you could help me find the way to fix the problem or
> understand what could be wrong with an
> ISP network and anyway work fine with the other.
> 
> Also any indication of where in iptables source is solved such problem
> would be appreciated.
> 
> I attach a corrupted image and the ethereal capture related to it if it
> could be useful-
> 
> Thanks a lot in advance.
> 
> Giacomo S. Udine, Italy
> 
> 


