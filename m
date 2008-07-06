From: =?ISO-8859-1?Q?Pekka_J=E4rvinen?= <pekkajarvinen@kolumbus.fi>
Subject: NAT only selected bridges
Date: Mon, 07 Jul 2008 01:49:37 +0300
Message-ID: <48714C01.6000207@kolumbus.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I have
VLAN 111 - LAN
VLAN 222 - WLAN
VLAN 333 - ADSL Modem
VLAN 444 - Internet (connecting through VLAN 333)

br0 - Internet
br1 - LAN 192.168.0.0/24
br2 - WLAN 192.168.1.0/24

With current setup br1 and br2 are NAT'ed correctly but connections=20
coming straight from br0 are NAT'ed too for some reason.

So I'm trying to set up rules for something like:
NAT br1 and br2 and don't change IP addresses coming directly from br0=20
(or VLAN 444).


Here's /etc/network/interfaces:
auto lo
iface lo inet loopback

allow-hotplug eth0
allow-hotplug eth1

iface eth0 inet static
iface eth1 inet static

auto br0
auto br1
auto br2

# Internet bridge
iface br0 inet static
        address 62.204.1.12
        netmask 255.255.255.128
        gateway 62.204.1.1
        bridge_ports eth1.333 eth0.444
        bridge_stp on
        post-up iptables -t nat -A POSTROUTING -o br0 -j MASQUERADE
        pre-down iptables -t nat -D POSTROUTING -o br0 -j MASQUERADE

# LAN bridge
iface br1 inet static
        address 192.168.0.1
        netmask 255.255.255.0
        bridge_ports eth0.111
        bridge_stp on

# WLAN bridge
iface br2 inet static
        address 192.168.1.1
        netmask 255.255.255.0
        bridge_ports eth0.222
        bridge_stp on

# -----

ipv4 forward is enabled.

--=20
Pekka J=E4rvinen
