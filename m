From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re[4]: Problem with Port forwarding
Date: Fri, 9 Apr 2004 13:53:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404091353.32056.Antony@Soft-Solutions.co.uk>
References: <146373237921.20040405211401@internetplustravel.ru> <200404061344.23168.Antony@Soft-Solutions.co.uk> <325389781.20040409162513@internetplustravel.ru>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <325389781.20040409162513@internetplustravel.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 09 April 2004 1:25 pm, Oleg Savostyanov wrote:

> On Tuesday, April 6, 2004, 4:44:23 PM, Antony Stone wrote:
>
> > What do you see in the packet / byte counters from "iptables -L -nvx;
> > iptables -L -t nat -nvx" when you try to make a connection?   Do you
> > see packets in the PREROUTING DNAT rule, the FORWARD rule towards the
> > mail server, and the FORWARD rule for the replies?
>
> iptables -L -nvx
> 562 27336 ACCEPT tcp--eth0 eth1 0.0.0.0/0 10.10.10.252 tcp dpt:25
> 566 27576 ACCEPT tcp--eth0 eth1 0.0.0.0/0 10.10.10.252 tcp dpt:25

Is this the NEW rule early on in your ruleset (I'm assuming you're still using 
the ruleset you posted on Tuesday: 
http://lists.netfilter.org/pipermail/netfilter/2004-April/051811.html)   If 
so, there's something strange about it catching 4 packets - only the first 
one should be NEW, the rest should be ESTABLISHED and match on a rule further 
down your ruleset.

> iptables -L -t nat -nvx
>
> Chain PREROUTING (policy ACCEPT 207941 packets, 25904040 bytes)
> pkts      bytes target     prot opt in     out     source      destination
> 185  8964 DNAT tcp--eth0 * 0.0.0.0/0 62.105.158.196 tcp dpt:25
> to:10.10.10.252
> Chain PREROUTING (policy ACCEPT 207933 packets, 25903472 bytes)
> pkts      bytes target     prot opt in     out     source      destination
> 184  8904 DNAT tcp--eth0 * 0.0.0.0/0 62.105.158.196 tcp dpt:25
> to:10.10.10.252

Okay, I'm slightly puzzled by this, because there is a smaller number of 
packets in the second log entry than the first - I can only assume that this 
is an "after" and "before" display :)

This shows only a single matching packet, which if it's the first SYN packet, 
and there was an acceptable SYN-ACK response, is what I'd expect, since the 
nat rules only see the first packet in a connection, and all the others get 
handled magically in the background by the connection tracking software.

I recommend you put a packet sniffer (ethereal is a good one) on the network 
segment between the firewall and the mail server, and see what packets are 
there.

I'm of the opinion that netfilter is working fine, but there's some 
application layer problem which is causing the connection not to succeed.

Regards,

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


