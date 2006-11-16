From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: opening up an ipchain
Date: Thu, 16 Nov 2006 18:14:02 +0100
Message-ID: <455C9C5A.2090905@plouf.fr.eu.org>
References: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Alex Feldman a =E9crit :
>=20
> I know nothing about ipchains.

Fine, here we're talking about iptable, the successor of ipchains. :-)

> *****************************************************************
>=20
> iptables --policy INPUT   DROP
> iptables --policy OUTPUT  ACCEPT
> iptables --policy FORWARD DROP
>=20
> iptables -t nat --policy POSTROUTING ACCEPT
> iptables -t nat --policy PREROUTING ACCEPT

+ iptables -t nat --policy OUTPUT ACCEPT

>=20
> #---------------------------------------------------------------
> # The loopback interface should accept all traffic
> # Necessary for X-Windows and other socket based services
> #---------------------------------------------------------------
>=20
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>=20
> #---------------------------------------------------------------
>=20
> iptables -A INPUT -p tcp -i eth0 --dport 25 --sport 1024:65535 -m state=
=20
> --state NEW -j ACCEPT
>=20
> iptables -A INPUT -p udp -i eth0 --sport 53 --dport 1024:65535 -j ACCEP=
T
> iptables -A INPUT -p tcp -i eth0 --sport 53 --dport 1024:65535 -j ACCEP=
T

These two rules are possibly harmful : they allow any incoming packet to=20
a non privileged local port from any host using source port 53. Better=20
deal with DNS replies in the generic rule allowing established/related=20
connections.

> iptables -A INPUT -p tcp -i eth0 --dport 80 --sport 1024:65535 -m state=
=20
> --state NEW -j ACCEPT
>=20
> #---------------------------------------------------------------
> # Allow previously established connections
> #---------------------------------------------------------------
> iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED -i eth=
0=20
> -p tcp

Don't restrict this rule to TCP. It's also needed for other protocols :=20
DNS replies using UDP, ICMP ping and traceroute replies, ICMP signalling=20
messages...

> *********************************************************************
>=20
> Some of this I copied off the web, and I do not understand why I need
> all of it, e.g., all the 1024:65535 port identifiers.

"--sport 1024:65535" means that connections to your services should are=20
expected to come from unprivileged source ports, which is usually true.=20
However it's not really useful.

> However, I would like to open up the computer further, maybe not all th=
e
> way but for the moment that would be OK, to my own laptop via its mac
> address - I figure that would be pretty safe, but if not, I'd like to
> hear why not.

It is not safe because it is very easy to spoof a MAC address.

>  So I added the line:
>=20
> iptables -A INPUT -m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT
>=20
> and some variations on it, like with "-p all" in there, at various
> places in the file, but none of them worked (and they all had my real
> mac address in there, I just took it out before I displayed this to the
> world).

Be aware that this will work only when the client and the server are on=20
the same network (link layer). MAC addresses don't go through routers.

> Is the problem that I have it in the wrong place in the chain, or
> something else?  I really don't understand the difference between -A an=
d
> -I,

-A =3D append at the end of the chain
-I =3D insert at the beginning (or explicit location) of the chain

> especially since the basic file seems to work even though the first
> thing I do is drop all input, and then allow some back later.

No, you don't drop first then allow later, else nothing would work. The=20
first three commands (--policy or -P) just set the default policy of the=20
chains to DROP. The default policy tells what to do when the packet=20
doesn't match any rule with a "terminal" target and reaches the end of=20
the chain. So it's rules first then default policy, regardless of the=20
location of the --policy commands in the script.

