From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Classifying W32/MyDoom.A
Date: Fri, 30 Jan 2004 07:46:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075441566.1999.114.camel@raylinux.internal>
References: <3383379105910242B6F8878D41FA834201A7B5@glsql.greatlakes.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Kjl9QkM9OU7NUl30sy4P"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3383379105910242B6F8878D41FA834201A7B5@glsql.greatlakes.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-Kjl9QkM9OU7NUl30sy4P
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-01-29 at 20:06, Eliot, GLI wireless tech support wrote:
> Has anyone come up with a ruleset for classifying a random TCP or
> specific SMTP connection as being the W32/MyDoom.A virus?

<<snip>>

> Anyone have any ideas how to do this without too many false positives?
> (IE a document on the web that describes the characteristics of
> MyDoom.A).=20

Since it spreads via SMTP from clients and not servers, why not just
block all smtp traffic outbound to the internet from your client
machines, and only allow your mail server to send smtp mail?

Of course you would need a decent anti-virus program on the mail server.

The other way you could possibly do this is by using a string match to
look inside any smtp packets for matches of the attachment names(?).

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Kjl9QkM9OU7NUl30sy4P
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAGe+eh1fuR/Bv+ygRAvByAJ4li5gzqdVfZPE1vAGa/GUYJgsmzwCcDk4m
SGE2H+E4S6l2XBqZZOtB8iE=
=OfrI
-----END PGP SIGNATURE-----

--=-Kjl9QkM9OU7NUl30sy4P--


