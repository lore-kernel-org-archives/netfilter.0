From: Eric Leblond <eric@regit.org>
Subject: Re: How can I ask IPTABLES to drop a packet based upon its content
Date: 06 Aug 2003 11:50:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060163434.13515.17.camel@tech004.alphalink.fr>
References: <88116A11E9DFD411870900508BEC3831803C2B@CPQ01>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ebhSaSNO5AScfU2ehIoR"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <88116A11E9DFD411870900508BEC3831803C2B@CPQ01>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>


--=-ebhSaSNO5AScfU2ehIoR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-08-06 at 11:37, Deshwal Chand wrote:
> Hi,
>=20
> I am running IPTABLES on Redhat 7.2 box. We are running a mail server
> behind this firewall. We receive lot of spam e-mails. Instead of
> investing into the anti-spam s/w, I want to configure the IPTABLES to
> read the contents on the packets and drop them based upon the filter
> defined.

You can use the the string module to do so (in POM)
But a really better choice is to install a spam software like
spamassassin.

BR,
--=20
Eric Leblond <eric@regit.org>
Regit.org

--=-ebhSaSNO5AScfU2ehIoR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/MM9qnxA7CdMWjzIRAq0oAJ94AiUlNCLOWgSNhW7oRDVl/MCv9QCePdUP
/SywyEUq/ePnhDiOMOZJ+Fo=
=RkSH
-----END PGP SIGNATURE-----

--=-ebhSaSNO5AScfU2ehIoR--


