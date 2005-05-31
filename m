From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: QoS and CLASSIFY
Date: Tue, 31 May 2005 08:39:28 -0300
Message-ID: <1117539568.17943.39.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-eG2Y2Z3TIld5+/nPqjwl"
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
To: netfilter@lists.netfilter.org


--=-eG2Y2Z3TIld5+/nPqjwl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Guys

After googling a little I couldn't find the correct answer..
(same message was insert at lartc.org)

When I use :
tc filter add dev eth0 parent 1:0 protocol ip prio 1 u32 match ip dst
192.168.0.11 flowid 1:30 , I can shape traffic to 1:30.( works like a
charm)

Now instead tc filter I would like to use CLASSIFY as below:

iptables -t mangle -A POSTROUTING -o eth0 -d 192.168.0.11 -j CLASSIFY
--set-class 1:30

but when I comment tc filter and include iptables -t mangle..CLASSIFY
nothing works.

Where am I wrong??


Scenario:

#!/bin/bash
#
#        128Kbps              192.168.0.1
#       <-----  eth1 firewall   eth0
# internet-adsl-----+squid---------------4 desktops
#       ----->      +QoS                   192.168.0.5
#       450Kbps                                     .11
#                                                   .12
#                                                   .20
#
modprobe sch_htb sch_prio sch_sfq cls_u32
tc qdisc del dev eth0 root
tc qdisc add dev eth0 root handle 1:0 htb

tc class add dev eth0 parent 1:0 classid 1:1 htb rate 450kbit ceil
450kbit

tc class add dev eth0 parent 1:1 classid 1:30 htb rate  80kbit ceil
400kbit
tc class add dev eth0 parent 1:1 classid 1:40 htb rate  80kbit ceil
400kbit
tc class add dev eth0 parent 1:1 classid 1:50 htb rate  80kbit ceil
400kbit
tc class add dev eth0 parent 1:1 classid 1:60 htb rate  80kbit ceil
400kbit

tc qdisc add dev eth0 parent 1:30 handle 30: sfq perturb 10
tc qdisc add dev eth0 parent 1:40 handle 40: sfq perturb 10
tc qdisc add dev eth0 parent 1:50 handle 50: sfq perturb 10
tc qdisc add dev eth0 parent 1:60 handle 60: sfq perturb 10


thanks in advanced

--=20
Paulo Ricardo Bruck - consultor


--=-eG2Y2Z3TIld5+/nPqjwl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta =?ISO-8859-1?Q?=E9?= uma parte de mensagem
	assinada digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCnEzw89ZqUGE0XNMRAgpuAJ9vkWlpcsSVZ7/X3GMfalv4crkbNACfT1vu
unPNP0F1YWGA9j3ATkSXuAU=
=vvAM
-----END PGP SIGNATURE-----

--=-eG2Y2Z3TIld5+/nPqjwl--


