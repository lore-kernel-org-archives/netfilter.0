From: O-Zone <liste@zerozone.it>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 18:32:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201832.26844.liste@zerozone.it>
References: <200405201318.34706.liste@zerozone.it> <200405201753.40647.liste@zerozone.it> <200405201707.30559.Antony@Soft-Solutions.co.uk>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201707.30559.Antony@Soft-Solutions.co.uk>
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

On Thursday 20 May 2004 18:07, Antony Stone wrote:
> What about the rest of rc.firewall?   You have posted your POSTROUTING SN=
AT
> rules - do you have any PREROUTING DNAT rules to convert 151.8.47.B into
> 192.168.0.3?

Yes ! Here is (for SIENA only):

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP -=
m=20
multiport --dports 25,53,110 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP -=
m=20
multiport --dports 53 -j allowed

$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP =
=2Dj=20
icmp_packets

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SIENA_IP -m multip=
ort=20
=2D --dports 25,53,80,110 -j DNAT --to-destinati$
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SIENA_IP -m multip=
ort=20
=2D --dports 53 -j DNAT --to-destination $DMZ_SI$


> If you do not have any PREROUTING rules, I remain confused about how this
> was already working from the Internet as you said previously, but try:
>
> iptables -A PREROUTING -t nat -p tcp --dport 110 -d 151.8.47.B -j DNAT --=
to
> 192.168.0.3

Don't work :-(

=2D --=20
"If a camel flies, no one laughs if it doesn't get very far."
		-- Paul White
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArN2YYuBSFbgkEysRAmcFAKCW2V0kRalMNbuwZmq42Gy+u7p08gCffD7w
KAM4uDcf9QHjbXn5U/QRQN4=3D
=3DexTi
=2D----END PGP SIGNATURE-----


