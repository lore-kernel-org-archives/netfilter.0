From: Eric Leblond <eric@inl.fr>
Subject: RE: Change of ip addresses continues.... :(
Date: Thu, 26 Aug 2004 23:33:12 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093555992.4293.37.camel@porky>
References: <D5C9032B2B09C64EA2409D6214E91AC90512EE@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-EbjOIvR9SbR8+9QEGN0s"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512EE@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org
Cc: dravya@magma.ca


--=-EbjOIvR9SbR8+9QEGN0s
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-26 at 23:26, Jason Opperisano wrote:
> > I have been trying various set of rules in various table in order to ha=
ve packets go over
> > the right link. ie. packet's src add should match outgoing link's ip ad=
dress.YET, there
> > iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
> > iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
> > iptables -t mangle -A PREROUTING -m mark ! --mark 0 -p icmp -j MARK --s=
et-mark 1
> > iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j MARK --set-mark =
2

There's something weird here :=20
-m mark ! --mark 0=20
at each line you should better do=20
-m mark --mark 0
at the two last lines.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-EbjOIvR9SbR8+9QEGN0s
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLlcYnxA7CdMWjzIRAtuGAJ0UADoZkkN2NzCeUyJkNDqNw0ld6wCeOu7r
FSQzGMp07R118Ta0G8CQf0Y=
=DUze
-----END PGP SIGNATURE-----

--=-EbjOIvR9SbR8+9QEGN0s--


