From: "Demetrios J. Tsillas" <jtsillas@appledor.net>
Subject: ftp active mode conntracking with bridging
Date: Wed, 30 Sep 2009 14:43:03 -0400
Message-ID: <420ac3cdecfa692b493bc62e2ba3f4da.squirrel@www.appledor.net>
Reply-To: jtsillas@appledor.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

I am implementing a transparent proxy to handle active mode ftp and
so far have it working on a router with two ports but I am now trying t=
o
get the same proxy to work on a bridge interface.

My bridge is setup as:

brctl addbr br0
brctl addif br0 eth1 eth2
ifconfig br0 10.0.0.27/24
echo 1 > /proc/sys/net/ipv4/ip_forward

Now to get the bridge packets to show up I do:

ebtables -t nat -A PREROUTING --logical-in br0 -p IPv4 --ip-proto tcp -=
j
redirect --redirect-target ACCEPT

This will redirect ALL tcp, including port 21 which is the ftp server p=
ort.

I also have an iptables rule:

iptables -t nat -A PREROUTING -p tcp -m physdev --physdev-in eth1 -j
REDIRECT --to-ports 9033

=46rom a client machine (IPAddr=3D10.0.0.31) I now try to ftp to the
ftp.gnu.org server (140.186.70.20).

My transparent proxy is listening on port 9033 and receives the expecte=
d
connection (according to conntrack -E):

[NEW] tcp      6 120 SYN_SENT src=3D10.0.0.31 dst=3D140.186.70.20 sport=
=3D1554
dport=3D21 [UNREPLIED] src=3D10.0.0.27 dst=3D10.0.0.31 sport=3D9033 dpo=
rt=3D1554
[UPDATE] tcp      6 60 SYN_RECV src=3D10.0.0.31 dst=3D140.186.70.20 spo=
rt=3D1554
dport=3D21 src=3D10.0.0.27 dst=3D10.0.0.31 sport=3D9033 dport=3D1554
[UPDATE] tcp      6 432000 ESTABLISHED src=3D10.0.0.31 dst=3D140.186.70=
=2E20
sport=3D1554 dport=3D21 src=3D10.0.0.27 dst=3D10.0.0.31 sport=3D9033 dp=
ort=3D1554
[ASSURED]
[UPDATE] tcp      6 120 FIN_WAIT src=3D10.0.0.31 dst=3D140.186.70.20
sport=3D1554 dport=3D21 src=3D10.0.0.27 dst=3D10.0.0.31 sport=3D9033 dp=
ort=3D1554
[ASSURED]
[UPDATE] tcp      6 10 CLOSE src=3D10.0.0.31 dst=3D140.186.70.20 sport=3D=
1554
dport=3D21 src=3D10.0.0.27 dst=3D10.0.0.31 sport=3D9033 dport=3D1554 [A=
SSURED]

=85 a few seconds later:

[DESTROY] tcp      6 src=3D10.0.0.31 dst=3D140.186.70.20 sport=3D1554 d=
port=3D21
packets=3D7 bytes=3D332 src=3D10.0.0.27 dst=3D10.0.0.31 sport=3D9033 dp=
ort=3D1554
packets=3D11 bytes=3D1147

But it appears that the ftp conntrack couldn't detect the PORT command =
to
associate the active mode return connection. So a DIR command fails on =
the
ftp client.

I emabled debug printk's in ip_conntrack_ftp.c and it printed the pskle=
n
message on line 330 for two packets. It appears the dataoffset calculat=
ion
may be incorrect for these bridged packets.

thanks!!!
-Jim.






