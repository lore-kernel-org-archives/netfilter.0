From: Paul Evans <paul@mxtelecom.com>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 18:07:28 +0000
Message-ID: <20081120180728.23e681bf@nacelle.mxtelecom.com>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
	<20081120122753.606233a2@nacelle.mxtelecom.com>
	<d006ee070811201000k7684ffaah4851e687dc3942d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6AfOGUTVD+Id35si/WxXqWX";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d006ee070811201000k7684ffaah4851e687dc3942d4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mike <mikef1007@gmail.com>
Cc: netfilter@vger.kernel.org

--Sig_/6AfOGUTVD+Id35si/WxXqWX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Nov 2008 10:00:20 -0800
Mike <mikef1007@gmail.com> wrote:

>  iptables -t nat -A PREROUTING -p tcp --dport X -j REDIRECT
> --to-ports Y
>=20
> I ssh from another box, into the box I issued the above iptable
> tcpdump only showed traffic on port X and nothing on port Y

That sounds correct. tcpdump watches very close to the "wire"; that is,
what comes in/goes out over ethernet or PPP or whatever the link uses.
For incoming traffic it will see before nat has rewritten the packets.

Try watching the -i lo interface, instead of eth/ppp/whatever

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/6AfOGUTVD+Id35si/WxXqWX
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkklp2AACgkQcGehlx3Gqx7QrACglTIwlmllrho3Md59ZhzKNRI5
bzEAnjrBqmRwdsKgJfxQm++FY7785r5T
=rRQo
-----END PGP SIGNATURE-----

--Sig_/6AfOGUTVD+Id35si/WxXqWX--
