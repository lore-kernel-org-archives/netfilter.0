From: Lopsch <lopsch@lopsch.com>
Subject: Re: iptables with irc and auth
Date: Mon, 10 Jan 2005 12:42:21 +0100
Message-ID: <41E26A1D.1000807@lopsch.com>
References: <33413.212.100.225.41.1105354789.squirrel@webmail.*>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig765BCC0BC3AE66C25320EBE9"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <33413.212.100.225.41.1105354789.squirrel@webmail.*>
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig765BCC0BC3AE66C25320EBE9
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

squid@oranged.to schrieb:
> Hello,
>
> I am trying to configure iptables so that when I connect to IRC on port
> 6667 it will allow the auth connection back on 113 from that IP address.
>
> I have both inbound and outbound rules on the system. When I try any of
> the state information it wont work. Im guessing thats because the iptables
> config cant see that its a related connection. Is there any way that I can
> setup iptables so that it will allow AUTH only if im connected on port
> 6667 to that same IP?
>
> thanks
>
> Jimmy.
>

Perhaps the conntrack and helper module for IRC will help you,
ip_conntrack_irc and ip_nat_irc.


--

PGP-ID 0xF8EAF138

--------------enig765BCC0BC3AE66C25320EBE9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1-nr1 (Windows XP)

iQIVAwUBQeJqISXe0Lt4Z4FpAQL8PQ//fZAv2T9AfkG1wsMlWejACZLrU1GN7oao
TaRe5WoI1f74OGsnwj5VnBKtKTsZstGppX8P283CZJZk29vT4eh6SL4zioUdeamm
rvFarRvk/1emV5FNJC/d3MhXRccZXXABRrIzGcOFEPKdq2qgKnzQhva8STK0YY51
r/ZpOjP9Kxt/maw5kMP9EYeJ/xWdQUoWxnOa03mR8RPg8rt0j9ctnsBnUgIUH1f5
7m+ufcKeitvFzfuTtB5JMmU41A+Uzjeq/nArun71Tj2T4tet29ZBL8vh7WDuZoQc
BInr0Lt2Tud798tvQqc4oo9UAdjANznXf/9bnW9tTNq2S8HfC06HlTqjefWwpSFN
BbCRK2NAFC2hP4S9z3g2oz03nzbL2EqI8jgVoA6oLA/Ir6fYw/P2jZedniRRKCOa
vVXpQj70iAbDHJqHOsseT3vFyY2CpvXI49FTbhZyyVIQZbtG8shh/m8z0vI3LL9x
qu6ieSVmCuFcx0nseX4ArQ5L+n1LXwcXhXK1QaOoz0SMC2bDb+nYwWz61zFpR1S7
LeAQw/5WMjCV3PWHvWxEigB/exFBNCjBrtFvCAJGR54hQTIhtObMS7axI13dGd5R
L6+iUjtH4EEUvLJuESh7y7VNL4gJ7/NfvL+hZ0AYiDJmx0QJMUk4CwO353FCBhHJ
rc2EFPgpntA=
=8mlK
-----END PGP SIGNATURE-----

--------------enig765BCC0BC3AE66C25320EBE9--

