From: O-Zone <liste@zerozone.it>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 17:53:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201753.40647.liste@zerozone.it>
References: <200405201318.34706.liste@zerozone.it> <200405201658.59945.liste@zerozone.it> <200405201607.10019.Antony@Soft-Solutions.co.uk>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201607.10019.Antony@Soft-Solutions.co.uk>
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

On Thursday 20 May 2004 17:07, Antony Stone wrote:
> If you do not in fact already have the PREROUTING DNAT rules, then what do
> you mean by "Each DMZ server is mapped to its PUBLIC IP"?   Maybe I
> misunderstood what you have already done, and already have working, and
> what problem is still left to solve?

Here's the problem (TCPDUMP on 192.168.0.1):
root@bastion:/etc/rc.d# tcpdump -i eth2 dst 151.8.47.B
17:45:52.507152 IP 192.168.0.2.45621 > 151.8.47.B.pop3: S=20
1931786477:1931786477(0) win 5840 <mss 1460,sackOK,timestamp 107802174[|tcp=
]>
17:45:55.506855 IP 192.168.0.2.45621 > 151.8.47.B.pop3: S=20
1931786477:1931786477(0) win 5840 <mss 1460,sackOK,timestamp 107805174[|tcp=
]>
17:46:01.506454 IP 192.168.0.2.45621 > 151.8.47.B.pop3: S=20
1931786477:1931786477(0) win 5840 <mss 1460,sackOK,timestamp 107811174[|tcp=
]>

but on 151.8.47.B (192.168.0.3) no any packet arrive. This is a piece of=20
rc.firewall:

#
# 4.3.8 POSTROUTING chain
#

$IPTABLES -t nat -A POSTROUTING -s 10.0.0.0/24 -j MASQUERADE
$IPTABLES -t nat -A POSTROUTING -s 172.16.0.0/24 -j MASQUERADE

$IPTABLES -t nat -A POSTROUTING -s 192.168.0.0/24 -d 192.168.0.0/24 -p tcp =
=2Dj=20
SNAT --to 192.168.0.1

$IPTABLES -t nat -A POSTROUTING -s $DMZ_SIENA_IP -o $INET_IFACE -j SNAT=20
=2D --to-source $SIENA_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_DOMINI_IP -o $INET_IFACE -j SNAT=20
=2D --to-source $DOMINI_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_EXCHANGE_IP -o $INET_IFACE -j SNAT=
=20
=2D --to-source $EXCHANGE_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_ELEKTRA_IP -o $INET_IFACE -j SNAT=20
=2D --to-source $ELEKTRA_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_LEONARDO_IP -o $INET_IFACE -j SNAT=
=20
=2D --to-source $LEONARDO_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_PROXYSAT_IP -o $INET_IFACE -j SNAT=
=20
=2D --to-source $PROXYSAT_IP

The problem is still here :-(

=2D --=20
What is algebra, exactly?  Is it one of those three-cornered things?
		-- J.M. Barrie
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArNSCYuBSFbgkEysRApQsAKCACoGu7IIxbBGI8r5BOOPwQAUzMgCeI/g0
ODxv+ha7hSWSLOr1RdU2g7o=3D
=3DkqyU
=2D----END PGP SIGNATURE-----


