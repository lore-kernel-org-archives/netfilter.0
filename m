From: Eric Leblond <eric@inl.fr>
Subject: Re: Question about running nf_queue
Date: Wed, 02 May 2007 08:55:42 +0200
Message-ID: <1178088942.861.19.camel@localhost>
References: <46382E5A.9060201@amnafzar.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-i/RRvoCWCIGfPXc0r9CO"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46382E5A.9060201@amnafzar.com>
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
To: Bahamin Takhtaei <takhtaei@amnafzar.com>
Cc: netfilter@lists.netfilter.org


--=-i/RRvoCWCIGfPXc0r9CO
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 02 mai 2007 =E0 10:53 +0430, Bahamin Takhtaei a =E9crit :
> Hi,
> I installed libnfnetlink_0.0.16 and libnetfilter-queue_0.0.12,
> now please tell me how can I use nf_queue instead ip_queue?

The API has changed and you need to use a modified version of the
software you use. Thus look at configure option to see if nf_queue
support is already available.

If you are interested in porting the software, you can have a look to
nfqnl_test.c in libnetfilter_queue source or to NuFW code.

You can find a doxygen documentation of the more interesting field
related to this subject here:
	http://docs.nufw.org/doxygen/trunk/html/packetsrv_8c-source.html

Best regard,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-i/RRvoCWCIGfPXc0r9CO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGODXunxA7CdMWjzIRAjp8AJ9m0bVcFCUlEvyTMwEnQS8sJ7BylgCeLxHb
m/QX+lEXRArmzoRD9n1A3No=
=O1jY
-----END PGP SIGNATURE-----

--=-i/RRvoCWCIGfPXc0r9CO--


