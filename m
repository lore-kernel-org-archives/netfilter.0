From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Counting traffic - another question
Date: Tue, 27 Jul 2004 13:59:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407271359.13020.Antony@Soft-Solutions.co.uk>
References: <1304297675.20040727143400@op.pl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1304297675.20040727143400@op.pl>
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

On Tuesday 27 July 2004 1:34 pm, Marcin wrote:

> Hi
>
>   I have set of rules that doing upload/download stats for my NATed network
>   (10.0.0.0/8):
>
>   # Marking
>   $IPTABLES -t mangle -A FORWARD -p tcp -j CONNMARK --restore-mark
>   $IPTABLES -t mangle -A FORWARD -p tcp -m mark ! --mark 0 -j ACCEPT
>
>   $IPTABLES -t mangle -A FORWARD -p tcp --dport $SSH_PORT -j MARK --set-mark
> $SSH

<snip...>

>   Rules above (IMO) marks specified trafic traveling through FORWARD
>   chain, and this is only traffic from localnet <-> internet, not from
>   localnet <-> linuxbox.

Correct.   FORWARD chain matches only packets which are routed *through* the 
machine, not packets going to/from the machine itself.

>   Ok, now i make chains for counting uploads/downloads from/to my lan.

Why?   You seem to have one set of rules in the FORWARD mangle table for 
MARKing packets, and then another set of rules in POSTROUTING looking for 
MARKs and counting the packets.

Why not simply count all the packets in FORWARD mangle?

For example:

iptables -A FORWARD -t mangle -i eth0 -o ppp0 -p tcp --dport ssh

Will count all packets going from eth0 to ppp0 destination ssh (TCP port 22).

No need to MARK the packets (unless you want the MARKs for something else?), 
and you can specify input & output interface in the FORWARD table to identify 
which way through your firewall the packets are going.

Regards,

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


