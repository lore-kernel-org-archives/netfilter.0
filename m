From: "Carlos Cruells" <carlos.cruells@betybyte.com>
Subject: Outgoing NAT problem.
Date: Tue, 5 Jul 2005 16:50:32 +0200
Message-ID: <19b901c58170$e51cd740$1e0c0a0a@betybyte.local>
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

Regards from Madrid, Spain.

I am configuring a Iptables firewall on the office, but i have problems =
with the navigation from LAN to Internet.
My configuration is the next:

    - eth0 --> LAN Interface=20
    - eth1 --> WAN Interface=20

I enter the next command:

iptables -t nat -A POSTROUTING -s 10.10.12.30 -o eth1 -j SNAT --to =
62.93.44.116

The configuration results:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
SNAT       all  --  10.10.12.30          anywhere            =
to:62.93.44.116=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20

Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
IP_forward --> 1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

All policies are in ACCEPT position, but it doesn't works.
/proc/sys/net/ipv4/ip_forward =3D 1

When i do a simple ping test from LAN --> Internet, it fails, but if i =
repeat the same test from firewall, it does ok.

IP_LAN -------(ping)--------> IP www.cisco.com =3D Not OK
Firewall -------(ping)--------> IP www.cisco.com =3D OK

Anybody can help me?

P.D: I know it. My english is not very good.  :D
