From: Eric Leblond <eric@inl.fr>
Subject: Re: matching the first packet of a connection
Date: Wed, 04 May 2005 20:50:39 +0200
Message-ID: <1115232639.5410.3.camel@porky>
References: <1115220105.26791.25.camel@localhost.localdomain>
	<3063e50505041043787ebf03@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ddstcFgBlBTVwHU43dBK"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e50505041043787ebf03@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: George Alexandru Dragoi <waruiinu@gmail.com>
Cc: netfilter@lists.netfilter.org


--=-ddstcFgBlBTVwHU43dBK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-05-04 at 20:43 +0300, George Alexandru Dragoi wrote:
> If you have nothing against ip_conntrack, use -m state --state NEW and
> accepts those connections

question was not so easy ;-)=20
I mean that I want to match the "FIRST" SYN packet and not the second
and following.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-ddstcFgBlBTVwHU43dBK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCeRl+nxA7CdMWjzIRAnBxAJ9Ed7o4ibdq2YYG7Mc29qllpCnyaACfbTDp
5bcu4NXtNrLYkXKIYGj3vN0=
=wDyN
-----END PGP SIGNATURE-----

--=-ddstcFgBlBTVwHU43dBK--


