From: Jason Opperisano <opie@817west.com>
Subject: Re: Need an advice
Date: Wed, 17 Nov 2004 08:30:09 -0500
Message-ID: <1100698209.3695.73.camel@hubcap.ljm.dom>
References: <C97EC9D40F9B8E469B2187228615909102CC50@mail.crescat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C97EC9D40F9B8E469B2187228615909102CC50@mail.crescat.com>
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

On Wed, 2004-11-17 at 00:16, Hirantha Wijayawardena wrote:
> Dear Experts,
> 
> These days I'm following the iptables tutorial 1.1.19 to refresh my mind
> with iptables. But I came across some confusions while reading the doc
> (I thinks I'm having some misunderstands). The following are my
> questions and please explain how these packets traverse.
> 
> # INPUT chain
> 
> $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
> This match all TCP packets in the INPUT chain that comes in on the
> $INET_IFACE interface, and send those to the tcp_packets

yes.

> #
> # TCP rules
> #
> 
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
> 
> 
> -A tcp_packets tells iptables in which chain to add the new rule, the
> rule will be added to the end of the chain. -p TCP tells it to match TCP
> packets

since the only way a packet will ever enter the "tcp_packets" chain is
if it matches "-p TCP -i $INET_IFACE" the "-p tcp" is somewhat redundant
here.

>  and -s 0/0 matches all source addresses from 0.0.0.0 with
> netmask 0.0.0.0, in other words all source addresses. 

-s 0/0 is assumed if not specified.  so your tcp_packets chain really
could look like:

  $IPTABLES -A tcp_packets --dport 21 -j allowed
  $IPTABLES -A tcp_packets --dport 22 -j allowed
  $IPTABLES -A tcp_packets --dport 80 -j allowed
  $IPTABLES -A tcp_packets --dport 113 -j allowed

or even cleaner:

  $IPTABLES -A tcp_packets -m multiport --dports 21,22,80,113 -j allowed

> If all the
> criteria are matched, then the packet will be targeted for the allowed
> chain. If it doesn't match any of the rules, they will be passed back to
> the original chain that sent the packet to the tcp_packets chain.

yes.

> 1.) If the packet does not match, then it will return to the original
> chain. So what is the chain? Is it:
> 
> $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets 
> or
> $IPTABLES -P INPUT DROP

it is whatever rule comes after:

  $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets

if that happens to be the last rule in the INPUT chain--then the POLICY
of the INPUT chain will be enforced.

> 2.) If that is send to $IPTABLES -P INPUT DROP, do we have to create TCP
> rules for each destination port?
> 3.) TCP rules set are for only we are running particular services on the
> filerwall or should assign if we running services behind the firewall?

since you're jumping to "tcp_packets" from INPUT--these rules only apply
to services running on the firewall itself.  if you want to allow access
to TCP services behind the firewall, you would need to jump to
"tcp_packets" from FORWARD.

> 4.) What is the best method to sharing the internet for the LAN users?
> Is it SNAT or MASUERADE?

easy:  if your external interface has a static IP, use SNAT; if it's
dynamically assigned, use MASQUERADE

-j

--
"Here we have an ordinary square.
 Whoa! Slow down egghead!"
	--The Simpsons


