From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: Qos and CLASSIFY
Date: Mon, 30 May 2005 11:19:40 -0300
Message-ID: <1117462780.17943.15.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-mgZJ+iR8q8O6+8MqPds7"
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


--=-mgZJ+iR8q8O6+8MqPds7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Guys

After googling a little I couldn't find the correct answer..

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
echo -e "calling modules\n"
modprobe sch_htb sch_prio sch_sfq cls_u32

echo -e "limiting download\n"

echo -e "deleting qdisc \n"
tc qdisc del dev eth0 root

echo -e "adding HTB and SFP/PFIFO as leaves\n"
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


Using :

tc filter add dev eth0 parent 1:0 protocol ip prio 1 u32 match ip dst
192.168.0.1 flowid 1:20=20

I can shape traffic to 1:20. Now instead tc filter I would like to use
CLASSIFY as below:

iptables -t mangle -A POSTROUTING -o eth0 -d 192.168.0.5 -j CLASSIFY
--set-class 1:30

but when I comment tc filter add...u32 match ip dst 192.168.0.1... and
include iptables -t mangle..CLASSIFY nothing works.

Where Am I wrong??


thanks in advanced

-
--=20
Paulo Ricardo Bruck - consultor


--=-mgZJ+iR8q8O6+8MqPds7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta =?ISO-8859-1?Q?=E9?= uma parte de mensagem
	assinada digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCmyD889ZqUGE0XNMRAh10AKCwKSVNAlvobdQTGjLzXchM4cO3qACdG/X2
r8Fem5+raRMh3j9x/zXzRdk=
=2mdT
-----END PGP SIGNATURE-----

--=-mgZJ+iR8q8O6+8MqPds7--


