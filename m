From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT with marked packets
Date: Fri, 29 Sep 2006 17:04:43 +0200
Message-ID: <451D360B.9040401@plouf.fr.eu.org>
References: <451D30A9.1030406@eternet.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451D30A9.1030406@eternet.cc>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Lucas Diaz a =E9crit :
> That's how I'm marking them.
> iptables -A PREROUTING -t mangle -j CONNMARK --restore-mark
> iptables -A PREROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
> iptables -A PREROUTING -t mangle -m layer7 --l7proto http
> iptables -A PREROUTING -t mangle -m layer7 --l7proto dns
[...]
> My problem is that I also need to SNAT to a specific IP those marked=20
> packets, and I can't match'em.
> No packets go through
> iptables -A POSTROUTING -t nat -m mark --mark 10 -j SNAT --to x.x.x.x

Only the first NEW packet of a connection goes through the nat chains=20
(you cannot change the source or destination address in the middle of an=20
established connection), and layer7 needs more than one packet to=20
identify a protocol.

http://l7-filter.sourceforge.net/FAQ#usage :

Q: How can I use l7-filter to redirect some of my traffic (to a proxy,=20
etc.)?

A: You pretty much can't, at least not in any straightforward way.=20
L7-filter can't possibly identifiy what protocol a connection is using=20
until it sees a packet with data in it. For TCP, this is the third=20
packet, far too late to start redirecting anything. (Convoluted schemes=20
involving duplicating all your packets until you get a match may be=20
possible, but we don't recommend it.) For UDP, it could work, providing=20
that l7-filter gets enough data in the first packet to make a decision.=20
This is not our focus, however.

