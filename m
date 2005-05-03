From: fabricio bianco abreu <fabricio@tc.df.gov.br>
Subject: Bind and other services on a DMZ
Date: Tue,  3 May 2005 14:48:48 -0300
Message-ID: <20050503174537.09D1C1CE0A@juno.tc.df.gov.br>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, folks

I am trying to install a iptables based firewall to protect my servers pr=
oviding
information to the Internet in a DMZ fashioned mode.

I need some help to debug the rules I have set up.=20

I will provide some background information:

1. The firewall is a box with two ethernet adapters. The external adapter=
 piles
two valid adresses (200.x.y.z) and the internel adapter has one invalid a=
ddress
(172.16.a.b)

2. One DMZ machine (ip 172.16.0.5) is used to serve smtp, http, https, ft=
p.

3. Another DMZ machine (ip 172.16.0.2) is a bastion host, serving dns (bi=
nd) and
mascarading traffic from my internal network.

As for the firewall (packet filtering) configuration I have set up a bunc=
h of
rules. Here are the outputs to the commands "iptables -nL" and "iptables =
-nL -t
nat"=20

------------------------------------------------------- begin
Chain INPUT (policy DROP)
target     prot opt source               destination        =20
bad_tcp_packets  tcp  --  0.0.0.0/0            0.0.0.0/0          =20
icmp_packets  icmp --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            172.16.0.1         =20
ACCEPT     all  --  127.0.0.1            0.0.0.0/0          =20
ACCEPT     all  --  200.x.y.2        0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            200.x.y.2       state RELATED,ES=
TABLISHED=20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 3=
/min
burst 3 LOG flags 0 level 7 prefix `IPT INPUT packet died: '=20

Chain FORWARD (policy DROP)
target     prot opt source               destination        =20
bad_tcp_packets  tcp  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED=20
allowed    tcp  --  0.0.0.0/0            172.16.0.5          multiport dp=
orts
20,21,25,80,443=20
icmp_packets  icmp --  0.0.0.0/0            172.16.0.5         =20
allowed    tcp  --  0.0.0.0/0            172.16.0.2          tcp dpt:53=20
ACCEPT     udp  --  0.0.0.0/0            172.16.0.2          udp dpt:53=20
icmp_packets  icmp --  0.0.0.0/0            172.16.0.2         =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 3=
/min
burst 3 LOG flags 0 level 7 prefix `IPT FORWARD packet died: '=20

Chain OUTPUT (policy DROP)
target     prot opt source               destination        =20
bad_tcp_packets  tcp  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  127.0.0.1            0.0.0.0/0          =20
ACCEPT     all  --  172.16.0.1           0.0.0.0/0          =20
ACCEPT     all  --  200.x.y.2        0.0.0.0/0          =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 3=
/min
burst 3 LOG flags 0 level 7 prefix `IPT OUTPUT packet died: '=20

Chain allowed (2 references)
target     prot opt source               destination        =20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp flags:0x=
16/0x02=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED=20
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0          =20

Chain bad_tcp_packets (3 references)
target     prot opt source               destination        =20
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:!0x16/0x02 state NEW LOG flags 0 level 4 prefix `New not syn:'=20
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:!0x16/0x02 state NEW=20
DROP       all  --  192.168.0.0/16       0.0.0.0/0          =20
DROP       all  --  10.0.0.0/8           0.0.0.0/0          =20
DROP       all  --  172.16.0.0/12        0.0.0.0/0          =20

Chain icmp_packets (3 references)
target     prot opt source               destination        =20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8=20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 11=
=20

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
DNAT       tcp  --  0.0.0.0/0            200.x.y.5       multiport dports
20,21,25,80,443 to:172.16.0.5=20
DNAT       tcp  --  0.0.0.0/0            200.x.y.2       tcp dpt:53 to:17=
2.16.0.2=20
DNAT       udp  --  0.0.0.0/0            200.x.y.2       udp dpt:53 to:17=
2.16.0.2=20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
SNAT       all  --  172.16.0.5           0.0.0.0/0           to:200.x.y.5=
=20
SNAT       all  --  0.0.0.0/0            0.0.0.0/0           to:200.x.y.2=
=20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination=20
------------------------------------------------------ end

Are these setting correct?=20
Is there a reason why a secondary DNS server, outside my DMZ, would not b=
e able
to syncronize (initiate a zone transfer) to my firewalled Bind server?

Any comments are welcome.

Thx.
________________________________________________________________

                     Fabricio=20
________________________________________________________________







________ Information from NOD32 ________
This message was checked by NOD32 Antivirus System for Linux Mail Server.
http://www.nod32.com

