From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: DNAT with multiple external interfaces
Date: Sat, 5 Aug 2006 00:54:58 +0200
Message-ID: <3b7ac38aaf73c410d9bd30e56424aac2@former03.de>
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

sorry to bother you again - I've still got some problem with=20
iptables/iproute.
My machine has two 'external' interfaces that connect it to the=20
internet, one of them being a cheap and slow link, the other one fast=20
and not as cheap as the first ;-)

I've set up a routing which sends packets out on the interface=20
depending on the IP so that packets with a specific IP will (mostly)=20
leave on the corresponding interface.
root@ofc:~# ip ru sh
0:      from all lookup local
5001:   from <ext ipnet 1>/29 lookup IQ [meaning default route via a=20
router on eth0]
5002:   from <ext ip 2> lookup DSL [being default route using ppp0]
6001:   from all fwmark 0x1 lookup IQ
6002:   from all fwmark 0x2 lookup DSL
32765:  from all lookup main
32766:  from all lookup OVERRIDEdefault  [default route via ppp0]
32767:  from all lookup default

Now, I use the following DNAT rule, as I want clients to be able to=20
connect to a given port (boxbackup - 2201) on the interface without the=20=

default route.

root@ofc:~# iptables -t nat -L -v
Chain PREROUTING (policy ACCEPT 62005 packets, 5743K bytes)
  pkts bytes target     prot opt in     out     source              =20
destination
     5   300 DNAT       tcp  --  any    any     anywhere            =20
<DNS name for ext ip 1> tcp dpt:box to:172.30.1.10

root@ofc:~# tcpdump -i ppp0 | grep pcrw
tcpdump: verbose output suppressed, use -v or -vv for full protocol=20
decode
listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 96=20=

bytes
00:42:35.392905 IP <DNS name for ext ip 1>.box >=20
pcrw212.wiwi.uni-regensburg.de.1267: S 1741539364:1741539364(0) ack=20
827216391 win 5792 <mss 1402,sackOK,timestamp 19633833=20
1054925370,nop,wscale 4>

This shows that the packet which is - correctly - rewritten as having a=20=

source of ext ip 1, but goes out on interface 2 (thus follows the=20
default route via ppp0 instead of the route corresponding to the IP=20
address).

rp_filter is off.

Is there a good way to work around this problem?

Thanx,
Baltasar


Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


