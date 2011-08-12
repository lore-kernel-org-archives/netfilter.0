From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Extremely slow upload (and more) from behind NAT
Date: Fri, 12 Aug 2011 15:28:18 -0500
Message-ID: <4E458CE2.4090804@riverviewtech.net>
References: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/12/11 11:06, Christian Pernegger wrote:
> The official method for getting one's IP is DHCP, though configuring
> it statically reportedly also works. I tried both, no difference.
> The DHCP server *does* suggest an MTU of 576 bytes instead of the
> ususal 1500 bytes, but that seems to be bogus. Manual PMTU discovery
> via don't-fragment pings to various servers is consistent with an MTU
> of 1500 and anyway, changing it to 576 doesn't have any appreciable
> effect at all, with or without a TCPMSS rule as suggested by the
> iptables man page.

I was going to say that this /really/ seems like an MTU / TCPMSS issue 
to me.

For giggles, ssh from one of the clients configuring the ssh client as a 
socks proxy.  Then have your web browser use the ssh / socks proxy for 
testing.  If that does work correctly, I'd still really question MTU / 
TCPMSS.

What happens if you clamp the MTU / TCPMSS really low just to make sure 
you are (way) below any thing interfering.

Have you tried running a network sniffer on any of the traffic to see 
what it's doing?  Do you have any re-transmissions?  Do you see requests 
that don't have associated replies?

Do the sniffs on the inside interface match the outside interface (save 
for the nated IP address)?



Grant. . . .
