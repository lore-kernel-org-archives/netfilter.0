From: David Rye of Roadtech <d.rye@roadtech.co.uk>
Subject: Re: iptables-- problem in loadbalancing(ROUTE) with bandwidth
	management
Date: Tue, 05 Oct 2004 18:21:57 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4162D835.6C605292@roadtech.co.uk>
References: <200410051335.i95DZR001904@securegate.mailserver.gajshield.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

bruce wrote:
>=20
> Hi,
>=20
> I am involving in firewall development. I have one problem with bandwid=
th
> management (filtering by "fw" option)  and loadbalancing(using ROUTE pa=
tch)
> coming together.
>=20
> Configuration is linux redhat kernal 2.4.27  and iptables v1.2.11
>=20
> Testing  set up is follows
>=20
> 192.168.2.12 (source)------->
> 192.168.2.182(FW on eth0)
> [aliases 192.168.8.1(eth1),192.168.9.1(eth2)]
> ------->192.168.9.2(Router)[aliases 192.168.8.2, 202.54.1.4]
> ------------>202.54.1.5(destination)
>=20

I am not sure about this but lets have a go.....

The chains will be processed in the order=20
Forward
Postrouting Mangle
Postrouting NAT


> Rules
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

> # filtering rules
> /sbin/iptables -A FORWARD -p tcp -s 192.168.2.0/24 --sport 1024:65535 -=
d
> 202.54.1.5 --dport 80 -j ACCEPT
> /sbin/iptables -A FORWARD -p tcp -s 202.54.1.5 --sport 80 -d 192.168.2.=
0/24
> --dport 1024:65535 -j ACCEPT
>=20


> # marking rule for packets
> /sbin/iptables -A POSTROUTING -t mangle -o eth0 -p tcp -s 202.54.1.5 --=
sport
> 80 -d 192.168.2.0/24 --dport 1024:65535 -j MARK --set-mark 0x41
> /sbin/iptables -A POSTROUTING -t mangle -o eth2 -p tcp -s 192.168.2.0/2=
4
> --sport 1024:65535 -d 202.54.1.5 --dport 80 -j MARK --set-mark 0x40
>=20
> # loadbalancing rules
> /sbin/iptables  -A POSTROUTING -t mangle  -p tcp -s 192.168.2.0/24 --sp=
ort
> 1024:65535 -d 202.54.1.5 --dport 80 -m random --average 50 -j ROUTE --o=
if eth2
> /sbin/iptables  -A POSTROUTING -t mangle  -p tcp -s 192.168.2.0/24 --sp=
ort
> 1024:65535 -d 202.54.1.5 --dport 80 -j ROUTE --oif eth1
>=20

Now the notes on route at=20
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-=
4.html#ss4.5

Say that :-=20

		----------------------------------------------------
This patch by C=E9dric de Launois <delaunois@info.ucl.ac.be> adds a new
target which allows you to setup unusual routes not supported by the
standard kernel routing table. The
ROUTE target lets you route a received packet through an interface or
towards a host, even if the regular destination of the packet is the
router itself. The ROUTE target is also able
to change the incoming interface of a packet. Packets are directly put
on the wire and do not traverse any other table.

This target does not modify the packets and is a final target. It has to
be used inside the mangle table.

Whenever possible, you should use the MARK target together with iproute2
instead of this ROUTE target. However, this target is useful to force
the use of an interface or a next hop
and to change the incoming interface of a packet. People also use it for
easiness and to simplify their rules (one rule to route a packet is
easier that one MARK rule + one iproute2
rule).
		-----------------------------------------------------

If packets are put direct to the wire they will never reach this rule.
:-(

> #nat rule for natting on external interface of firewall
> /sbin/iptables -t nat -A POSTROUTING -o eth2 -p tcp -s 192.168.2.0/24 -=
-sport
> 1024:65535 -d 202.54.1.5 --dport 80 -j SNAT --to-source 192.168.9.1
>=20

It may pay to follow C=E9dric de Launois's advice and have a look at=20

http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.loadshare.html



> # delete all existing qdisc
> /sbin/tc qdisc del dev eth0 root 2>/dev/null
> /sbin/tc qdisc del dev eth1 root 2>/dev/null
> /sbin/tc qdisc del dev eth2 root 2>/dev/null
>=20
> # create parent qdisc
> /sbin/tc qdisc add dev eth1 root handle 2:0 cbq bandwidth 10mbps avpkt =
1000
> cell 8
> /sbin/tc qdisc add dev eth0 root handle 1:0 cbq bandwidth 10mbps avpkt =
1000
> cell 8
> /sbin/tc qdisc add dev eth2 root handle 3:0 cbq bandwidth 10mbps avpkt =
1000
> cell 8
>=20
> #class for eth2
> /sbin/tc class add dev eth2 parent 3:0 classid 3:1 cbq bandwidth 1000kb=
ps
> rate 1000kbps allot 1514 cell 8 avpkt 1000
> /sbin/tc qdisc  add dev eth2 parent 3:1 handle 100: sfq
> /sbin/tc filter add dev eth2 protocol ip parent 3:0 handle 0x40 fw clas=
sid 3:1
>=20
> #class for eth0
> /sbin/tc class add dev eth0 parent 1:0 classid 1:1 cbq bandwidth
> 1000kbps
> rate 1000kbps allot 1514 cell 8 avpkt 1000
> /sbin/tc qdisc  add dev eth0 parent 1:1 handle 101: sfq
> /sbin/tc filter add dev eth0 protocol ip parent 1:0 handle 0x41 fw clas=
sid 1:1
>=20
> The firewall routing table is
> Destination     Gateway         Genmask         Flags   MSS Window  irt=
t Iface
> 192.168.2.0     0.0.0.0         255.255.255.0   U         0 0          =
0 eth0
> 192.168.9.0     0.0.0.0         255.255.255.0   U         0 0          =
0 eth2
> 192.168.8.0     0.0.0.0         255.255.255.0   U         0 0          =
0 eth1
> 169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          =
0 eth2
> 127.0.0.0       0.0.0.0         255.0.0.0       U         0 0          =
0 lo
> 0.0.0.0         192.168.8.2     0.0.0.0         UG        0 0          =
0 eth1
>=20
> The program is to get  http page from  202.54.1.5 , accessing from
> 192.168.2.12. I am getting http page
>=20
> But the problems are
> 1.  natting is not working(ie on 202.54.1.5, it showing that the reques=
t came
> from 192.168.2.12)
> 2. The packets are not passing through the class(3:1) on eth2 device.
> But it is passsing through eth0
>=20
> #/sbin/tc -s class show  dev eth2
> class cbq 3: root rate 80Mbit (bounded,isolated) prio no-transmit
>  Sent 1137 bytes 10 pkts (dropped 0, overlimits 0)
>   borrowed 0 overactions 0 avgidle 77 undertime 0
> class cbq 3:1 parent 3: leaf 100: rate 8000Kbit prio no-transmit
>  Sent 0 bytes 0 pkts (dropped 0, overlimits 0)
>   borrowed 0 overactions 0 avgidle 0 undertime 0
>=20
> #/sbin/tc -s class show  dev eth0   THIS IS OK
> class cbq 1: root rate 80Mbit (bounded,isolated) prio no-transmit
>  Sent 13410 bytes 58 pkts (dropped 0, overlimits 0)
>   borrowed 6 overactions 0 avgidle 77 undertime 0
> class cbq 1:1 parent 1: leaf 101: rate 8000Kbit prio no-transmit
>  Sent 7728 bytes 17 pkts (dropped 0, overlimits 0)
>   borrowed 6 overactions 0 avgidle 77 undertime 0
>=20
>=20
> Note:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> SNAT with bandwith management is working properly. Also loadbalancing w=
ith
> SNAT is working properly.
>=20
> Doubts
> =3D=3D=3D=3D=3D=3D=3D=3D
> I have doubts that any mismatching of target rules -j MARK and -j ROUTE
> in  mangle table?
> Is there any importance of target rules order. ie. first MARK then ROUT=
E
>=20
>=20
>=20
> if anybody have a solution please help me
>=20
> THANKS IN ADVANCE
> Bruce

--=20
J. David Rye
http://www.roadrunner.uk.com
http://www.rha.org.uk
mailto://hostman@netman.road-runner.net

