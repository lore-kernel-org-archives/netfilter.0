From: Eric Leblond <eric@inl.fr>
Subject: Re: providing partial access to iptables for non root user
Date: Wed, 23 Feb 2005 23:38:59 +0100
Message-ID: <1109198339.17992.40.camel@porky>
References: <4219C6F1.2070500@juergens.name>
	<1108996157.5516.14.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-wqGvxLVyEwGSpyg8Mvvz"
In-Reply-To: <1108996157.5516.14.camel@hubcap.ljm.dom>
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
To: netfilter@lists.netfilter.org


--=-wqGvxLVyEwGSpyg8Mvvz
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-02-21 at 09:29 -0500, Jason Opperisano wrote:
> On Mon, 2005-02-21 at 06:33, Michael J=FCrgens wrote:
> > Hi,
> >=20
> > I=B4m looking for a solution to provide a non root user write access to=
 a=20
> > chain.
> >=20
> > In this special case I have to provide the a mechanism to block some ip=
=20
> > adresses to connect to http.
> > But this should be done by a non root user. The non root user should no=
t=20
> > change any other rule.
> >=20
> > Any ideas?
>=20

Why not to use a conf file with proper right ?
selected user could add rules in the script that will be automatically
inserted into the firewall via a cron task or a sudo script ?

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-wqGvxLVyEwGSpyg8Mvvz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCHQYCnxA7CdMWjzIRAoD+AJ9I8EEBoylU7Ep7NwJHk+bbWSwrXgCfZEmF
XJCLIPHMo27nDr7IUR9OSDE=
=za9f
-----END PGP SIGNATURE-----

--=-wqGvxLVyEwGSpyg8Mvvz--


