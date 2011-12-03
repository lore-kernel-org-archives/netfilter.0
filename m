From: Eric Leblond <eric@regit.org>
Subject: Re: doc: Secure use of iptables and connection tracking helpers
Date: Sat, 03 Dec 2011 12:23:36 +0100
Message-ID: <1322911416.603.2.camel@ice-age.regit.org>
References: <1322501576.20587.22.camel@tiger.regit.org>
	 <1322906769.8042.4.camel@hakkenden.homenet>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-xh5Mdm8ufBlen8ROSECg"
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1322906769.8042.4.camel@hakkenden.homenet>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, pablo@netfilter.org, kaber@trash.net


--=-xh5Mdm8ufBlen8ROSECg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le samedi 03 d=C3=A9cembre 2011 =C3=A0 14:06 +0400, Nikolay S. a =C3=A9crit=
 :
> =D0=92 =D0=9F=D0=BD., 28/11/2011 =D0=B2 18:32 +0100, Eric Leblond =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > Hello,
> >=20
> > Pablo Neira Ayuso, Patrick McHardy and I have worked on a document we'v=
e
> > called "Secure use of iptables and connection tracking helpers".
> >=20
> > This is a guide describing how to use securely the connection tracking
> > helpers. This is a recommended reading for all Netfilter/Iptables users=
.
> >=20
> > HTML version: http://home.regit.org/netfilter-en/secure-use-of-helpers/
> > PDF version:
> > http://home.regit.org/wp-content/uploads/2011/11/helper-recommandation.=
pdf
> >=20
> > BR,
>=20
> There is one thing in "Using the CT target to refine security" section.
> If we use the CT target and pass '0' as ports to nf_conntrack_ftp as
> advised in the next section, the helper name would be "ftp-0", not
> "ftp". I know, that helper module naming is described somwhere, but what
> if we could mention it here also?

Really good catch, I've published an update.

Thanks a lot.

BR,
--
Eric


--=-xh5Mdm8ufBlen8ROSECg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iD8DBQBO2ga5nxA7CdMWjzIRAnUnAJ45MILAqyX1OGl0b8eV6R01RG1jgACdE5At
9slVEZVMNI6L8tAXOPv+J18=
=VkSX
-----END PGP SIGNATURE-----

--=-xh5Mdm8ufBlen8ROSECg--

