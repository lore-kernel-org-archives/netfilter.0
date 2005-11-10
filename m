From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 10 Nov 2005 07:44:53 -0500
Message-ID: <437340C5.70400@rosi-kessel.org>
References: <4372A919.8020100@rosi-kessel.org>	
	<4372A989.5090606@rosi-kessel.org>	
	<20051110031834.GB9770@samad.com.au>	
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9C9167F29D6988D465061D19"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
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
--------------enig9C9167F29D6988D465061D19
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

George Alexandru Dragoi wrote:
> Better use mangle table, all packets traverse it. And doesn't require
> conntrack.

But I can't do DNAT in mangle, right?
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enig9C9167F29D6988D465061D19
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDc0DFdTf3ZklQ6qYRAvd2AKC+I62sA6Spi253JfseTMETss/AYACdH3zs
yvlo21yQ+vkb3utZ6YeRj1Q=
=50cd
-----END PGP SIGNATURE-----

--------------enig9C9167F29D6988D465061D19--

