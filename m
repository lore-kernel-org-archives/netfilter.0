From: Darren Kirby <bulliver@badcomputer.no-ip.com>
Subject: MAC addresses
Date: Sat, 11 Sep 2004 11:50:38 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409111150.50506.bulliver@badcomputer.no-ip.com>
Reply-To: bulliver@badcomputer.no-ip.com
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1142899.Wa3TfR1JRP";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

--nextPart1142899.Wa3TfR1JRP
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello netfilter list,

I have a fairly good knowledge of iptables etc...but there is one point I=20
would like some clarification on.

This is from the iptables tutorial located here:
http://iptables-tutorial.frozentux.net

"6.4.3.2. MAC match
The MAC (Ethernet Media Access Control) match can be used to match packets=
=20
based on their MAC source address. As of writing this documentation, this=20
match is a little bit limited, however, in the future this may be more=20
evolved and may be more useful. This match can be used to match packets on=
=20
the source MAC address only as previously said"

Are MAC addresses unique for all ethernet cards? What I would like to know =
is=20
could I use this rule to allow ssh connections ONLY from my notebook no=20
matter what its current IP address happens to be, and drop all other=20
connection requests?

Thanks for any insight...

=2Dd

=2D-=20
Part of the problem since 1976
http://badcomputer.no-ip.com
Get my public key from=20
http://keyserver.linux.it/pks/lookup?op=3Dindex&search=3Dbulliver
"...the number of UNIX installations has grown to 10, with more expected..."
=2D Dennis Ritchie and Ken Thompson, June 1972=20

--nextPart1142899.Wa3TfR1JRP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBQ0kKOrzWcOwL7mwRAkaqAJ0RVAyw4D5b2okJ53epxwwnLjaoqQCgghVn
KMdYcK3LYVUIL7lccMtSxko=
=xJn4
-----END PGP SIGNATURE-----

--nextPart1142899.Wa3TfR1JRP--

