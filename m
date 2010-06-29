From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables mac update
Date: Tue, 29 Jun 2010 09:45:23 -0500
Message-ID: <4C2A0703.5040007@riverviewtech.net>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua> <4C29E8B4.5060205@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C29E8B4.5060205@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/29/10 07:36, Pascal Hambourg wrote:
> The Linux bridge maintains a MAC-port table based on the source MAC 
> address in received frames. As expected, if a MAC address was 
> associated to a given port and a frame from that MAC address is 
> received on a different port, then the table is updated accordingly. 
> Besides, rebooting the modems and not the Linux box fixes the 
> problem. So I doubt that the Linux bridge causes the problem.

I mostly agree.

The only thing that I would wonder about is is it possible that Linux is 
seeing the link go down on the physical NIC that is connected to the 
bridge, thus taking the logical port in the bridge down there by causing 
it's learned MAC addresses associated with that port to be lost.

This could easily be tested by putting a hub (or similar) between the 
Linux box and the Zyxel bridge.  That way when the bridge is rebooted, 
the Linux box does not see the link go down.  If the problem still 
corrects its self, you have completely removed the Linux box from the 
tests, there by strongly pointing at the Zyxel bridge.

> Of course the update process requires that the moved box sends 
> traffic first. If it just sits there waiting then MAC-port tables 
> won't be updated, until the entry eventually expires.

Agreed.

Pining or broadcasting looking to see what devices are on the far end 
should accomplish the same thing.

> Then may I ask what is the purpose of this box ?

Remember that EBTables modifies how in kernel bridging behaves.  Thus 
the in kernel bridging will still behave like a normal bridge, even if 
EBTables rules are not used.  (In fact it is possible to have bridging 
support in the kernel with out EBTables.)

Bridges will still learn (and forget / expire) where MAC addresses are. 
  So even if there were not EBTables rules, the bridge its self will 
learn what hosts are on what side of the bridge there by intelligently 
forwarding (or not) frames across the link that don't need to be.

I would have been tempted to put a bridge on both sides, not just the 
one.  Because as it is, broadcasts for the end with out the network are 
still propagated across the link.



Grant. . . .
