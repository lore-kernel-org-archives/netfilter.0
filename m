From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: About routing, nat, the FORWARD chain, and a bit of Julian's patches
Date: Wed, 6 Jul 2005 10:57:40 +0200
Message-ID: <45219fb005070601577205f256@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

Hi!

I'm still trying to solve the problem, about which I already posted in
these lists... I've been trying to understand where packet routing and
NAT is being done. The schemes are quite clear, when it's about the
_first_ packet of a NAT connection (when it enters the NAT table). But
it isn't that clear about the packets NAT'ed by the connection
tracker.

Concretely about tcp connections, I've noticed that:

1. _no_ packet matches any chain of the 'nat' table, unless it's a SYN
tcp packet (start of connection). For the rest of the packets, they
don't match any chain of the 'nat' table.

2. The routing is done _before_ applying the rules of the FORWARD
chain. So, logging NAT connections (already made), shows that the
packets already have an output device. Example: "iptables -A FORWARD
-j LOG -o eth2", with example result:
Jul  6 10:18:29 thecrow IN=3Deth0 OUT=3Deth2 SRC=3D192.168.4.20
DST=3D62.57.136.215 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D46487 DF
PROTO=3DTCP SPT=3D33967 DPT=3D80 WINDOW=3D63712 RES=3D0x00 ACK URGP=3D0

3. The NAT applied by the connection tracker (not by 'nat' table) is
done _after_ the FORWARD chain of the filter table. I SNAT all
starting connections packets (table nat, chain POSTROUTING) to
192.168.16.1/24 or 192.168.17.1/24, and you may see in the last
example that the source address still is that of the LAN
(192.168.4.4/20).

4. I can say the same as in the third point about the chain FORWARD of
the 'mangle' table.

So.... I don't know how people do "multihop routing + NAT" without
Julian's patches. It's obvious that:
1. The connection tracker doesn't keep information about the devices
involved in the connection.
2. The routing policy database is asked BEFORE the FORWARD or
POSTROUTING chains. In fact, that's why the 'nat'/POSTROUTING chains
know to which IP change the source address (that is, according to the
selected output device by, for instance, the 'equalize' of a multihop
route).

May someone clarify, how people do that kind of multihop routing + NAT
without any patch? I've read that some people does that. IMO, those
configurations don't work fine.  Can someone suggest any patch, in
order to get routing _after_ the connection tracking NAT is made?

Am I wrong in something?

Thanks in advance!

