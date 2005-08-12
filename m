From: "curby ." <curby.public@gmail.com>
Subject: Re: Secure Firewall
Date: Fri, 12 Aug 2005 13:09:53 -0600
Message-ID: <5d2f3791050812120926dc18a9@mail.gmail.com>
References: <393114f90508090624278c8414@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <393114f90508090624278c8414@mail.gmail.com>
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
To: Alexander Salmin <security.member@gmail.com>
Cc: netfilter@lists.netfilter.org

On 8/9/05, Alexander Salmin <security.member@gmail.com> wrote:
> #1 --- 192.168.51.20 --- Should be able to access all internet.
> #2 --- 192.168.51.40 --- Should be able to access only websites (port 80,=
443).
> #3 --- 192.168.51.80 --- Should be able to access only websites (port 80,=
443).

Consider your reasons for restricting #2 and #3.  It is trivially easy
to get around port restrictions only (just run a ssh server on port 80
for example).

> This is how my non-working iptables-script looks like right now:
> -------------------------------------------------------------------------=
------------
> INT=3D"eth0"
> EXT=3D"eth1"
> IPTABLES=3D/sbin/iptables
>=20
> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD
> $IPTABLES -F -t nat
>=20
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
>=20
> $IPTABLES -A INPUT -i $INT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A INPUT -i eth0 -p icmp -j ACCEPT
> $IPTABLES -A INPUT -p UDP --dport bootps -i $INT -j ACCEPT
> $IPTABLES -A INPUT -p UDP --dport domain -i $INT -j ACCEPT

Since you have no OUTPUT rules and OUTPUT drops by default, these
INPUT rules don't do anything useful.  You probably want to allow
ESTABLISHED,RELATED traffic in OUTPUT as well, for example.

> $IPTABLES -t nat -A POSTROUTING -s 192.168.51.20 -o $EXT -j MASQUERADE
> $IPTABLES -t nat -A POSTROUTING -s 192.168.51.40 -dport 80 -o $EXT -j MAS=
QUERADE
> $IPTABLES -t nat -A POSTROUTING -s 192.168.51.80 -dport 80 -o $EXT -j MAS=
QUERADE
>=20
> $IPTABLES -A INPUT -j DROP
> -------------------------------------------------------------------------=
------------
=20
Definitely add the FORWARD rules spooker talked about.  And consider
some more intelligent/"deep" traffic inspection if you want to
restrict some of your hosts.

