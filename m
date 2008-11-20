From: Paul Evans <paul@mxtelecom.com>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 12:27:53 +0000
Message-ID: <20081120122753.606233a2@nacelle.mxtelecom.com>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uItVAGo.lxkWb=h6+VUYBFs";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mike <mikef1007@gmail.com>
Cc: netfilter@vger.kernel.org

--Sig_/uItVAGo.lxkWb=h6+VUYBFs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Nov 2008 23:34:20 -0800
Mike <mikef1007@gmail.com> wrote:

> iptables -t nat -A PREROUTING -p tcp --dport portX -j DNAT --to :portY

You want -j REDIRECT rather than DNAT

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/uItVAGo.lxkWb=h6+VUYBFs
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkklV8kACgkQcGehlx3Gqx6QiwCfQvp+cHNclMsf4UbSaEJ2FMH2
y/8An1GBs7itEl2ZLLBmKxpp/OaYAGa5
=2YNZ
-----END PGP SIGNATURE-----

--Sig_/uItVAGo.lxkWb=h6+VUYBFs--
