From: =?UTF-8?Q?=c3=98yvind_Kaurstad?= <oyvind@dynator.no>
Subject: Can't get nftables ct mark to trigger iproute rule
Date: Mon, 14 Nov 2016 17:56:38 +0100
Message-ID: <fddca945-33e3-218c-650a-50c8427f5ad2@dynator.no>
Reply-To: oyvind@dynator.no
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have spent a lot of time investigating this myself, and I believe what=20
I am trying should have worked, so I am now at a dead end.

I have a custom Linux machine (kernel version 4.1.6), which has two=20
physical ethernet interfaces and one ppp interface.

Here's the setup (with fictious IP addresses):

eth0 has IP 192.168.10.10
eth1 has IP 192.168.100.10
ppp0 has IP 10.10.10.10

eth0 is connected to the local LAN, while eth1 is connected to a network=20
of different devices. ppp0 is connected to a remote network.

Please note that the address of the ppp interface is not static, it=20
changes frequently (at the whim of the mobile operator).

In the eth1 network there is a server with IP 192.168.100.1, and this=20
server listens to UDP ports 41000-41002. I need to be able to=20
communicate with this server both via eth0 and ppp0. Incoming packets to=20
either of these interfaces will therefore need to be DNATed to reach=20
this host.

So, here's my initial nftables config:

table ip firewall {
         chain incoming {
                 type filter hook input priority 0; policy drop;
                 ct state established,related accept
                 iifname "lo" accept
                 icmp type echo-request accept
                 tcp dport { ssh} accept
         }

         chain prerouting {
                 type nat hook prerouting priority 0; policy accept;
                 iifname "ppp0" udp dport 41000-41002 dnat 192.168.100.1
                 iifname "eth0" udp dport 41000-41002 dnat 192.168.100.1
         }

         chain postrouting {
                 type nat hook postrouting priority 100; policy accept;
                 oifname !=3D "lo" masquerade
         }
}

My routing rules for iproute2 looks like this (the rule with prio 2000=20
is updated whenever the ppp address changes):

0:      from all lookup local
1000:   from 192.168.100.1 lookup ppproute
2000:   from 10.10.10.10 lookup ppproute
32766:  from all lookup main
32767:  from all lookup default

And the ppproute table only contains a default route over ppp0:

default dev ppp0  scope link

With this setup, everything works correctly if the inbound traffic comes=20
in over ppp0. Packets are correctly rewritten by nftables/netfilter, and=20
exits out eth1. The return traffic hits the 1000 rule, and exits back to=20
the sender.

If the traffic comes in over eth0, it also hits the host at=20
192.168.100.1 as it should, but the return traffic is also routed back=20
out over ppp0, which is my problem. I obviously need those packets to go=20
back out eth0 to reach the client.

Since I have masquerading enabled for all but the lo interface, the=20
packets coming back from the host at 192.168.100.1 has a destination=20
address of 192.168.100.10. The 1000 rule works because it takes any=20
traffic coming from 192.168.100.1 and sends it to ppp0. This is clearly=20
the wrong approach, as I also need to be able to talk to the server over=20
eth0.

To be able to distinguish the traffic that comes in over ppp0, I tried=20
to change the DNAT rule for traffic from ppp0 to this:

iifname "ppp0" udp dport 41000-41002 ct mark set 0x1 dnat 192.168.100.1

...and then I changed the ip rules to this:

Code:

0:      from all lookup local
1000:   from 192.168.100.1 fwmark 0x01 lookup ppproute
2000:   from 10.10.10.10 lookup ppproute
32766:  from all lookup main
32767:  from all lookup default

Now I can communicate over eth0, but if the traffic comes in over ppp0,=20
the return traffic also goes back out eth0, so rule 1000 isn't being hit.

When I check the connection track entry, I see this:

udp      17 25 src=3D10.11.12.13 dst=3D10.10.10.10 sport=3D34624 dport=3D41=
000=20
src=3D192.168.100.1 dst=3D192.168.100.10 sport=3D41000 dport=3D34624 mark=
=3D1 use=3D1

The connection is marked with 0x01 as dictated by the DNAT rule, and the=20
server replied as it should. However, the routing rule that should=20
trigger on the mark isn't hit.

I also added a forward chain with counters to see if packets was marked,=20
and the counters were hit.

In other words, return traffic traversing the forward chain was=20
correctly marked, so I can't understand why the routing rule doesn't=20
send the traffic back out ppp0.

rp_filtering is turned off for all interfaces, and forwarding is enabled.

--=20
   ________________________________________________
   =D8yvind Kaurstad, Grutlekleiva 16, 5517 Haugesund
   Tlf: 52 72 41 98, Mob: 990 86 990
   Email: oyvind@dynator.no
