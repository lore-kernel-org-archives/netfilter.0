From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Forward rules
Date: Fri, 28 Nov 2003 15:03:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311281503.18017.JALaramie@Loudoun-Fairfax.com>
References: <008301c3b5e4$640b9f00$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008301c3b5e4$640b9f00$0200a8c0@ale>
Content-Disposition: inline
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

On Friday 28 November 2003 14:18, Alejandro Cabrera Obed wrote:
> Hello !!!
>

Hi Alejandro

> I'm building my FORWARD table rules, and I want to implement this: "Drop
> all FORWARD packets by default and then accept only packets coming from LAN
> (192.168.0.0/24) with the related and established condition and leaving my
> external interface ($INET_IFACE)".
>
> Is the next ruleset according to what I want or can I change the order ???
>
> $IPTABLES -P FORWARD DROP
> $IPTABLES -A FORWARD -s 192.168.0.0/24 -o $INET_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> I suppose with this implementation I'm discarding packet forwarding coming
> from 127.0.0.0/24, 10.0.0.0/8 and 172.16.0.0/12 (because my default policy
> is DROP by default)....is it OK ???
>

Your rules will work fine. A couple of hints:

1. Even though the -P FORWARD DROP comes first in the ruleset, it is the 
default policy and it will always be the last rule checked.

2. Most of your traffic will be accepted by your ESTABLISHED,RELATED rule so 
for maximum efficiency it should always be as close to the top of your chain 
as possible (but after the default policy).

3. It is *slightly* better to use -i $LAN_IFACE instead of -o $INET_IFACE. It 
doesn't matter when there are only 2 interfaces, but if you were to add 
another interface in the future -i $LAN_IFACE will offer the same spoofing 
protection to the new interface.

Jeff

