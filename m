From: O-Zone <liste@zerozone.it>
Subject: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 13:18:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201318.34706.liste@zerozone.it>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,
i've a big problem. Here's a little diagram:

[INTRANET 10.0.0.0/24]-------------+
                                                      +--[ROUTER]--(NET)
[DMZ SERVER A - 192.168.0.2]----+
[DMZ SERVER B - 192.168.0.3]----+

Each DMZ server is mapped to it's PUBLIC IP. For example:

151.8.47.A ----> 192.168.0.2
151.8.47.B ----> 192.168.0.3

and all work perfectly !!!

The problem is when, from 192.168.0.2, i try to connect to 151.08.47.B (tra=
t's=20
mapped to 192.168.0.3): packets die on ROUTER.

Here's my IPTABLES configuration:

[.....]
#
# 3.1 Required proc configuration
#

echo "1" > /proc/sys/net/ipv4/ip_forward

#
# 3.2 Non-Required proc configuration
#

echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr
echo "1" > /proc/sys/net/ipv4/conf/all/accept_source_route

[....]
#
# 4.3.8 POSTROUTING chain
#

$IPTABLES -t nat -A POSTROUTING -s 10.0.0.0/24 -j MASQUERADE

# This is my TRY :-( but don't work...
$IPTABLES -t nat -A POSTROUTING -o $DMZ_IFACE -s 192.168.0.0/24 -d 151.8.47=
=2EA=20
=2D -j MASQUERADE
$IPTABLES -t nat -A POSTROUTING -o $DMZ_IFACE -s 192.168.0.0/24 -d 151.8.47=
=2EB=20
=2D -j MASQUERADE

# Perhaps the same as the first
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

Someone can help me ?

Please ! Oz


=2D --=20
Legge di Eagleson:
	Qualsiasi tuo personale codice sorgente che non e' piu' stato
	guardato da sei o piu' mesi potrebbe benissimo essere stato
	scritto da qualcun altro.  (Eagleson e' un ottimista; il numero
	reale e' piu' vicino alle tre settimane.)
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArJQHYuBSFbgkEysRAsMqAKDYL9wufFI1uEVNubiBhsdlLVHs+gCgjwq3
JASN8hPUrFKObgR4MzAPZ0k=3D
=3DhVW2
=2D----END PGP SIGNATURE-----


