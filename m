From: Eric Leblond <eric@regit.org>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 10:21:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078996881.13619.2.camel@tech004.alphalink.fr>
References: <001201c40744$1f34a190$2a245cc2@cea05>
	 <1078995674.15566.65.camel@raylinux.internal>
	 <200403110859.53154.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-O+WDkv4G6OXTY8evkchx"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403110859.53154.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-O+WDkv4G6OXTY8evkchx
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le jeu 11/03/2004 =E0 09:59, Antony Stone a =E9crit :
you forget :
iptables -F FORWARD
> > iptables -P FORWARD DROP

seriously, I've never test :
http://sourceforge.net/projects/iptables-p2p
but should be helpful

BR,
--=20
Eric Leblond
NuFW, Now User Filtering Works (http://www.nufw.org)

--=-O+WDkv4G6OXTY8evkchx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAUC+PnxA7CdMWjzIRAkcNAJ0SZ/n5dzwQNS593MJJ2nz1OMTiSACcCLSZ
xUk4a1RN/W8lee+7YqgfEOQ=
=XFJ5
-----END PGP SIGNATURE-----

--=-O+WDkv4G6OXTY8evkchx--


