From: Joel Newkirk <newkirk@newkirk.us>
Subject: Re: iptables rules to allow ipv6 tunnel?
Date: Sat, 08 Nov 2003 14:51:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068321079.2219.2134.camel@alpha.newkirk.us>
References: <1068220779.12484.5.camel@jccn-crux-linux.djc.state.id.us>
Reply-To: newkirk@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068220779.12484.5.camel@jccn-crux-linux.djc.state.id.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeremy Jones <jeremy@samnjack.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2003-11-07 at 10:59, Jeremy Jones wrote:
> Hi folks,
>=20
> Wondering if anyone around here could shed some light on what my
> firewall's problem might be.  Here's the deal:  I have a dsl connection
> coming into my box on eth3, with eth0 connected to my dmz.  I have a /2=
9
> block of addresses to use, so I bridge interfaces eth0 and eth3.=20
> Interface eth1 is connected to my home LAN.  If you were wondering wher=
e
> eth2 went, it's just snorting.  Aside from this, I have an ipv6 sit
> tunnel, using the local ipv4 address of br0 (the bridge interface), and
> a remote of 200.1.1.1.  But for the life of me, I can't get any ipv6
> traffic through.  Well, at least I can't get icmpv6 through, and I'm a
> little baffled by that.  I've put rules at the beginning of my iptables
> ruleset that should let through any of the necessary stuff to and from
> the tunnel broker, but my ping6 never gets an answer, although the
> firewall logs tell me that traffic IS going in and out to and from the
> tunnel endpoint.
>=20
> So here's my rules, my network startup script, and my firewall logs
> while ping6ing the ipv6 address of the tunnel endpoint.
>=20
> Thanks everyone,
>=20
> Jeremy Jones

If your IPv6 tunnel endpoint is the firewall box itself, then the only
traffic iptables will see is proto 41 (although Viag=E9nie Tunnel Setup
Protocol would need TCP port 3653 or 4343 for tunnel setup)- the ipv6
traffic itself would be ip6tables.

You might find a linux ipv6 mailinglist more helpful.

> # lets get the tunnel fixed right here...
> #
> iptables -N ipv6_tunnel
> iptables -A ipv6_tunnel -j LOG --log-prefix "IPv6 Tunnel Traffic?  "
> iptables -A ipv6_tunnel -j ACCEPT
> iptables -A INPUT -s $SIT_TUN_ENDPOINT -j ipv6_tunnel
> iptables -A OUTPUT -d $SIT_TUN_ENDPOINT -j ipv6_tunnel
> iptables -A FORWARD -d $SIT_TUN_ENDPOINT -j LOG --log-prefix "Why
> forward?  "
> iptables -A FORWARD -d $SIT_TUN_ENDPOINT -j ACCEPT
> iptables -A FORWARD -s $SIT_TUN_ENDPOINT -j LOG --log-prefix "Why
> forward?  "

Why, indeed?  You shouldn't get any traffic between the ipv4 remote
endpoint of the ipv6 tunnel and any ipv4 address except your local
endpoint.

If the tunnel endpoint is the firewalling box, then you should have
proto41 and tunnel setup traffic in INPUT and OUTPUT for iptables,
everything else would be ipv6 traffic /through/ the tunnel, seen only
with ip6tables.



>         ip link set eth0 up
>         ip link set eth3 up
>         brctl addbr br0
>         brctl addif br0 eth0
>         brctl addif br0 eth3
>         ip link set br0 up
>         ip addr add 100.1.1.1/29 dev br0
>         ip route add 0/0 via 100.1.1.2 dev br0
>         ip tunnel add six0 mode sit remote 200.1.1.1 local 100.1.1.1 tt=
l
> 255
>         ip link set six0 up
>         ip addr add 2001:0123:4567:89ab::123f/127 dev six0
>         ip route add ::/0 dev six0
>         ip addr add 2001:fedc:ba09:8765:1::1/96 dev eth0
>         ip link set eth1 up
>         ip addr add 10.10.10.1/24 dev eth1
>         ip addr add 2001:fedc:ba09:8765:2::1/96 dev eth1


> Nov  7 09:30:00 gw kernel: IPv6 Tunnel Traffic?  IN=3D OUT=3Dbr0
> PHYSOUT=3Deth0 SRC=3D100.1.1.1 DST=3D200.1.1.1 LEN=3D124 TOS=3D0x00 PRE=
C=3D0x00
> TTL=3D255 ID=3D0 DF PROTO=3D41
> Nov  7 09:30:00 gw kernel: IPv6 Tunnel Traffic?  IN=3Dbr0 OUT=3D PHYSIN=
=3Deth0
> MAC=3D00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd SRC=3D200.1.1.1
> DST=3D100.1.1.1 LEN=3D124 TOS=3D0x00 PREC=3D0x00 TTL=3D242 ID=3D803 PRO=
TO=3D41
> Nov  7 09:30:00 gw kernel: Why forward?  IN=3Dbr0 OUT=3Dbr0 PHYSIN=3Det=
h0
> PHYSOUT=3Deth0 SRC=3D100.1.1.1 DST=3D200.1.1.1 LEN=3D124 TOS=3D0x00 PRE=
C=3D0x00
> TTL=3D255 ID=3D0 DF PROTO=3D41

I suspect this is because you have br0 as an endpoint of your tunnel,
but I'm not sure, never having done this on a bridge before.

> Nov  7 09:30:00 gw kernel: Something not right  IN=3Dbr0 OUT=3Dbr0
> PHYSIN=3Deth0 PHYSOUT=3Deth3 SRC=3D200.1.2.3 DST=3D224.0.0.10 LEN=3D60 =
TOS=3D0x00
> PREC=3D0xC0 TTL=3D2 ID=3D0 PROTO=3D88

Cisco EIGRP, looks like.

j



