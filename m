From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: top level rules
Date: 12 May 2003 15:06:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052744760.19485.13.camel@raylinux.internal>
References: <ABEKJILKOKKGGDJKHKDFEEAICBAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-fzSRBxIAK18H41oodhiR"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFEEAICBAA.patrick@vikus.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter EMAIL <netfilter@lists.netfilter.org>


--=-fzSRBxIAK18H41oodhiR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

=46rom the netfilter help (iptables --help)

"
 --insert  -I chain [rulenum]
                                Insert in chain as rulenum (default
1=3Dfirst)
"

So ... iptable -I instead of iptables -A ....


On Mon, 2003-05-12 at 14:25, Patrick Ahler wrote:
> Is there any way to insert a new rule at the top of a table...
>=20
> For instance, I have rules...
>=20
> RULE 1
> RULE 2
> RULE 3
> RULE 4
>=20
> in order... but what if I want to place a rule before rule 1? Is that
> possible?
> Thanks,
> -Patrick
>=20
>=20
>=20

--=-fzSRBxIAK18H41oodhiR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+v5w4h1fuR/Bv+ygRAmH5AKCE//x18mrofJHie7ylnl+4trFZiwCfQerk
GZkF3zZtRsrzG+8ejSfjjeM=
=Dbx9
-----END PGP SIGNATURE-----

--=-fzSRBxIAK18H41oodhiR--


