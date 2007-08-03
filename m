From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Iptables rules processing
Date: Fri, 3 Aug 2007 18:13:02 +0200
Message-ID: <20070803161302.GB7815@sid.toystory.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Assuming we have the next two rules in our ruleset :

iptables -A INPUT -s 192.168.10.14 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 192.168.10.14 -p tcp --dport 443 -j ACCEPT

I was wondering whether rules are processed one by one.
In the two rules above, we have to check the source address
192.168.10.14, so I think this is done for the first one, and then for
the second one. I am not quite sure ; Can anyone confirm that ?

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGs1QOxJBTTnXAif4RAmR0AJ9v7hd+KU7PNzrb5O7hnTQwdVGEvQCgziNX
NBHg4yEhbaFKlArhH722UE4=
=capX
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--


