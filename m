From: "David C. Hart" <DCH@TQMcube.com>
Subject: Couple More Questions
Date: Thu, 30 Oct 2003 13:57:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067540253.2895.44.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-oifwbmIGVjr9JsPwWfDz"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: iptables mailing list <netfilter@lists.netfilter.org>


--=-oifwbmIGVjr9JsPwWfDz
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've read the tutorial but a couple of doubts linger.

1. Since I'm only logging rejected packets, any suggestions on getting
name resolution into the log?

2. I'm still a bit confused on the logging of the destination address.
With our one static IP, there are two possibilities. Either a packet is
intended for our IP or for another. Yet, the logs will always show the
destination address as the IP of the LAN interface. Any suggestions?

--=-oifwbmIGVjr9JsPwWfDz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/oV8dol4OE0cpGaIRAkN1AJ9HJlFOaBSbYVQUoq3rstLCTZnGJgCfWRy+
bn0pk9LbEzEObzV2Eah9Wfs=
=u+/B
-----END PGP SIGNATURE-----

--=-oifwbmIGVjr9JsPwWfDz--


