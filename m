From: Chris Barnes <runtimeerror@bigpond.com>
Subject: Re: newbie problem
Date: 17 Feb 2003 21:31:02 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045477862.21055.7.camel@billybob.back2front.homelinux.org>
References: <1045467799.20801.22.camel@billybob.back2front.homelinux.org> 
	<200302170309.16516.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-P5SD/Sbyc0/RZ6orvQoW"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302170309.16516.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>


--=-P5SD/Sbyc0/RZ6orvQoW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-02-17 at 19:09, Joel Newkirk wrote:
>=20
> You have to accept connections TO port 80, not FROM port 80...
>=20
> Try these:
>=20
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> They will allow clients to connect and retrieve http documents, as well=20
> as allowing the very useful ICMP controls like source_quench=20
> fragmentation control and such that really make web browsing work=20
> properly, but no other communication in OR out is allowed by these=20
> rules.  (assuming DROP policy on OUTPUT)  Add appropriate ACCEPT rules=20
> to OUTPUT if the server needs to initiate connections for some reason.
>=20

source_quench (sounds like a fruit juice drink :p ) and all that is
really important? hmm, i had no idea such things existed (excuse my
ignorance..newbie here).

I'll make sure i add those rules...

thanks heaps.


--=-P5SD/Sbyc0/RZ6orvQoW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+ULnlMutcjt77K+ARAp4GAJ94cV9bjN4JbgDry9M/5QlEZdjIYACgiNGW
dzktnHGsEWyjRh26EcN60ug=
=VI8u
-----END PGP SIGNATURE-----

--=-P5SD/Sbyc0/RZ6orvQoW--


