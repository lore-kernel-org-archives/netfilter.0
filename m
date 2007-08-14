From: Eric Leblond <eric@inl.fr>
Subject: RE: queue_max_length configuration
Date: Tue, 14 Aug 2007 16:14:13 +0200
Message-ID: <1187100853.2131.8.camel@khasse.inl.fr>
References: <7CCD07160348804497EF29E9EA5560D702233DD3@exchtewks2.starentnetworks.com>
	<7CCD07160348804497EF29E9EA5560D702233DD4@exchtewks2.starentnetworks.com>
	<20070811080314.B0CAB90257@mx0.starentnetworks.com>
	<7CCD07160348804497EF29E9EA5560D702233DFB@exchtewks2.starentnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-EmjlUNwe1LcsUqNZQHRx"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7CCD07160348804497EF29E9EA5560D702233DFB@exchtewks2.starentnetworks.com>
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
To: "Sussman, Scott" <ssussman@starentnetworks.com>
Cc: netfilter@lists.netfilter.org


--=-EmjlUNwe1LcsUqNZQHRx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 14 ao=C3=BBt 2007 =C3=A0 09:37 -0400, Sussman, Scott a =C3=A9crit =
:
> Hi Eric,
>=20
> Thanks for the response, I am using the 2.6.18 kernel. For the nfq_set_qu=
eue_maxlen you mentioned below is this an env variable in userspace or do I=
 set it in my app code?
>=20

Args, it has been added to 2.6.20:
http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dcomm=
itdiff;h=3D829e17a1a602572ffa3beefe582dc103ee9fb9c7;hp=3D7b621c1ea64a54f77b=
8a841b16dc4c9fee3ecf48

In fact, this adds the feature to modify queue max length from the
application. You need a recent kernel (>=3D2.6.20) and a decently recent
libnetfilter_queue.

Best regards,

> Thanks again!
>=20
> Scott
>=20
> -----Original Message-----
> From: Eric Leblond [mailto:eric@inl.fr]=20
> Sent: Saturday, August 11, 2007 4:03 AM
> To: Sussman, Scott
> Cc: netfilter@lists.netfilter.org
> Subject: Re: queue_max_length configuration
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> Le Fri, 10 Aug 2007 14:24:41 -0400,
> "Sussman, Scott" <ssussman@starentnetworks.com> a =C3=A9crit :
>=20
> >=20
> >=20
> > I need to increase the default size of the queue_max_length but do not
> > see where in the code this is defined. Can someone send me a pointer
> > to the location in the code so I can re-compile with a larger value?
>=20
> WHich kernel do you use. On a recent 2.6, you can use
> nfq_set_queue_maxlen in userspace to set the queue_max_length.
>=20
> BR,
> - --=20
> Eric Leblond <eric@regit.org>
> NuFW, Now User Filtering Works : http://www.nufw.org
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.6 (GNU/Linux)
>=20
> iD8DBQFGvW01nxA7CdMWjzIRAuIFAJ4l1YJLmp1wogCE5ZOTRQJYNA6+MACfeqyx
> 4pm++GfDl6qvIKEvSYB2ZQQ=3D
> =3DZJhA
> -----END PGP SIGNATURE-----
>=20
>=20
> "This email message and any attachments are confidential information of S=
tarent Networks, Corp. The information transmitted may not be used to creat=
e or change any contractual obligations of Starent Networks, Corp.  Any rev=
iew, retransmission, dissemination or other use of, or taking of any action=
 in reliance upon this e-mail and its attachments by persons or entities ot=
her than the intended recipient is prohibited. If you are not the intended =
recipient, please notify the sender immediately -- by replying to this mess=
age or by sending an email to postmaster@starentnetworks.com -- and destroy=
 all copies of this message and any attachments without reading or disclosi=
ng their contents. Thank you."

--=-EmjlUNwe1LcsUqNZQHRx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGwbi1nxA7CdMWjzIRAhSyAJ44784h3dA5myPrfaaDGqbduNzwMwCfX1dv
O2xK+Td9wamb6cqiQ7ze800=
=7hPB
-----END PGP SIGNATURE-----

--=-EmjlUNwe1LcsUqNZQHRx--


