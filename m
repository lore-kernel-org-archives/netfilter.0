From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Need an advice
Date: Wed, 17 Nov 2004 10:28:23 -0500 (EST)
Message-ID: <19765.142.169.215.10.1100705303.squirrel@142.169.215.10>
References: <C97EC9D40F9B8E469B2187228615909102CC50@mail.crescat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Hirantha Wijayawardena <hirantha@crescat.com>
Cc: netfilter@lists.netfilter.org

On Wed, November 17, 2004 12:16 am, Hirantha Wijayawardena said:
> 1.) If the packet does not match, then it will return to the original
> chain. So what is the chain? Is it:
>
> $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
> or
> $IPTABLES -P INPUT DROP

Okay, let's say we have this ruleset in the INPUT chain :

$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
$IPABLES -A INPUT -i $INET_IFACE -j LOG

The first rule, if matches, would jump the packet to iterate through
the 'tcp_packets' custom chain.

1.) If the packet does not match, then it will return to the original
chain.

Which means it will continue iterating through the rulset of the original
chain. In exemple below, it will reiterate starting at the
'$IPABLES -A INPUT -i $INET_IFACE -j LOG' rule.

>
> 2.) If that is send to $IPTABLES -P INPUT DROP, do we have to create TC=
P
> rules for each destination port?

This verdict shall only happen if the packet reached the end of ruleset
without no match.

> 3.) TCP rules set are for only we are running particular services on th=
e
> filerwall or should assign if we running services behind the firewall?

Well, am not sure of what you mean, but here's my assumption :

If you run services *on* this box (the firewall), all packets addressed
to those services will iterate through the INPUT chain. So that's
where you need to filter.

If you run services *behind* this box (the firewall), all packets address=
ed
to those services will iterate through the FORWARD chain. Useless to say
that you need to filter accepted ports in that chain.
*You need filtering rules for both ingoing & outgoing connections*

>
> 4.) What is the best method to sharing the internet for the LAN users?
> Is it SNAT or MASUERADE?

Depends on your public ips. Static or not ?

> According to the tutorial -
> It is still possible to use the MASQUERADE target instead of SNAT even
> though you do have an static IP, however, it is not favorable since it
> will add extra overhead [...]

Yes, each time a packet hit MASQUERADE, ipt_MASQUERADE needs to
checkup the routing table, pick up the good outgoing device &
use the ip bound to this interface. AFAIK

However, SNAT already know which ip to use as you specified it.


> Please advice & thanks in advance
>
> - Hirantha
>
>

HTH,

Samuel
CookingLinux TM


