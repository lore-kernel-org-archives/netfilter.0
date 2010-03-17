From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Ugly issue with conntrack
Date: Wed, 17 Mar 2010 16:33:23 +0100
Message-ID: <4BA0F643.9030903@chello.at>
References: <4B9FB41C.5000609@limbo.ari.es>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B9FB41C.5000609@limbo.ari.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: pushakk@limbo.ari.es
Cc: netfilter@vger.kernel.org

On 16.03.2010 18:15, pushakk@limbo.ari.es wrote:
> Hello everyone,
>=20
> I have a extrange issue with a conntrack entry. There is a nat server
> configure in this way
>=20
>     DMZ  194.139.30.0/23  ---  194.139.30.16  nat 192.168.12.100 ----=
=20
> 192.168.12.0/24  private network
>=20
> The nat machine does postrouting in all traffic from the private netw=
ork
> to DMZ, and there is no problem but in one server in the DMZ with
> windows 2008 server the traffic doesn't return to the origin, I can s=
ee
> the traffic with tcpdump like this
>=20
> 17:19:23.971978 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], pro=
to:
> ICMP (1), length: 84) 192.168.12.91 > 194.139.30.62: ICMP echo reques=
t,
> id 12075, seq 1, length 64    <-----   The echo request original OK
>=20
> 17:19:23.972094 IP (tos 0x0, ttl  63, id 0, offset 0, flags [DF], pro=
to:
> ICMP (1), length: 84) 194.139.30.16 > 194.139.30.62: ICMP echo reques=
t,
> id 12075, seq 1, length 64    <------ Masquerade the source IP OK
>=20
> 17:19:23.972164 IP (tos 0x0, ttl 128, id 25050, offset 0, flags [none=
],
> proto: ICMP (1), length: 84) 194.139.30.62 > 194.139.30.16: ICMP echo
> reply, id 12075, seq 1, length 64    <------- The echo reply OK
>=20
> =BF?=BF?=BF?   <-----------    Lost echo reply not OK
>=20
> There isn't the packet from 194.139.30.16 to 192.168.12.91 despite of=
f
> the conntrack table show
>=20
> cat /proc/net/ip_conntrack | grep '30.62'
> icmp     1 29 src=3D192.168.12.91 dst=3D194.139.30.62 type=3D8 code=3D=
0 id=3D12075
> packets=3D11 bytes=3D924 [UNREPLIED] src=3D194.139.30.62 dst=3D194.13=
9.30.16
> type=3D0 code=3D0 id=3D12075 packets=3D0 bytes=3D0 mark=3D0 use=3D1
>=20
> The packet in tcpdump match on the conntrack entry. "id 12075" in bot=
h
> cases, but if I LOG the traffic with the LOG iptables target I see th=
e
> reply in INPUT table not in the FORWARD.
>=20
> Thank you and sorry for me bad english.
>=20
This behaviour indicates, that conntrack classifies the traffic into
state INVALID. Thus it is not natted, as stateful nat needs traffic to
be valid for conntrack.
I don't know why it happens in that particular case, but you can try to
debug it a little more.
If your kernel supports it, you can set
/proc/sys/net/netfilter/nf_conntrack_log_invalid to 1.

-m state --state INVALID -j LOG --log-level debug ....
in INPUT/FORWARD.

Also providing iptables-save output, kernel version, etc.. is helpful.

As this only happens with win2008, you might try to find some IP
settings there?

Best regards

Mart
