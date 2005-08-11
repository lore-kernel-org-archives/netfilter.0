From: Sp0oKeR <spooker@gmail.com>
Subject: Re: Secure Firewall
Date: Thu, 11 Aug 2005 10:29:44 -0300
Message-ID: <9255886c05081106294b57b9d2@mail.gmail.com>
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

I think you can complet with

Change this

$IPTABLES -t nat -A POSTROUTING -s 192.168.51.40 -p tcp -dport 80 -o
$EXT -j MASQUERADE
$IPTABLES -t nat -A POSTROUTING -s 192.168.51.80 -p tcp -dport 80 -o
$EXT -j MASQUERADE

Add this

$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -d
192.168.51.0/24 -j ACCEPT

$IPTABLES -A FORWARD -s 192.168.51.20 -j ACCEPT

$IPTABLES -A FORWARD -s 192.168.51.40 -p tcp --dport 80 -j ACCEPT

$IPTABLES -A FORWARD -s 192.168.51.80 -p tcp --dport 80 -j ACCEPT

Try this!

Att,

Sp0oKeR
On 8/9/05, Alexander Salmin <security.member@gmail.com> wrote:
> Hello friends,
>=20
> I'm trying to set up a secure NAT firewall in my home, for that I need
> help with some rules.
>=20
> I've got a total of four computers, including the server.
>=20
> These are the ones who should be NAT'ed:
>=20
> #1 --- 192.168.51.20 --- Should be able to access all internet.
> #2 --- 192.168.51.40 --- Should be able to access only websites (port 80,=
443).
> #3 --- 192.168.51.80 --- Should be able to access only websites (port 80,=
443).
>=20
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
>=20
> $IPTABLES -t nat -A POSTROUTING -s 192.168.51.20 -o $EXT -j MASQUERADE
> $IPTABLES -t nat -A POSTROUTING -s 192.168.51.40 -dport 80 -o $EXT -j MAS=
QUERADE
> $IPTABLES -t nat -A POSTROUTING -s 192.168.51.80 -dport 80 -o $EXT -j MAS=
QUERADE
>=20
> $IPTABLES -A INPUT -j DROP
> -------------------------------------------------------------------------=
------------
>=20
> Somehow, it doesn't work with -dport 80, and I believe that I have
> missed some allow-rules because the -j DROP denies the computer from
> 192.168.51.20 too.
>=20
> Any help would be appreciated!
>=20
>=20
> Thanks,
> --Alexander.
>=20
>

