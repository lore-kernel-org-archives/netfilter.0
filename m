From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: ipset macipmap troubles
Date: Thu, 07 Apr 2011 16:54:53 +0200
Message-ID: <4D9DD03D.2070801@univ-nantes.fr>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

i'am in trouble with ipset (6.2) on a 2.6.38.2 kernel.
I try to add the macipmap set on prerouting mangle chain, and i can't=20
understand what i'm doing wrong.
Basiclly, i'm doing the following:

$IPTABLES -t mangle -N test_pre
$IPTABLES -t mangle -A PREROUTING -j test_pre
$IPSET -N test macipmap --network 192.168.100.0/24
$IPSET ipset -A test 192.168.100.2,00:24:e8:bb:04:68
$IPTABLES -t mangle -A test_pre -m set --match-set test src -j MARK=20
--set-mark 10
$IPTABLES -t mangle -A test_pre -m set --match-set test src -j ACCEPT
$IPTABLES -t mangle -A test_pre -m set --match-set test dst -j MARK=20
--set-mark 10
$IPTABLES -t mangle -A test_pre -m set --match-set test dst -j ACCEPT
$IPTABLES -t mangle -A test_pre -m set --match-set test src,dst -j MARK=
=20
--set-mark 10
$IPTABLES -t mangle -A test_pre -m set --match-set test src,dst -j ACCE=
PT
$IPTABLES -t mangle -I test_pre -s 192.168.100.2 -m mac --mac-source=20
00:24:E8:BB:04:68 -j LOG --log-prefix "TEST "

an ipset -L :

root@test-jp-2:~# ipset -L
Name: test
Type: bitmap:ip,mac
Header: range 192.168.100.0-192.168.100.255
Size in memory: 4208
References: 6
Members:
192.168.100.2,00:24:E8:BB:04:68

root@test-jp-2:~# iptables -t mangle -nvL test_pre
Chain test_pre (1 references)
  pkts bytes target     prot opt in     out     source              =20
destination
     0     0 LOG        all  --  *      *       192.168.100.2       =20
0.0.0.0/0            MAC 00:24:E8:BB:04:68 LOG flags 0 level 4 prefix=20
"TEST "
     0     0 MARK       all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src MARK set 0xa
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src
     0     0 MARK       all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test dst MARK set 0xa
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test dst
     0     0 MARK       all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src,dst MARK set 0xa
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src,dst

Next the client do a request (http):

root@test-jp-2:~# iptables -t mangle -nvL test_pre
Chain test_pre (1 references)
  pkts bytes target     prot opt in     out     source              =20
destination
   134 71143 LOG        all  --  *      *       192.168.100.2       =20
0.0.0.0/0            MAC 00:24:E8:BB:04:68 LOG flags 0 level 4 prefix=20
"TEST "
     0     0 MARK       all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src MARK set 0xa
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src
     0     0 MARK       all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test dst MARK set 0xa
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test dst
   134 71143 MARK       all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src,dst MARK set 0xa
   134 71143 ACCEPT     all  --  *      *       0.0.0.0/0           =20
0.0.0.0/0            match-set test src,dst

I expected that only the "-m set --match-set test src" rule will match,=
=20
but obviously, only the rule src,dst match.

I'm a bit disapointed, as Jozset pointed me in the man-pages, the=20
bitmap:ip,mac (macipmap) type can check the *source*
MAC address only.

Am i missing something?

Regards

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

