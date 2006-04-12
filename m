From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: IP masquerade + squid problem
Date: Wed, 12 Apr 2006 12:03:09 +0200 (CEST)
Message-ID: <64653.193.173.147.3.1144836189.squirrel@webmail.sterenborg.info>
References: <51851.192.168.2.7.1144653554.squirrel@mail2.medcol.mw>
	<000c01c65cce$ad299640$0101000a@sterenborg.info>
	<2853.192.168.2.224.1144830791.squirrel@mail2.medcol.mw>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2853.192.168.2.224.1144830791.squirrel@mail2.medcol.mw>
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

On Wed, April 12, 2006 10:33, Isaiah Makwakwa wrote:
> Hie Rob et al,
>
> Sorry that I could be dumping my whole file to the list but here is my
> iptables script.
>
> Everything else works apart from the fact that at first I could not acc=
ess
> my external website also on the same machine and squid could not be
> accessible. I solved the external website by configuring view in my DNS
> but it seems there is no easy way for the squid box.

You don't provide logging information of where packets in fact are or are=
 not
going, but I'll give it a try.

> # Flush all rules
> $IPTABLES -A INPUT -j DROP
> $IPTABLES -A OUTPUT -j DROP
> $IPTABLES -A FORWARD -j DROP

This is not flushing. In fact, I don't see any flushing rules at all.
"$IPTABLES -F ..." is flushing.

> # Remove the complete blocks
> $IPTABLES -D INPUT 1
> $IPTABLES -D OUTPUT 1
> $IPTABLES -D FORWARD 1

Sooo... Why not this :

# Stop forwarding until rules are setup.
#
echo 0 > /proc/sys/net/ipv4/ip_forward

# Drop everything you don't want to allow.
# (Which is what you want to do, looking at your rules)
#
$ipt -P INPUT DROP
$ipt -P OUTPUT DROP
$ipt -P FORWARD DROP

# Flush the chains.
#
$ipt -F INPUT
$ipt -F OUTPUT
$ipt -F FORWARD

Now you're ready to add rules to your liking without anything getting thr=
ough
unintended.

<rules here>

# ALlow forwarding.
#
echo 1 > /proc/sys/net/ipv4/ip_forward

> #$IPTABLES -t nat -A PREROUTING -i $INTIF -p tcp --dport 3128 -j ACCEPT
> #$IPTABLES -t nat -A PREROUTING -i $INTIF -p tcp --dport 3033 -j ACCEPT

Packets for squid are directed to the firewall box so they are not NATed =
and
you don't need these rules. (They are commented out I see ; just delete t=
hem.)

> $IPTABLES -A FORWARD -s 127.0.0.1 -j local-fwd
...
> $IPTABLES -A local-fwd -p tcp --dport 110 -j ACCEPT
> $IPTABLES -A local-fwd -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A local-fwd -p tcp --dport 21 -j ACCEPT
> $IPTABLES -A local-fwd -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A local-fwd -p tcp --dport 443 -j ACCEPT
> $IPTABLES -A local-fwd -p udp --dport 53 -j ACCEPT

I can't imagine forwarding packets with source IP 127.0.0.1 to be correct=
.
Are you trying to forward from the internet to your LAN ? Or... What ?

> $IPTABLES -A local -p tcp --dport 3128 -j ACCEPT
> $IPTABLES -A local -p tcp --dport 3033 -j ACCEPT

Is this to be squid's ICP port ? IMO you don't really need it for basic w=
eb
proxying.

> $IPTABLES -A local -p tcp --dport 8080 -j ACCEPT

What port is your squid listening on (default 3128) ? Just open up that o=
ne.

> $IPTABLES -A ext -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A ext -p udp --dport 53 -j ACCEPT

Are external DNS servers setting up connections to you ? Normally your bo=
x
sends a DNS request and the server answers. That answer would be accepted=
 by a
RELATED,ESTABLISHED rule.

> # Allow OUTPUT from local Machine & local net
> $IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -d 127.0.0.1 -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -o $INTIF -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -o $EXTIF -j ACCEPT

You are allowing everything out. Why not flush the OUTPUT chain, set it's
policy to ACCEPT and be done with it ?
$ipt -F OUTPUT
$ipt -P OUTPUT ACCEPT


The above probably doesn't solve your problem, but I wouldn't write it th=
is
way. Maybe you can add logging rules that might show where packets are or=
 are
not going.


Gr,
Rob



