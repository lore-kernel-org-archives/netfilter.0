From: homer_2008@gmx.net
Subject: Firewallrules for a gentoo box with 4 nics
Date: Tue, 24 Nov 2009 20:45:47 +0100
Message-ID: <20091124194547.155180@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

Hi list,

I am playing with a little gentoo box installed on a pcengine alix boar=
d with four nics. I need to secure it with the iptables firewall. Here =
is the configuration of the nics:
------------------------------------------------------------
1. eth0 (internal trusted network)
2. eth1,ppp0 (internet DSL (ppp0) with DHCP IP address changing every 2=
4 hours)
3. eth2 (a DMZ Zone with a single Webserver)
4. wlan0 (miniPCI atheros card)(Wireless LAN interface only webtraffic =
should be enabled)

------------------------------------------------------------
InternetDSL --> eth1(carrier)ppp0=20
Internal network --> eth0
DMZ --> eth2
------------------------------------------------------------
=46rom the internet all ports should be closed accept all related,estab=
lished connections. One port should be open for openvpn 1194/udp.

The internal network should have open the DHCP,DNS,HTTP ports.

The wireless wlan0 nic should only have open the port 80 for webtraffic=
=2E

The DMZ should only have the ports open for the webserver.

NAT should be from the internet (ppp0,eth1) to the internal network (et=
h0) and eth2(DMZ)
------------------------------------------------------------
the ips for the nics should be the following:

eth0 - internal - 192.168.0.0/24
eth1(ppp0) - DHCP because DSL IP is changing every 24 hours.
eth2 - 172-16.0.0/24

------------------------------------------------------------

My question to the list is, how can I realize this idea with iptables?

I hope you help me on this task.

Homer

--=20
Preisknaller: GMX DSL Flatrate f=FCr nur 16,99 Euro/mtl.!
http://portal.gmx.net/de/go/dsl02
