From: Corey Quinn <corey@sequestered.net>
Subject: Traffic traverses OpenSwan tunnel, return traffic does not
Date: Sat, 1 Oct 2011 12:05:22 -0700
Message-ID: <0F5ECE8E-608E-41BC-9C37-2A5FF23A2687@sequestered.net>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

I have a box with a iptables on it (usually a good prerequisite for mai=
ling this list) that has a public IP (munged) of 216.52.2.93.  I'm atte=
mpting to build an IPSEC tunnel between this box and a Fortinet 60C.  I=
 can send traffic across the IPSEC link from the Fortigate (tcpdump sho=
ws it arriving properly), but the return packets (as well as anything e=
lse that I attempt to push over the tunnel) to 192.168.7.1 (the Fortiga=
te) die at the default gateway (216.52.2.94)-- they're never entering t=
he tunnel, and RFC1918 addresses don't route, obviously.

The iptables setup on this box is somewhat convoluted, hence my suspici=
ons.  (I've stripped out a few rewrites that don't touch those networks=
 and consistently munged the IPs for obvious reasons=85)

Is this actually an iptables issue, or am I barking up the wrong tree? =
 iptables and routing table are below, please let me know if there's an=
ything else I should provide.


root@bel:~# iptables -L -n
Chain INPUT (policy DROP)
target     prot opt source               destination        =20
DROP       all  --  124.115.4.198        0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            1.2.3.4       state RELATED,ES=
TABLISHED=20
ACCEPT     all  --  0.0.0.0/0            192.168.7.1         state RELA=
TED,ESTABLISHED=20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type =
8=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:88=
22=20
ACCEPT     udp  --  216.86.2.151       0.0.0.0/0           udp dpt:1194=
=20
ACCEPT     udp  --  67.159.1.30        0.0.0.0/0           udp dpt:1194=
=20
ACCEPT     udp  --  67.159.1.58        0.0.0.0/0           udp dpt:1194=
=20
ACCEPT     udp  --  216.86.1.9         0.0.0.0/0           udp dpt:1194=
=20
ACCEPT     udp  --  24.43.1.162        0.0.0.0/0           udp dpt:1194=
=20
ACCEPT     all  --  0.0.0.0/0            192.168.7.0/24     =20
ACCEPT     all  --  0.0.0.0/0            192.168.7.1        =20
ACCEPT     udp  --  192.168.7.10         0.0.0.0/0           udp dpt:16=
1=20
ACCEPT     tcp  --  0.0.0.0/0            64.94.6.66        tcp dpt:80=20
ACCEPT     tcp  --  0.0.0.0/0            64.94.6.66        tcp dpt:443=20

Chain FORWARD (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  0.0.0.0/0            10.8.0.0/24        =20
ACCEPT     all  --  0.0.0.0/0            192.168.7.0/24     =20
ACCEPT     all  --  0.0.0.0/0            192.168.8.0/24      state RELA=
TED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            10.7.0.6            state RELA=
TED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           multiport =
dports 21,25,53,80,123,443,993=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           multiport =
dports 53,123=20
ACCEPT     udp  --  0.0.0.0/0            192.168.7.10        multiport =
dports 53,123=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.10        multiport =
dports 53,123=20
ACCEPT     all  --  192.168.7.10         0.0.0.0/0           state RELA=
TED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            192.168.7.0/24      state RELA=
TED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.10        multiport =
dports 80=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.42        multiport =
dports 8051=20
ACCEPT     tcp  --  192.168.7.42         0.0.0.0/0           multiport =
dports 8051=20

ACCEPT     tcp  --  192.168.7.42         0.0.0.0/0           tcp spt:80=
51=20
ACCEPT     all  --  192.168.11.0/24      0.0.0.0/0          =20

Chain OUTPUT (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  216.52.2.94        0.0.0.0/0           state NEW,RE=
LATED,ESTABLISHED=20
ACCEPT     all  --  192.168.7.1          0.0.0.0/0           state NEW,=
RELATED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            192.168.8.0/24     =20
ACCEPT     all  --  0.0.0.0/0            10.7.0.6           =20
ACCEPT     udp  --  0.0.0.0/0            192.168.7.10        udp spt:16=
1=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.31        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.32        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.33        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.34        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.35        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.37        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.38        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.39        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.40        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.41        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.42        tcp dpt:80=
=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.31        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.32        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.33        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.34        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.35        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.37        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.38        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.39        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.40        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.41        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.42        tcp dpt:44=
3=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.7.42        tcp dpt:80=
51=20

root@bel:~# netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irt=
t Iface
10.7.0.2        0.0.0.0         255.255.255.255 UH        0 0          =
0 tun0
192.168.7.0     0.0.0.0         255.255.255.0   U         0 0          =
0 eth1
10.8.0.0        10.7.0.2        255.255.255.0   UG        0 0          =
0 tun0
216.52.2.0    0.0.0.0         255.255.255.0   U         0 0          0 =
eth0
192.168.11.0    0.0.0.0         255.255.255.0   U         0 0          =
0 eth0
10.7.0.0        10.7.0.2        255.255.255.0   UG        0 0          =
0 tun0
192.168.8.0     10.7.0.2        255.255.255.0   UG        0 0          =
0 tun0
0.0.0.0         216.52.2.93   0.0.0.0         UG        0 0          0 =
eth0

eth0 is the public interface, eth1 is the internal interface, and tun0 =
is an OpenVPN server that doesn't factor into these issues, but I've in=
cluded it for clarity.

-- Corey / KB1JWQ

