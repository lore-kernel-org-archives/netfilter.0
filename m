From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Can't forward Win2k VPN through NAT
Date: Fri, 6 Sep 2002 14:42:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209061442.18983.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

hi all

I have this fw as sketched below. What I want, is to enable win2k VPN=20
connection NATed into 192.168.144.24.

Can someone help me here? It just doesn't work ...

roy

        +------+
   eth2 |      | eth1
SHDSL --+  fw  +----------- LAN
        |      |
        +---+--+
       eth0 |
            |

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       udp  --  62.70.77.66          213.187.163.162    udp dpt:1723 =
\=20
to:192.168.144.24
DNAT       tcp  --  62.70.77.66          213.187.163.162    tcp dpt:3389 =
\=20
to:192.168.144.24:3389
DNAT       tcp  --  62.70.77.66          213.187.163.162    tcp dpt:1723 =
\=20
to:192.168.144.24:1723
DNAT       gre   --  62.70.77.66          213.187.163.162    to:192.168.1=
44.24

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       47   --  192.168.144.24       0.0.0.0/0          to:213.187.16=
3.162
MASQUERADE  all  --  192.168.0.0/16      !192.168.0.0/16


--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


