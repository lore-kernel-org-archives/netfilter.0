From: Jakub Sztandera <k.sztandera@hotmail.com>
Subject: nftables: NAT table not receiving any traffic
Date: Sat, 31 Oct 2015 13:56:39 +0100
Message-ID: <DUB122-W3470AB4A4B403D576C00A3EA2E0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

we have recently transitioned from iptables to nftables. Our network ar=
chitecture isn't simple
but it can be simplified for the sake of this message.
We also use a lot of LXC (cgroups) and we suspect that it might play a =
role in this case.

This instance of nftables is in LXC container (51.254.25.16, 10.1.0.1).
This container uses following interfaces:
eth0 - for WAN communication. IP: 51.254.25.16
br0 - LAN, connected to higher level bridge. Whole internal network wor=
ks in 10.0.0.0/8 subnet, this bridge handles 10.1.0.0/16.
multiple veth - for joining containers inside this one to br0.
and few more but those are probably not important.

Rough sketch of the network: http://assets.magik6k.net/screenshoots/144=
6293074.png
nftables configuration at the bottom of the message.

Behaviour that causes the issue is simple `table ip nat` with (pos|pre)=
routing hooks does not receive any traffic.
http://assets.magik6k.net/screenshoots/1446289768.png
Packets go through forward chain (counter increases) in the `inet filte=
r` table but are not to be seen in routing chains.

Using tcpdump we are able to see packets going in to the bridge interfa=
ce and going out through the eth0
but without SNAT applied.
Packets did not even enter NAT chains which does not change after flush=
ing conntracker.

This issue appeared randomly after installation, configuration of nftab=
les of first restart of whole physical machine and was resolved
either by us (there was mismatch with MAC address which could have caus=
ed confusion of filtering)
or randomly by itself. It reappeared now (about 24h after first one) in=
 different container
(different bridge and interfaces but setup very similar to the first on=
e).

Our networking was working without any problems for about 3 months with=
 iptables before issues started happening with nftables.
The nat module of iptables was removed blacklisted and disabled in modp=
robe.d so it is not causing any interference with nftables.
We think that there might be some problem with cgroups compatibility of=
 nftables but we have no way to be sure.

If you have any ideas or thoughts how to debug this problem we will be =
happy to check them as we are out of our owns.

Best regards,
Jakub (Kubuxu) Sztandera

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
nftables configuration:

table inet filter {
=A0 chain input {
=A0=A0=A0 type filter hook input priority 0;
=A0=A0=A0 accept
=A0 }
=A0 chain forward {
=A0=A0=A0 type filter hook forward priority 0;
=A0=A0=A0 counter
=A0=A0=A0 accept
=A0 }
=A0 chain output {
=A0=A0=A0 type filter hook output priority 0;
=A0=A0=A0 accept
=A0 }
}
table ip nat {
=A0 chain prerouting {
=A0=A0=A0 type nat hook prerouting priority 0;
=A0=A0=A0 counter;
=A0=A0=A0 iif eth0 tcp dport 53 dnat 51.254.25.23
=A0=A0=A0 iif eth0 udp dport 53 counter dnat 51.254.25.23
=A0=A0=A0 iif eth0 tcp dport 13000 dnat 10.1.0.3
=A0 }

=A0 chain postrouting {
=A0=A0=A0 type nat hook postrouting priority 0;
=A0=A0=A0 counter
=A0=A0=A0 oif eth0 counter snat 51.254.25.16
=A0 }
}
 		 	   		  