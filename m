From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Questions re iproute2, netfilter, and locally sourced packets
Date: Sat, 13 May 2006 12:15:21 +0200
Message-ID: <4465B1B9.2000208@plouf.fr.eu.org>
References: <446576D0.2050407@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <446576D0.2050407@aut.ac.nz>
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

Ian Batterbee a =E9crit :
[...]
> So to achieve this, I set up another routing table, added a name for it=
=20
> into /etc/iproute2/rt_tables, added an "ip rule from [HostA] lookup=20
> vpn", and in the script that brings the tunnel up, routes are added for=
=20
> my work's netblocks via the ppp link to the vpn route table. This much=20
> all works.=20
> In the same script, I enable masquerading on the ppp interface. This=20
> appears not to work, because if I sniff from a machine on the other sid=
e=20
> of the tunnel (ie, at work), packets emerging from it still have their=20
> original IP addresses from my local subnet on them

This is a rather known issue. Iptables's MASQUERADE may not work (may it=20
work ?) when combined with source address based routing policy. If I=20
understood correctly the reason is the MASQUERADE code uses a kernel=20
output routing function to determine the apparent source address, but=20
this function does not use the original source address (why would it, as=20
its purpose is to find out the source address to use ?), so the ip rule=20
does not trigger and the main routing table is used. A workaround is to=20
set the apparent source address explicitly with SNAT instead of=20
MASQUERADE. However, unlike MASQUERADE, SNAT assumes the output=20
interface is static and won't clean up the conntrack/NAT table when the=20
PPP interface goes down, but this is not a problem if the interface=20
always gets the same address.

> To make things more complicated, not only is Host A allowed to route vi=
a=20
> the tunnel, but packets sourced from the linux router itself should als=
o=20
> be allowed to go that way (or to put it another way, everything but hos=
t=20
> B and Host C should be allowed to use the tunnel).
>=20
> The trouble is, while I can allow packets from the linux router by=20
> adding: "ip rule add prior 50 lookup vpn" (which obviously allows=20
> everything to use the tunnel), I can't figure out how to specifically=20
> allow locally generated packets without allowing everything=20
> unconditionally.

What about using MARK in the mangle OUTPUT chain and fwmark in ip rule ?

