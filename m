From: O-Zone <liste@zerozone.it>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Fri, 21 May 2004 11:30:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405211130.21108.liste@zerozone.it>
References: <200405201318.34706.liste@zerozone.it> <200405201834.23351.Antony@Soft-Solutions.co.uk> <200405201844.49709.Antony@Soft-Solutions.co.uk>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201844.49709.Antony@Soft-Solutions.co.uk>
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

On Thursday 20 May 2004 19:44, Antony Stone wrote:
> The same applies to your FORWARDing rules as well, by the way, so these
> will need changing before the packets can get through your firewall to
> their destination.

OK ! Thanks a lot...now all works perfeclty. But i still have a problem wit=
h=20
UDP. My DNS server inside DMZ, 192.168.0.2 ($DMZ_SIENA_IP), is mapped to tw=
o=20
public ip:

151.8.47.A ($SIENA_IP)
81.113.95.B ($SIENA2_IP)

and the rules to allow UDP to this server from those IP are:

$IPTABLES -A FORWARD -p TCP -o $DMZ_IFACE -d $DMZ_SIENA_IP -m multiport=20
=2D --dports 25,53,110 -j allowed
$IPTABLES -A FORWARD -p UDP -o $DMZ_IFACE -d $DMZ_SIENA_IP -m multiport=20
=2D --dports 53 -j ACCEPT

$IPTABLES -A FORWARD -p ICMP -o $DMZ_IFACE -d $DMZ_SIENA_IP -j icmp_packets

$IPTABLES -t nat -A PREROUTING -p TCP -d $SIENA_IP -m multiport --dports=20
25,53,80,110 -j DNAT --to-destination $DMZ_SIENA_IP
$IPTABLES -t nat -A PREROUTING -p UDP -d $SIENA_IP -m multiport --dports 53=
 -j=20
DNAT --to-destination $DMZ_SIENA_IP

$IPTABLES -t nat -A PREROUTING -p TCP -d $SIENA2_IP -m multiport --dports=20
25,53,80,110 -j DNAT --to-destination $DMZ_SIENA_$
$IPTABLES -t nat -A PREROUTING -p UDP -d $SIENA2_IP -m multiport --dports 5=
3=20
=2D -j DNAT --to-destination $DMZ_SIENA_IP

With the $SIENA_IP all work. With $SIENA2_IP not :-(. Is possible that the =
UDP=20
reply packet source is wrong because:

=2E..
$IPTABLES -t nat -A POSTROUTING -s $DMZ_SIENA_IP -o $INET_IFACE -j SNAT=20
=2D --to-source $SIENA_IP
=2E..

?=20

Oz


=2D --=20
What we wish, that we readily believe.
		-- Demosthenes
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArcwqYuBSFbgkEysRAmcOAJ9cZZgIyBMqGg9e2kFMzgVc2j1gtgCfZl8e
CwVcZex0I1X51bAUYx3FKJk=3D
=3DRgex
=2D----END PGP SIGNATURE-----


