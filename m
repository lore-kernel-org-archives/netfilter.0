From: =?iso-8859-1?q?Gr=E9goire_Leroy?= <gregoire.leroy@hyperthese.net>
Subject: Re: Fair queuing with htb
Date: Sat, 25 Dec 2010 04:51:52 +0100
Message-ID: <201012250452.01340.gregoire.leroy@hyperthese.net>
References: <201012230226.31297.gregoire.leroy@hyperthese.net> <201012250208.36503.gregoire.leroy@hyperthese.net> <4D155860.6090507@via.ecp.fr>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart17249133.RImqoe21s6";
  protocol="application/pgp-signature";
  micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D155860.6090507@via.ecp.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Antoine Souques <corum@via.ecp.fr>, Andrew Beverley <andy@andybev.com>
Cc: Julien Vehent <julien@linuxwall.info>, netfilter@vger.kernel.org

--nextPart17249133.RImqoe21s6
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Le Saturday 25 December 2010 03:35:12, Antoine Souques a =E9crit :
> > I've attached a graph which explains what are the marked packets.
>=20
> Your design is wrong. You mark the upload traffic, when the main http
> traffic is the download traffic. That is why your QoS seems ineffective

In this case I have probably misunderstood the goal of the tcp_outgoing_mar=
k=20
squid directive. Andrew, in what purpose is it developped ?

>=20
> > The general goal is to do a QoS based on user ip. If I had no proxy, it
> > would be easy. However, since I've a proxy, my firewall sees the proxy
> > ip, not the users IP.
>=20
> Where is your firewall ? Between the proxy and the webserver, or the
> otherside ?
>=20

Yes it is

> In the first case, you can only mark the upload traffic (it's to late
> for the download traffic). You should use the conntrack module to mark a
> connection, and so, you will be able to mark the download traffic

I thank it was the goal of the tcp_outgoing_mark squid directive (authored =
by=20
Andrew).

> Moreover, I don't understand why you don't have access to your user
> addresses. You use mark, so your firewall and your proxy are running on
> the same box. So, when the download traffic leaves your proxy/firewall,
> the destination adsress is the user address. tc is called when a packet
> is send to the network, or when a packet arrive. So you can do IP based
> QoS.

The problem is if I limit the traffic between the proxy and users, then he=
=20
won't any difference between the data downloaded from internet and the data=
=20
which was in cache in squid.

I want to limit the rate only for non-cached data, so it seems relevant to=
=20
apply QoS between proxy server and internet.


--nextPart17249133.RImqoe21s6
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EABEIAAYFAk0ValkACgkQB3Y8MwGKx1cW7wD/bI6U3EyiibIK+0wq/4O2ck/K
AEc5kY/H+QwxLmcgmrYA/2oEUnDqVYnrohVhET//qzZDxJBXefR0fs0H7aIZBuBw
=O5J0
-----END PGP SIGNATURE-----

--nextPart17249133.RImqoe21s6--
