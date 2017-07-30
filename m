From: Perry Thompson <contact@ryper.org>
Subject: Re: recent module in nftables
Date: Sun, 30 Jul 2017 18:32:04 -0500
Message-ID: <20170730183152.12d8a637@lustre.ryper.org>
References: <20170727155959.758138ab@lustre.ryper.org>
        <1889595.mTRbqK2Shg@ged>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/OL8kOhflkjeEmF98H3SWNzG"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1889595.mTRbqK2Shg@ged>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Martin Bednar <martin@serafean.cz>
Cc: netfilter@vger.kernel.org

--Sig_/OL8kOhflkjeEmF98H3SWNzG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Thank you. I hadn't known about hashlimits and flow. While it is still
a bit different, this will work perfectly for what I need it to do.

I suppose from here I'd be curious to know if the "recent" module has
any benefits over "hashlimit" in iptables, and I suppose I'm still
curious to know if it plans on being implemented in nftables or left
out completely, if anyone knows.

Thank you,

On Fri, 28 Jul 2017 21:57:25 +0200
Martin Bednar <martin@serafean.cz> wrote:

> On Thursday, 27 July 2017 22:59:59 CEST Perry Thompson wrote:
> > Hello all,
> >=20
> > It may be way to early to ask this question, but I thought I might
> > as well see if anyone has any information on it.
> >=20
> > Will the "recent" module or an option with a similar function be
> > introduced into nftables in the future? Are there any plans to
> > create something like this? It has always been a very good tool for
> > keeping bad IPs from touching my system. =20
>=20
> I think flow tables might fit the bill.
> https://wiki.nftables.org/wiki-nftables/index.php/Flow_tables
>=20
> I use them for filtering out SSH connection attempts, by allowing 3
> SYN packets per minute.
>=20
> tcp dport ssh ct state new flow table ssh { iif . ip saddr . tcp
> dport timeout 1h limit rate 3/minute}  accept
>=20
>=20
> Cheers
>=20
> Martin.


--Sig_/OL8kOhflkjeEmF98H3SWNzG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEefFXVtKanGCvvBh/4zpqP9fCsrcFAll+bHQACgkQ4zpqP9fC
srcy/w//dYZ2dsxIHp25EtyRvjZv6YrlRJFrHqeC4fd8vTYv0EoJfYvXX4LsBFQi
0EOe3h2GYe0ADi+A27h5J4eCoR23l+zgHfipSfd3pM+cvitEBaPzE/k3LvOf7tMX
Z6T02htYJih7FFbqrv+HlEnJs35R5SI1ASh3AIeIcJJ6MK3Ayek64LHtclCo/+ht
HjDdhaReD752VkME+miEmDa7C/uaG1wNutm2SBSfg+vjuLI7XfnsKM40fY0RN5UA
HagUoa+NA/rudQrCydXf0ZGyE8GF1s/E00u0gs0ZU0pg+HqqFeFvsTmQM5DU+nmo
Ec0ZigYpzfQvK0irHS4UWuO3ZFezN+SghFn1j//EVYm6qLRYtJ3xy9PT2icZeUsU
Z3+xcp9wo/QTMScqOJbTQOs9RmIKAsr43hSTviFynvqpZ6Clyc0N2E8RRdvrxv4s
zMbgOQqNYVuVzZyxxirm6Xg0E7fycVzpxesi73IVq1StoehRD6JhyJux85uw6or8
BlZgQdheyef1hnI9HycqK/F2hMFhrimR7wj8+HZFdJWKOYYvHw6M4kV3ezchfQhP
MO8TGAuw31u4KmGJn8gyJd+nJuxStp87u7Yiinv9mjQAD8eb0X5nnwXf8AwKTGx8
xGHjJAsHrRiER/MutoYGkPK162GIM+ADqAQrLsn2hi2rgLxXEts=
=spDp
-----END PGP SIGNATURE-----

--Sig_/OL8kOhflkjeEmF98H3SWNzG--
