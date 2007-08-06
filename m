From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT on stateless firewall ?
Date: Mon, 06 Aug 2007 09:11:49 -0500
Message-ID: <46B72C25.8000902@riverviewtech.net>
References: <46B26400.7050504@andrei.myip.org>	<46B2FB97.3090605@plouf.fr.eu.org>	<46B3729A.8030605@andrei.myip.org>	<46B37DD2.8020606@andrei.myip.org>	<46B37EB5.3060803@rtij.nl>	<46B38856.1020003@andrei.myip.org>	<46B39567.5080004@riverviewtech.net>	<46B6300A.7020404@rtij.nl>	<46B673A5.6030303@riverviewtech.net>
	<46B6AB25.3050906@rtij.nl>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B6AB25.3050906@rtij.nl>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/06/07 00:01, Martijn Lievaart wrote:
> The sender wants to send a packet. It uses arp to find out which MAC to
> send to. It sends it. The packet arrives at the destination nic. That's
> all I ment, not more, not less.

Ok, agreed.  The only thing I'll add is that ARP is one way for the
sender to identify the MAC to send the packet to, there are other ways too.

> However, having arrived at the nic, the packet is then transfered to the
> stack. If the stack does not know about the destination IP, the packet
> is dropped by routing, iirc. However, before routing (in PREROUTING) the
> destination is changed to something the stack does know about. So how
> comes it does not work?

I would think that this could work if you caught the packet in time to
re-direct it elsewhere.  I will have to go back and re-read this thread
to better respond later (when I have time).  At the moment, I agree that
this should work if it is implemented correctly.

So long as you can direct the packet where you want to and there is no
firewalling and / or kernel based filtering like reverse path filters
causing the low level networking to drop the packets this should work.
In fact, the receiving hosts actions is this is the bases for many
different solutions.



Grant. . . .

