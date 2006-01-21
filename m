From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Using iptables on a single NIC to map old IP addresses onto new.
Date: Sat, 21 Jan 2006 09:00:23 +0100
Message-ID: <001b01c61e60$bb729460$0101000a@sterenborg.info>
References: <43D133A8.4010801@dtlink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43D133A8.4010801@dtlink.com>
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

>>> I would have expected packets to come down either pipe and go out
>>> whichever one happens to be the default gateway.
>>
>>It could be that both your ISPs are using source address spoofing
>>filters (as they should, of course). That is, the router a.a.a.1
>>will only accept traffic with source address a.a.a.2 and the rest
>>(including ping replies from b.b.b.2) get dropped.
> 
> Yea, that's what I think is going on. I was checking the
> iproute2 site to see if I could come up with something fancy but
> the kernel on this box doesn't have the advanced routing enabled.

Hmm. Wouldn't this be solved by adding another NIC and configure the new
IP on it ? That should be less work than install/configure a new Linux
box to do this forwarding.

> So the question is can I set up a box on the network, bind IP
> addresses to it and then forward those connections onto another box
> for both TCP and UDP akin to the way rinetd works?
> 
> i.e.
> 
> a.a.a.1 port 80 gets forwarded to b.b.b.1 80
> a.a.a.2 port 80 gets forwarded to b.b.b.2 80

Sure.

> So I'm fowarding packets despite the fact that I'm not using
> a "router" per se. I want to forward packets for connections to
> the local box like rinetd does.
> 
> Can that be done using iptables or is there another approach to this
> problem? (Like rewriting the from address depending on which pipe the
> packet came from) 

On the box, use rules like :

$ipt -P FORWARD DROP

$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -d b.b.b.1 -p tcp --dport 80 \
  -j ACCEPT
$ipt -A FORWARD -m state --state NEW -d b.b.b.2 -p tcp --dport 80 \
  -j ACCEPT

$ipt -t nat -A PREROUTING -d a.a.a.1 -p tcp --dport 80 \
  -j DNAT --to b.b.b.1
$ipt -t nat -A PREROUTING -d a.a.a.2 -p tcp --dport 80 \
  -j DNAT --to b.b.b.2


Gr,
Rob


