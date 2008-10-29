From: Paul Evans <paul@mxtelecom.com>
Subject: Re: -j ROUTE and conntrack
Date: Wed, 29 Oct 2008 18:03:20 +0000
Message-ID: <20081029180320.16e92db5@nacelle.mxtelecom.com>
References: <20081029154650.004cc3b5@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w1NfNArJa.3y0U6fFXRgrq.";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081029154650.004cc3b5@nacelle.mxtelecom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/w1NfNArJa.3y0U6fFXRgrq.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Oct 2008 15:46:50 +0000
Paul Evans <paul@mxtelecom.com> wrote:

> I'm using the "-j ROUTE" target to force a routing decision for this,
> but it seems to have the side effect of breaking conntrack. Without -j
> ROUTE, the outbound connection appears in the conntrack table, so that
> when incoming replies arrive, they pass an ESTABLISHED test, and are
> let in. If it needs to -j ROUTE on the way out, then when the reply
> comes back, no conntrack entry means it fails ESTABLISHED and gets
> dropped. It seems that "-j ROUTE --continue" doesn't help either, it
> still goes missing.

Actually, this seems to be my mistake. There's an unfortunate
side-effect of giving ROUTE the --continue option when called from
PREROUTING. The packet exits the PREROUTING chain already with a
routing decision made in it before it hits the kernel's routing core
which seems to confuse it. It then drops the packet and the
conntrack information associated.

I've moved the ROUTE calls into POSTROUTING and now it seems to work
fine - it routes correctly, it remains in conntrack so the reply passes
the ESTABLISHED test.

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/w1NfNArJa.3y0U6fFXRgrq.
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkIpWgACgkQcGehlx3Gqx5nvwCggOOpX8oaXEyZL5yi1zWxq1XY
1bsAoJLB9l7nkCGTejuo6NDeAyvxGUnc
=mU4N
-----END PGP SIGNATURE-----

--Sig_/w1NfNArJa.3y0U6fFXRgrq.--
