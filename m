From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Why is my nat pre chain being bypassed by streaming udp?
Date: Wed, 20 Dec 2006 17:10:08 +0100
Message-ID: <45896060.6000301@plouf.fr.eu.org>
References: <458844AD.9000308@jrmy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <458844AD.9000308@jrmy.net>
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

Jeremy Freeman a =E9crit :
>=20
> We receive streaming udp traffic from two sources destined for port
> 8302. They are always sending this traffic whether are box is on or not=
.
> Just keeps on coming.
> We want to split off the traffic from one of the sources and redirect i=
t
> to port 9302.
>=20
> With every other chain empty and with an ACCEPT policy:
>=20
> iptables -t nat -A PREROUTING -p udp -s <source2 ip> --dport 8302 -j
> REDIRECT --to-ports 9302
>=20
> however, traffic from source2 keeps on hitting 8302.
>=20
> Doing a iptables -t nat -L -n -v shows:
>=20
>  0     0 REDIRECT   udp  --  *      *       <source2 ip>
> 0.0.0.0/0           udp dpt:8302 redir ports 9302
>=20
> So the traffic is never getting picked up by the chain.
>=20
> Even doing a general rule in the nat PREROUTING with no target shows
> that no traffic is hitting:
>=20
>  0     0            udp  --  *      *       <source2 ip>       0.0.0.0/=
0
>=20
> This is a very simple box with only 1 interface (eth0).
>=20
> I thought this may be due to connection tracking

Yes. When a packet is related to an existing connection, it skips the=20
'nat' chains.

> so I added a raw entry to NOTRACK the traffic also:
>=20
> Chain PREROUTING (policy ACCEPT 90101 packets, 12M bytes)
> 9491 1333K NOTRACK    all  --  *      *       <source2 ip>      0.0.0.0=
/0
>=20
> So I see the raw chain is picking it up.. But it is skipping past the
> nat chain.

This is because NAT operation needs the connection tracking. So packets=20
not initiating a new connection, including packets in the INVALID state=20
or matching a NOTRACK rule, also skip the 'nat' chains.

For the REDIRECT rule to take effect, it must be installed before=20
receiving the first packet it is supposed to match, e.g. before the=20
related network interface is activated.

The NOTRACK rule was a good idea, but you needed to wait until the=20
conntrack entry expires (check in /proc/net/ip_conntrack, it can take a=20
few minutes for UDP traffic), then remove the NOTRACK rule so the next=20
packet creates a new connection and goes through the nat rules.

