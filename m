From: Arkadiusz Miskiewicz <misiek@pld.org.pl>
Subject: ip rule and DNAT
Date: Sat, 21 Jun 2003 00:14:07 +0200
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <20030620221407.GB21462@arm.t19.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <lartc-admin@mailman.ds9a.nl>
Content-Disposition: inline
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="iso-8859-1"
To: lartc@mailman.ds9a.nl
Cc: netfilter@lists.netfilter.org

My setup looks like this

1inet---(yy.yy.186.12)router---network 172.16.0.0/16
                  (xx.xx.251.73)
                        |
                        |
                      2inet


Router is doing masquerade. There was one link to internet. I need
to connect to some host in 172.16.0.0 network so I'm doing DNAT.
That was working quite well until second link to internet was added.

After adding ip rule to allow using both internet connections
from outside DNAT stopped working.

[root@osrodek root]# ip rule
0:      from all lookup local
32764:  from yy.yy.186.12 lookup 10
32765:  from all lookup main
32766:  from all lookup main
32767:  from all lookup default
[root@osrodek root]# ip route show table main
[...]
172.16.100.2 dev eth1  proto kernel  scope link  src 172.16.100.1
172.16.0.0/12 via 172.16.100.2 dev eth1
default via xx.xx.251.73 dev eth0 onlink
[root@osrodek root]# ip route show table 10
default via yy.yy.186.254 dev eth0

table main is used for routing through 2inet connection while
table 10 is used for routing through 1inet connection.

DNAT rules:
[root@osrodek root]# iptables -L -n -t nat | grep ":22"
DNAT       tcp  ---  0.0.0.0/0            xx.xx.251.74       tcp dpt:11022 =
to:172.16.100.4:22
DNAT       tcp  ---  0.0.0.0/0            xx.xx.251.74       tcp dpt:12022 =
to:172.16.100.2:22
DNAT       tcp  ---  0.0.0.0/0            xx.xx.251.74       tcp dpt:10022 =
to:172.16.2.254:22
DNAT       tcp  ---  0.0.0.0/0            yy.yy.186.12      tcp dpt:11022 t=
o:172.16.100.4:22
DNAT       tcp  ---  0.0.0.0/0            yy.yy.186.12      tcp dpt:12022 t=
o:172.16.100.2:22
DNAT       tcp  ---  0.0.0.0/0            yy.yy.186.12      tcp dpt:10022 t=
o:172.16.2.254:22

When I connect to ie. xx.xx.251.74:11022 or yy.yy.186.12:11022 then
I just get timeout. Packets seems not comming back :/ Without ip rules
everything works fine (but I can use only one inet connection then)

Any ideas?

--=20
Arkadiusz Mi=B6kiewicz     CS at FoE, Wroclaw University of Technology
arekmatssedotpl AM2-6BONE, 1024/3DB19BBD, arekm(at)ircnet, PLD/Linux
_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
