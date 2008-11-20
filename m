From: Paul Evans <paul@mxtelecom.com>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 18:29:28 +0000
Message-ID: <20081120182928.61c9d749@nacelle.mxtelecom.com>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
	<20081120122753.606233a2@nacelle.mxtelecom.com>
	<d006ee070811201000k7684ffaah4851e687dc3942d4@mail.gmail.com>
	<20081120180728.23e681bf@nacelle.mxtelecom.com>
	<d006ee070811201024x23f6fa88l20edfab22ef20e2f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ii5_7LAkQmlclFaNVAslsK1";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d006ee070811201024x23f6fa88l20edfab22ef20e2f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mike <mikef1007@gmail.com>
Cc: netfilter@vger.kernel.org

--Sig_/ii5_7LAkQmlclFaNVAslsK1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Nov 2008 10:24:55 -0800
Mike <mikef1007@gmail.com> wrote:

> Thats good and all,  but when I iptables -F , shouldn't I stop seeing
> traffic on my redirect port?  Am I missing something else?

Not necessarily.

The "nat" table only applies to packets that conntrack believes are
NEW. I.e. TCP SYN packets, or UDP/ICMP for which it doesn't yet have an
entry. As soon as the TCP session is established, nat isn't used any
more and conntrack takes over.

If you keep one existing TCP connection open, that will continue to
have the nat rules applied that were in place when it was established,
regardless of the current ruleset in iptables.

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/ii5_7LAkQmlclFaNVAslsK1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkklrIgACgkQcGehlx3Gqx5/iwCffhpcJwNSi0j/dMz6HQhNFXKP
mXUAn00okcRZuBMbg642b3WkEqr7tXWJ
=brkp
-----END PGP SIGNATURE-----

--Sig_/ii5_7LAkQmlclFaNVAslsK1--
