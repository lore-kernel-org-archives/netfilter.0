From: Jonathan Haws <Jonathan.Haws@sdl.usu.edu>
Subject: Dual e1000e not working with iptables
Date: Sat, 26 Mar 2011 17:55:07 +0000
Message-ID: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC3DDEA0A5@Mercury.usurf.usu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am trying to setup a new router for my network.=A0 It is a typical se=
tup - my home LAN with a single internet connection I want to share wit=
h all computers.=A0 My current router is running Debian with a 2.6.18 k=
ernel and iptables version 1.3.6 and dnsmasq 2.35.=A0 The new router is=
 running Debian with a 2.6.36 kernel and iptables version 1.4.2 and dns=
masq 2.45.

I took the iptables script from my previous router and put it on the ne=
w router, but it does not work.=A0 I cannot get it to forward anything.=
=A0 I cannot figure out what is going on and am hoping that people on t=
his list can help me out.=A0 Here is the script:


iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

iptables --table nat --append POSTROUTING --out-interface eth1 -j MASQU=
ERADE
iptables --append FORWARD --in-interface eth0 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

# unlimited access to LAN
iptables -A INPUT -i eth0 -j ACCEPT
iptables -A OUTPUT -o eth0 -j ACCEPT

echo " -> Restarting iptables service ..."
iptables-save


Can anyone see what I am doing wrong?=A0 Just in case something is diff=
erent between versions, I created a whole new set of rules that should =
do what I want, but cannot get it to work either:


# Delete existing rules
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

# Always accept loopback traffic
iptables -A INPUT -i lo -j ACCEPT

# Allow established connections and those not from the outside
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state NEW -i ! eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATE=
D -j ACCEPT

# Allow outgoing connections from the LAB side
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

# Masquerade
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Don't forward from the outside to the inside
iptables -A FORWARD -i eth0 -o eth0 -j REJECT

# Enable routing
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -A FORWARD -i eth1 -s 192.168.1.0/255.255.255.0 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.1.0/255.255.255.0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

PS=A0 - Don't worry about the different subnets - I am trying to get th=
is new router working to route through the existing router.

Thanks for the help!

Jonathan





