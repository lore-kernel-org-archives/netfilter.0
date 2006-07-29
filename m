From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: unDNATting and advanced routing; policyrouting local packets
Date: Sat, 29 Jul 2006 20:12:20 +0200
Message-ID: <b3fe111cce2f910de8a0d62de9c23b43@former03.de>
Mime-Version: 1.0 (Apple Message framework v624)
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everybody,

I have a machine with two internet connections (ADSL and leased line)=20
which is supposed to do routing and for our  local company network.

One of the things it should to is map some external ports to internal=20
machines in the DMZ (e.g. port 80 on external interface 1 should go to=20=

192.168.192.168, port 25 on external interface 2 to 192.168.192.1).

The nat works well for the interface which has the default route. The=20
nat rules look like this:

=3D=3D=3D Table nat, Chain PREROUTING (policy ACCEPT 125 packets, 11210 =
bytes)
  pkts bytes target     prot opt in     out     source              =20
destination
     1    60 DNAT       tcp  --  any    any     anywhere            =20
extip1  tcp dpt:2201 to:192.168.192.168
     7   420 DNAT       tcp  --  any    any     anywhere            =20
extip2 tcp dpt:2201 to:192.168.192.168

=3D=3D=3D Table nat, Chain POSTROUTING (policy ACCEPT 36 packets, 2955 =
bytes)
  pkts bytes target     prot opt in     out     source              =20
destination
     1    60 SNAT       all  --  any    eth0   !extip2  anywhere        =20=

    to:extip2
    17  1036 SNAT       all  --  any    ppp0   !extip1   anywhere       =20=

     to:extip1

=3D=3D=3D Table filter, Chain FORWARD (policy DROP 738 packets, 57598 =
bytes)
    12   648 LOG        tcp  --  any    any     anywhere            =20
anywhere            tcp spt:2201 LOG level warning prefix `SBOX___'
    24  1299 LOG        tcp  --  any    any     anywhere            =20
anywhere            tcp dpt:2201 LOG level warning prefix `BOX___'

=3D=3D=3D Chain INPUT (policy DROP 42252 packets, 4143K bytes)
     0     0 LOG        tcp  --  any    any     anywhere            =20
anywhere            tcp dpt:2201 LOG level warning prefix `WBOX__'
[more rules follow]


When I connect using extip1, I ahve the follwoing log entries:
Jul 29 19:48:51 lg2 kernel: BOX___IN=3Deth0 OUT=3Deth2 SRC=3D<testing =
host>=20
DST=3D<intdestip> LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D50 ID=3D43282 DF =
PROTO=3DTCP=20
SPT=3D26557 DPT=3D2201 WINDOW=3D65535 RES=3D0x00 SYN URGP=3D0
Jul 29 19:48:51 lg2 kernel: SBOX___IN=3Deth2 OUT=3Deth0 SRC=3D<intdestip>=20=

DST=3D<testing host> LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D2201 DPT=3D26557 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0

Connecting on extip2 does not result in any messages; I don't see any=20
packet when I tcpdump the DMZ interface then, either.

My routing looks as follows (there should be no marked packets as I=20
flushed the 'mangle' table before testing):
ofc:/home/bc# ip ru ls
0:      from all lookup local
32756:  from all fwmark 0x1 lookup IQ
32757:  from <extip1> lookup DSL
32758:  from all fwmark 0x2 lookup DSL
32759:  from <extip2> lookup IQ
32766:  from all lookup main
32767:  from all lookup default
ofc:/home/bc# ip ro ls
<pppremote> dev ppp0  proto kernel  scope link  src <extip1>
<extip2> dev eth0  scope link
192.168.0.0/24 dev eth3  proto kernel  scope link  src 192.168.0.253
172.27.2.0/24 dev dummy0  proto kernel  scope link  src 172.27.2.254
<DMZnet>/16 dev eth2  proto kernel  scope link  src <dmzlocalip>
default dev ppp0  scope link



Another question: is there some possibility to route local packets=20
depending on ports? As far as I've understood the only way is to mark=20
them using the mark target, however that only works after the routing=20
for local packets, doesn't it?

Thanx for your help, if I can provide any other useful information,=20
just let me know.

Baltasar

--

Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


