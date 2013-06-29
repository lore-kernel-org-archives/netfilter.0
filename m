From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: 'Invalid packet' problem since upgrading
Date: Sat, 29 Jun 2013 13:55:11 +0200
Message-ID: <51CECB1F.2050609@plouf.fr.eu.org>
References: <51BF10F2.2040808@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51BF10F2.2040808@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: alleninmt@gmail.com
Cc: netfilter <netfilter@vger.kernel.org>

Hello,

Allen Seelye a =E9crit :
>=20
> I have a PC acting as a firewall and router, using iptables. We have =
a
> Wii-U inside the network and until a few days ago, it had no
> connectivity problems at all. I upgraded the firewall PC from Kubuntu
> 10.04 to 12.04 and suddenly the Wii-U cannot connect.
>=20
> It would appear that this is not a problem with the Wii-U. If I conne=
ct
> it directly to the Optimum modem, everything works fine. It's somethi=
ng
> wonky with the Kubuntu PC, since I upgraded. Nothing in my
> iptables.rules has changed. I'm using the same set of rules as before
> the upgrade.

Did you check with iptables-save that the actual resulting ruleset is
the same as before ?

> Other things I've tried:
>=20
> I've opened the firewall up completely, allowing all traffic through.
> I've explicitly allowed all traffic on all ports, to and from the Wii=
-U.
> I've tried running several older kernels.

Even the old kernel from the previous version of Ubuntu that ran fine ?

> I've tried shutting down apparmor.
>=20
> None of these have worked.
>=20
> The only thing that did work, was to remove the Kubuntu box completel=
y
> and connect my switch directly to the Optimum modem.
>=20
> I have no rules in place restricting the Wii-U at all. I do a grep in
> syslog for the Wii-U's IP and I get a lot of this:
>=20
> --------------------------
> kernel: [ 7236.919902] Invalid packet: IN=3Deth0 OUT=3Deth1
> MAC=3D00:c0:f0:2d:9e:b4:18:2a:7b:85:09:e5:08:00 SRC=3D192.168.58.38
> DST=3D23.43.226.90 LEN=3D1042 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D36=
93 PROTO=3DTCP
> SPT=3D1772 DPT=3D443 WINDOW=3D32768 RES=3D0x00 ACK PSH FIN URGP=3D0
> --------------------------

What is the match which produces this message ? Is it based on the
INVALID state ? I wonder if a segment with data, FIN and PSH flags is
valid...
Note that such messages may not be harmful, this could be a duplicate
=46IN segment from an old forgotten connection. On several cases I have
seen a supposedly error message that was actually unrelated to the prob=
lem.

> If I'm interpreting this correctly, it thinks that there is a problem
> with the packets coming from the Wii-U and it's dropping them. I've
> tried removing the rule that drops invalid packets and it stopped
> putting these warnings in the log, but the Wii-U still can't connect =
to
> the Nintendo network.

If the problem is related to connection tracking, then it will affect
also the NAT operation, and from the private address in the log I guess
you need masquerading. If a packet is in the INVALID state, then it is
ignored by the NAT table and leaves the router with its original privat=
e
source address unmodified (which you can check with a packet capture on
the external interface). Such packet will of course be discarded on the
public internet. If the TCP connection tracking is over-zealous, you ca=
n
try to make it more tolerant by setting
/proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal to 1.
