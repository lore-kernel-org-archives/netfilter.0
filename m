From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 01:39:52 -0500
Message-ID: <428D8638.4040301@riverviewtech.net>
References: <fad9d484050519150730dbc53d@mail.gmail.com>	<20050519232314.GA9369@bender.817west.com>
	<20050519233347.GA9462@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050519233347.GA9462@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> looking at that response--there's a situation screaming for a custom
> chain:
> 
>   iptables -N DROP_TRACE
>   iptables -A DROP_TRACE -p udp --dport 33434:33523 -j DROP
>   iptables -A DROP_TRACE -p icmp --icmp-type 8 -m ttl --ttl-lt 5 -j DROP
> 
>   iptables -A INPUT -j DROP_TRACE
>   iptables -A FORWARD -j DROP_TRACE

I don't think that I could agree more about the need for a new chain.  I think I'd be tempted to do my match a bit differently though.

iptables -t filter -A DROP_TRACE -o eth0 -p udp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
iptables -t filter -A DROP_TRACE -o eth0 -p udp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
iptables -t filter -A DROP_TRACE -o eth0 -p icmp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
iptables -t filter -A DROP_TRACE -o eth0 -p icmp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP

This should match any traffic (UDP or ICMP) that is leaving your network with a TTL of 1 which *should* be first packet in a traceroute that your firewall / router would see.  Seeing as how this should match any traceroute traffic you should be able to change the DROP target to be any thing else that you would want to redirect the traffic out some other interface be it via the ROUTE target or the MARK target in conjunction with ip routes.

The only thing that I have not figured out as of yet how to do is DROP the first packet that the firewall sees as every attempt that I made, even a DROP policy on the FORWARD and OUTPUT chain, did not block the first "TTL Time Exceeded" response.



Grant. . . .

