From: Batstru <batstru@email.it>
Subject: again problem with alias / virtual interface
Date: Mon, 19 Jul 2004 20:55:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108>
Reply-To: Batstru <batstru@email.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: netfilter@lists.netfilter.org

Hi all!
I wrote days ago: I have a problem with virutal interface and iptables:
my pc has 2 network interface, one with a private network address and the
other one with=20
public network addresses:
eth0 --> 192.168.1.254 / 255.255.255.0
eth1 --> 82.186.92.90 / 255.255.255.248
eth1:1 --> 82.186.92.91 / 255.255.255.248
eth1:2 --> 82.186.92.92 / 255.255.255.248
eth1:3 --> 82.186.92.93 / 255.255.255.248
eth1:4 --> 82.186.92.93 / 255.255.255.248
I have configured network with ifconfig and route
iptables has this filter rules:
*filter
:FORWARD DROP [0:0]
:INPUT DROP [0:0]
:OUTPUT DROP [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -m state -i eth0 --state NEW -j ACCEPT
-A INPUT -s 192.168.1.0 -i eth0 -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 22 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 80 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 143 --sta=
te
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 10000
--state NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 25 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 --dport 110 --sta=
te
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 20 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 21 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 22 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport 25 --st=
ate
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 53 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 80 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 110 --sta=
te
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 143 --sta=
te
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 443 --sta=
te
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 20 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 21 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 22 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 25 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 80 --stat=
e
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 110 --sta=
te
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 143 --sta=
te
NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.93 --dport 8888 --st=
ate
NEW -j ACCEPT
as you can see I've tried changing configuration but anything changes: it=
 is
reported just a=20
warning but the rule is not applied.
-A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport 25 --st=
ate
NEW -j ACCEPT
My pc is running Fedora core 2 and the kernel is 2.6.6 and I've just
upgraded iptables to last=20
release.


The problem is that I can't access to services running at virtual
interfaces.=20
I tried to solve the problem as suggested me: I've seen that using alias =
is
deprecated so I=20
tried using iproute: I set up with=20
ip addr add 82.186.92.90/24 brd 82.186.92.95 dev eth1 label eth1:0
ip addr add 82.186.92.91/24 brd 82.186.92.95 dev eth1 label eth1:1
ip addr add 82.186.92.92/24 brd 82.186.92.95 dev eth1 label eth1:2
ip addr add 82.186.92.93/24 brd 82.186.92.95 dev eth1 label eth1:3
ip addr add 82.186.92.94/24 brd 82.186.92.95 dev eth1 label eth1:4
but after service iptables restart anything changes, alias's rules doesn'=
t
be applied and no=20
errors is reported.=20
I think I'm doing something wrong with iproute but I don't know what: sho=
ud
I give any command=20
to enable iproute?

My problem is quite strange, I've never seen such....


tnks=20
marco=20
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
=20
 Sponsor:
 Conto Arancio. Zero spese, stessa banca, pi=F9 interessi.
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D657&d=3D200407=
19



