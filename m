From: =?iso-8859-1?q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Mon, 09 May 2005 18:37:23 +0000
Message-ID: <1115663859l.3308l.0l@antares.localdomain>
References: <1115397393l.3864l.0l@antares.localdomain>
	<427C5C41.3010407@riverviewtech.net>
	<1115496014l.3549l.0l@antares.localdomain>
	<427EFB7D.8010503@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-pm9yBDKaziPoP2haqtcS"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427EFB7D.8010503@riverviewtech.net> (from
	gtaylor@riverviewtech.net on Mon May  9 07:56:13 2005)
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

--=-pm9yBDKaziPoP2haqtcS
Content-Type: text/plain; charset=ISO-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 09.05.05 07:56 schrieb(en) Taylor, Grant:
>> Hmmm, can you tell me how I actually check reverse path filtering and =20
>> turn  debugging on? Sorry, I'm neither a iptables nor a kernel guru :-/
>=20
> Take a look at /proc/sys/net/ipv4/conf/<device|all|default>/rp_filter to =
=20
> see if it is "1" or "0".  As I understand it reverse path filter(ing) is =
=20
> a kernel level filter feature that will only allow traffic with a =20
> specific source address to come in on the interface that it is connected =
=20
> to.  This would explain why you might be getting the reset packet if =20
> reverse path filtering is turned on on your eth0 device.

Set them all to either 0 or 1 - still the same picture, the reply from the =
=20
remote server results (in tcpdump) in the one with "win 0" being sent back =
=20
instead of passing it to eth0.

Any idea whom I could ask here for help? Maybe the Linux kernel mailing =20
list? Or is there a more specialised one for networking issues?

Cheers, Albrecht.

--=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Albrecht Dre=DF  -  Johanna-Kirchner-Stra=DFe 13  -  D-53123 Bonn (German=
y)
        Phone (+49) 228 6199571  -  mailto:albrecht.dress@arcor.de
    GnuPG public key:  http://home.arcor.de/dralbrecht.dress/pubkey.asc
_________________________________________________________________________

--=-pm9yBDKaziPoP2haqtcS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCf63zn/9unNAn/9ERApSHAKCXYFxo95hXhopc+qJXd8dLWSYqtwCdEWLu
2w3t6xq6YDZJt3klBGxqmWw=
=dbP7
-----END PGP SIGNATURE-----

--=-pm9yBDKaziPoP2haqtcS--


