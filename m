From: "David C. Hart" <DCH@TQMcube.com>
Subject: Newbie
Date: Wed, 29 Oct 2003 14:19:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067455194.4723.139.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-w4OL1cKFmQkVmrE7SrwZ"
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
To: netfilter@lists.netfilter.org


--=-w4OL1cKFmQkVmrE7SrwZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I'm a bit of a nitwit and could use some pointers from more experienced
hands.

We changed routers recently and with it the processes. The objectives
remain the same:
1. To protect the server (running Apache, Postfix and Vftp).
2. To provide DShield reporting.
3. To get reliable data so that, from time to time, we can contact ISPs
when things get out of hand.

The setup is simple and does not use the router's NAT.=20

I am using only the NAT IPtable. HTTP, SMTP, FTP and Pop3 get port
forwarded. Anything that doesn't get port forwarded is presumed to be
intrusive and gets logged and dropped. So far so good.

Questions:

1. Does this approach make sense?=20

2. I'm getting the LAN address in the logs rather than the intended
destination IP. Is there some way to preserve the original data?

3. Is anyone aware of a decent log analyzer that will also provide host
resolution?

4. I would rather use the FILTER table for the refused connections to
reject rather than drop. I'm sure that it's simple but I just don't get
it. This would depend upon the filter table rules following the NAT
table rules. Where is this order established?

Thanks.

--=-w4OL1cKFmQkVmrE7SrwZ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/oBLaol4OE0cpGaIRAs7nAKCvuhbEv5nFcvmGFQLj34SQJHfUJACfT49G
0hKSZJQYw0TGP7KxRzgHAjc=
=gfTn
-----END PGP SIGNATURE-----

--=-w4OL1cKFmQkVmrE7SrwZ--


