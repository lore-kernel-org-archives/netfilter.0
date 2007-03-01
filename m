From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: iptables:  "COMMIT"
Date: Thu, 1 Mar 2007 19:46:36 +0100
Message-ID: <20070301184636.GA19677@toystory.lan>
References: <000901c75bfe$8e75bcd0$6401a8c0@apollosjf>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c75bfe$8e75bcd0$6401a8c0@apollosjf>
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


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 01, 2007 at 07:38:39AM -0500, woger151 wrote:
> I can't find any documentation on the COMMIT keyword, nor is it mentioned=
=20
> in the Linux firewalls book I have.
>=20
> What is it?  Is it necessary to use in firewall scripts?
>=20
> TIA=20
>=20
>=20

=46rom the Iptables Tutorial, section iptables-save :

"The COMMIT keyword tells us that at this point we should commit all
rules currently in the pipeline to kernel"

You do not need to use it in your script. This one is only used to "commit"
rules from the output of the iptables-save command, as you would do with
a SQL script.

--=20
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF5x+MxJBTTnXAif4RAotXAJ9AET2IPsL4bNi/AXB8Mob1NeuynACeJ3j6
JI/cvQ0frTLqBLwygahVNAg=
=WKpH
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


