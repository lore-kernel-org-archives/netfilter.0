From: Martin Vassilev <mv-lists@net-surf.net>
Subject: Problem with transparent proxing if catching traffic on vlan
	interface
Date: Thu, 12 May 2005 14:52:38 +0300
Message-ID: <200505121452.39043.mv-lists@net-surf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello , first of all sorry for poor english.

Have some trouble with transparent proxing=09

Configuration is simple:

=2D-----------                            ----------
|CLIENT| ---- eth/vlans ---- | GATE|
=2D-----------                            ----------
					transparent proxy


=2D-----------------test1---------------------
GATE:/#iptables  -t nat -I PREROUTING -p TCP -s `CLIENT`  \
=2D-destination-port 80 -i vlan8 -j REDIRECT --to-ports 3128=20

CLIENT:/# telnet www.netfilter.org 80
Trying 213.95.27.115...
telnet: connect to address 213.95.27.115: Connection refused=20
(thats the problem ;))

GATE:/# tcpdump  -n -i vlan8 -f "net `CLIENT`"
tcpdump: listening on vlan8
11:43:28.336226 `CLIENT`.38842 > 213.95.27.115.80: S 1057989664:1057989664(=
0)=20
win 5840 <mss 1412,sackOK,timestamp 1881955228 0,nop,wscale 2> (DF) [tos=20
0x10]

GATE:/# iptables -t nat -n -L -v
Chain PREROUTING (policy ACCEPT 32M packets, 1991M bytes)
 pkts bytes target     prot opt in     out     source              =20
destination
    1    60 REDIRECT   tcp  --  vlan8  *       `CLIENT`      0.0.0.0/0     =
    =20
tcp dpt:80 redir ports 3128

nothing appear in squid=B4s access.log


=2D---------------test2------------------------
After some rerouting to reach the gate through eth0

GATE:/#iptables  -t nat -I PREROUTING -p TCP -s `CLIENT`  \
=2D-destination-port 80 -i eth0 -j REDIRECT --to-ports 3128=20

and all works fine.
=2D--------------------------------------------

Is there any differents for netfilter if catching traffic on eth or vlan=20
interface ?

P.S.
Don=B4t have MTU problems with vlans.
Tried to flush all tables before testing.
Squid is configured properly.


=2D-=20
Best Regards,
Martin Vassilev


