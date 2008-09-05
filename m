From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: iptables problem
Date: Fri, 05 Sep 2008 07:39:08 -0500
Message-ID: <1220618348.32533.794.camel@grateful.d.umn.edu>
References: <1bcb7c7f0809050412g67724c2dl3dfcfb2eb59749b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-uXr7z9Crfqj4yekSOgTx"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1bcb7c7f0809050412g67724c2dl3dfcfb2eb59749b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Cam Bazz <cambazz@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


--=-uXr7z9Crfqj4yekSOgTx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-09-05 at 14:12 +0300, Cam Bazz wrote:
> Hello
>=20
> I am running a glassfish server and I need the basic requirement of
> forwarding port 80 to port 8080. Here is what I have done: (I put
> 1.1.1.1 instead of my real ip adress.)
>=20
> #
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT;
> iptables -A INPUT --destination 1.1.1.1/32 -p tcp --dport 8080 -m
> conntrack --ctstate DNAT -j ACCEPT;
> iptables -t nat -A PREROUTING -d 1.1.1.1/32 -p tcp --dport 80 -j
> REDIRECT --to-port 8080;
> iptables -A INPUT -j DROP;
> iptables -I INPUT 1 -i lo -j ACCEPT;
> #
>=20
>=20
> it works fine. but here is the problem. I added another ip address
> with ip aliasing and now I got eth0:1.
>=20
> I want to run apache on port 80 on this ip.
>=20
> but no matter what I tried, I could not modify the rules so packets
> coming to eth0:1 port80 do not go to port 8080 on eth0. currently all
> packets routed to eth0:1 port80 goes to eth0 port 8080.
>=20
> any ideas/recomendations/help greatly appreciated.

The DNAT target can accept ip addresses as well as port numbers.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-uXr7z9Crfqj4yekSOgTx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkjBKGgACgkQU+eIf4TiLaIvqwCggLVJZkbVGRGq5KMwoY5vn3pR
5xEAniiD/XttITzCtytjQmImrHZwtdpc
=r4JS
-----END PGP SIGNATURE-----

--=-uXr7z9Crfqj4yekSOgTx--

