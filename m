From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Per connection transfer rate matching
Date: Thu, 05 Feb 2004 09:28:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075966119.5355.0.camel@raylinux.internal>
References: <877jz2iiil.fsf@iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-UTBQ4RSEutZJl0oUmFQ2"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <877jz2iiil.fsf@iki.fi>
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


--=-UTBQ4RSEutZJl0oUmFQ2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-02-05 at 00:31, Nuutti Kotivuori wrote:
> I have recently trying to find a solution to a QoS problem of sorts.
>=20
> What I would wish to be able to do, is to mark a connection based on
> the data transfer rate in that connection. That is, to have some sort
> of a token bucket filter or rate estimator attached to a certain
> connection tracking connection - and to be able to use that in
> netfilter rules.
>=20
> An example problem case is trivial. Let's assume we have an
> interactive transfer class, which has several interactive sessions
> where latency is tried to be kept to a minimum. Occasionally some
> interactive session might start transferring a lot of data - in which
> case it should be scheduled into the maximum throughput class,
> forgetting latency, until it doesn't transfer that much and it should
> be returned to the interactive class again.
>=20
> The 'connbytes' match in the patch-o-matic matches on cumulative
> transfer amounts on a per connection basis. The 'limit' match matches
> packets on a simple token bucket implementation. Combining these two
> to something which matches bytes on a simple token bucket per
> connection would create the desired result.
>=20
Could you not do it then by using two user defined chains, one for limit
match and one for connbytes?

> So, does such a thing exist already? If not, do other people see this
> as useful as I do? Or have I missed something crucial?
>=20
> And finally, if it doesn't exist already, making such a module
> shouldn't be too hard - would anyone be willing to undertake such an
> ordeal?
>=20
> -- Naked
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-UTBQ4RSEutZJl0oUmFQ2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAIfCnh1fuR/Bv+ygRAmFRAKC53xhs6Def0C1eg7bTVdZeVBDHfACglhxp
RYet+A5ePoCMbMxLNCCHG74=
=HRtl
-----END PGP SIGNATURE-----

--=-UTBQ4RSEutZJl0oUmFQ2--


