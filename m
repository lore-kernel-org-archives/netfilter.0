From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: Iptables rules processing
Date: Fri, 3 Aug 2007 19:44:10 +0200
Message-ID: <20070803174410.GA11029@sid.toystory.lan>
References: <20070803170735.GC7815@sid.toystory.lan>
	<001b01c7d5f4$91781110$0101000a@tanjian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001b01c7d5f4$91781110$0101000a@tanjian>
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


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2007 at 07:34:39PM +0200, Rob Sterenborg wrote:
> > I meant, there can't be no such processing  ?
> >
> > 1/
> > -> ...
> > -> match for the source address 192.168.10.14
> >     |-> match for destination port 80 -> ACCEPT
> >     |-> match for the destination port 443 -> ACCEPT -> ...
>=20
> Yes, this is possible using a user defined chain.
>=20

This is waht I wanted to know, I can't get such a processing without the us=
er
defined chains ; Iptables doesn't do it by itself.

Thanks.

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGs2lqxJBTTnXAif4RAjPGAJwOvarNkLFd9HDbiRUX3oGl/XLFWACcClUR
4vo4r7kZm0S+AuPWZ26cOvI=
=7aw7
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--


