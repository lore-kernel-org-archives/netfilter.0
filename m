From: Adam Majer <adamm@galacticasoftware.com>
Subject: Re: DNAT forwarding problems
Date: Thu, 05 Aug 2004 11:55:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41126680.2060403@galacticasoftware.com>
References: <411166D5.30105@galacticasoftware.com> <200408051525.38235.raido@elin.ttu.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408051525.38235.raido@elin.ttu.ee>
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
To: raido <raido@elin.ttu.ee>
Cc: netfilter@lists.netfilter.org

raido wrote:

>Hi!
>  
>
>>external IP addresses: [A], [B]
>>internal IP address: [C] - not the NAT box
>>
>>I want all udp port 53 traffic from [A]->[C] and from [B]->[C]. So I set
>>up the following rules
>>
>>When the packet comes over interface[B], it also gets to the PREROUTING
>>chain, but it never gets to the FORWARD chain and thus never even gets
>>to [C]. It just dissapears into thin air. My routing seems correct..
>>    
>>
>
>  
>
>>PS. kernel 2.6.7, iptables 1.2.9
>>    
>>
>I wrote few days ago about my problem which seems to be alike, in this list. I 
>have same configuration and I need to DNAT all traffic from [A] to [C] and 
>packets also disapear in PREROUTING chain. I have also 2.6.7 kernel and  
>iptables 1.2.9. Next I plan to upgrade to iptables 1.2.10. If this does not 
>help, maybe it is time to make a bug report?
>  
>

Upgrading iptables to 1.2.11 did not help.

The problem appears to be that the rp_filter ate the packets. It thought
that these packets were rogue packets. Anyway, when I disabled
rp_filter, the packets starting flowing but then there was the problem
of reply packets being sent out from a wrong interface. That is,

(IN)  [B] -> [C]
(OUT) [C] -> [A] instead of [B].

To solve this, set up two IP addresses at the [C] machine (C and C').
Packets from one interface went to [C] and packets from the other
interface ([B]) went to C'. To reenable rp_filter and not to lose
packets, I had to set up a routing rule for packets coming *from* the C'
interface. I think the kernel will look at the routing and say "Hey, you
want to route B->C', but there is no rule for C' to get back to B" and
it just discards packets before it gets to FORWARD chain. So I added

ip rule add from C' table second_interface_routing_table

where the second interface routing table has the default route [B], not [A].

Now *everything* works. Only took my about 20 hours to figure that out!!
:) Anyway, I guess one cannot route [A]->[C] and [B]->[C] directly. The
kernel does not keep track by itself where the reply should be sent in
that configuration, unless someone could tell me how that could work.

- Adam

PS. There was also a problem at C with packets. Packets routed to C'
were replied as though they came from C. The solution is to have two
daemons, one bound to C and another to C'. If the daemon was bound to
0.0.0.0, it replied with the default address (kernel 2.4.27-rc3).

PPS. Not on the list, so please CC me.

-- 
Building your applications one byte at a time
http://www.galacticasoftware.com



