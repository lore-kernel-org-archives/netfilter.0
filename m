From: Aaron Fischer <mail@aaron-fischer.net>
Subject: Re: nftables: origin sport after dstnat
Date: Thu, 8 Dec 2022 00:31:59 +0100
Message-ID: <20221208003159.3bc95cfc@deskFu>
References: <20221206230347.205a59c1@deskFu>
        <20221207112900.GA28507@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/19s=sqi43e0HVEKmIf/PXDM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20221207112900.GA28507@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/19s=sqi43e0HVEKmIf/PXDM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Dec 2022 12:29:00 +0100 Florian Westphal <fw@strlen.de> wrote:
> Aaron Fischer <mail@aaron-fischer.net> wrote:
> > Is there a way to somehow access the origin sport (8448 in my
> > case), so I can filter for it in the FORWARD chain? =20
>=20
> Yes, the original addresses are stored in conntrack: 'ct original
> proto-src 8448'

Thank you for this valuable hint! I've tested it with this bare minimum
config:

alpine-test:/etc# cat nft-ct.nft=20
#!/usr/sbin/nft -f

flush ruleset

table ip filter {
    chain INPUT {
        type filter hook input priority filter
        policy accept
    }

    chain FORWARD {
        type filter hook forward priority filter
        policy drop
        ct original proto-src 8448 accept
    }
}

But the config seems invalid:

alpine-test:/etc# nft -c -f /etc/nft-ct.nft=20
/etc/nft-ct.nft:14:31-34: Error: Can't parse symbolic invalid
expressions ct original proto-src 8448 accept
                                  ^^^^

Not sure why. Various examples and the man page also show it that way
you mentioned. The sourcecode gives me not much more insight how the
syntax should be. Why is 8448 an "invalid" type?

I use the latest version of the nft tool (v1.0.5).

Aaron

--Sig_/19s=sqi43e0HVEKmIf/PXDM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEpHbGLcTIsnv4V2LpkeCyCzhT8bkFAmORIm8ACgkQkeCyCzhT
8bm8Ww/+IEykd4+9KgxOu4eqi2wgHR21GwADfSI38QvIXg3oiesy0CgjuHui9OpP
NFReGZUtgou45o3O00etDWcXv7RQv0KlYnEhcfxroprJBuwx9zNRiEtok/2d49M0
N8wFEz3YZ6zbnPc7f+Qi7qKS/ob3UlK6ZPF2qKVuRNSgNMzypVghjlEgPOEYVfhU
a0CMky6pQsUa9DQpI3no5GFbqNRuoPQDqqh/0/mixjW+qPrkRQEtKvTMjwC4TVhR
2TYRfrAwXXAGucM5h0yfd0N5R1S/W2Dv3FNOh6kBMK31iEGwG5gSYF3+6MfZB/VJ
qM/b+qO/o8WZvFHxEStUHHQylOQ0c7HzCcrSMHSKs67zTu27An1D3dIz65BXvdx+
lXSO5Dde9+DDDmYMGB5aWOlH1novVpWBaCm1/gCQrS+uzcupl63bbOt7WeY5+l73
rit+dO7G47knYG2BnfaZ31ndpzCI3ZJePfGipqy4PwjiIzWsOxQF6yOKsyx2W8p6
hZPQWhVjv3kNbZor3k+7plX0nIaKIUtRsw1T6QHmGFM2NqxJmoKS6RrNZ4kOHXg4
AGlauS0Bg2B0QsoMRDhz8yoqGwFVHEeLexcUE05J/8mh45Gamew4uPqdN6gvlhl8
HUbe112z1R6OB8Mv+AjzN3rhM8evq33Rh+dA0g2eqAs5l16Xc/c=
=2tRd
-----END PGP SIGNATURE-----

--Sig_/19s=sqi43e0HVEKmIf/PXDM--
