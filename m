From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Dropping SYN with FIN flag set
Date: Tue, 21 Oct 2003 13:51:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F95721F.2050905@Loudoun-Fairfax.com>
References: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com> <1066754393.1557.29.camel@valhalla>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066754393.1557.29.camel@valhalla>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Chris Brenton wrote:

>Here is what I do:
>
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,ACK -j LOG
>--log-prefix " SYNACK "
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,ACK -j REJECT
>--reject-with icmp-host-unreachable
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j LOG
>--log-prefix " SYNFINSCAN "
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j REJECT
>--reject-with icmp-host-unreachable
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN -j LOG
>--log-prefix " FINSCAN "
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN -j REJECT
>--reject-with icmp-host-unreachable
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL NONE -j LOG
>--log-prefix " NULLSCAN "
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL NONE -j REJECT
>--reject-with icmp-host-unreachable
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN,PSH,URG -j LOG
>--log-prefix " NMAPXMAS "
>iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL FIN,PSH,URG -j REJECT
>--reject-with icmp-host-unreachable
>  
>

Hey Chris -

I've taken a rudimentary stab at these kinds of rules with mixed success 
and your post brings up a couple of questions:

Here are the rules I'm using now:

# Chain to trap bad packets before they enter the system.
$iptables -A Bad_Packet -p tcp -m state --state INVALID -j LOG 
--log-level debug
$iptables -A Bad_Packet -p tcp -m state --state INVALID -j DROP
$iptables -A Bad_Packet -p tcp --tcp-flags SYN,ACK SYN,ACK -m state 
--state NEW
$iptables -A Bad_Packet -p tcp ! --syn -m state --state NEW -j LOG 
--log-level
$iptables -A Bad_Packet -p tcp ! --syn -m state --state NEW -j DROP

1.  These obviously are different from your rules. Are these rules 
useful or should I just replace them with rules similar to yours?

2.  I tried applying rules like these with -p all and I ended up 
trapping all kinds of local ICMP traffic and broke lots of things. 
Should I have these kinds of stateful rules for other protocols or 
doesn't that matter?

Jeff


