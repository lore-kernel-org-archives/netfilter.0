From: Chris Barnes <runtimeerror@bigpond.com>
Subject: Re: iptables -L *very* slow
Date: 17 Feb 2003 18:34:45 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045467285.20801.13.camel@billybob.back2front.homelinux.org>
References: <3E5074CF.90904@mega-bucks.co.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-AlRNXFIHySv/6Awhn5s2"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E5074CF.90904@mega-bucks.co.jp>
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


--=-AlRNXFIHySv/6Awhn5s2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I get the same thing when i list my rules. it used to happen to me with
ipchains as well.

I think the others are right when they say that its trying to resolve
the addresses but it might not necessarily mean that you have a faulty
DNS.

alot of my rules dont specify 1 host, they specify a subnet and it still
takes time for iptables to list the rules...

it might be a small bug that iptables is trying to lookup the name for a
subnet address...i thought it would be a little smarter to know that
10.3.2.0/24 isn't a host rather a subnet and therefore shouldn't try to
do a lookup...

anyway, do what the others suggested

ipchains -nL


On Mon, 2003-02-17 at 16:36, Jean-Christian Imbeault wrote:
> When I try and print out my iptable rules using iptables -L, it takes=20
> about three minutes for the rules to print out (and there are only 9 of=20
> them).
>=20
> Why is does this take so long? Is this a bug?
>=20
> I am using the newest version of iptables with a custom 2.4.20 kernel.
>=20
> Thanks!
>=20
> jc
>=20
>=20


--=-AlRNXFIHySv/6Awhn5s2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UJCUMutcjt77K+ARAnNJAJ4id3PuZGasPzBXnDIWqO5F4LeKlQCgmGIV
Nzd46mmJ8vecldjsvdIm85o=
=Rayc
-----END PGP SIGNATURE-----

--=-AlRNXFIHySv/6Awhn5s2--


