From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: [BUG??] irc module fails
Date: Thu, 6 Oct 2005 15:43:37 +0200
Message-ID: <200510061543.40327.arny@ats.s.bawue.de>
References: <43440E33.4050004@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1633015.07cVgMzo0p";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43440E33.4050004@gmail.com>
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
Cc: patrizio.bassi@gmail.com

--nextPart1633015.07cVgMzo0p
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 05 October 2005 19:32, Patrizio Bassi wrote:
> if i ask dcc chat to an user it doesn't work.
> if i try to send a file, neither (no nat/router problem)
>
> if i try to receive a file it works.
> i've sniffed a dcc chat session with ethereal..

Yes, that's because of the nature of the DCC protocol. If you want to send =
a=20
file, it will open a port locally and the remote host will connect to it. I=
n=20
theory - with NAT this is a different story. Of course, if you want to=20
receive a file, the remote host opens the port and you connect to it. That=
=20
will work through NAT.

> packet arrives but is discarded...
> why? no tracking? seems so strange..

Yes, from ip_conntrack_irc.c:

 *      Module load syntax:
 *      insmod ip_conntrack_irc.o ports=3Dport1,port2,...port<MAX_PORTS>
 *                          max_dcc_channels=3Dn dcc_timeout=3Dsecs
 *
 *      please give the ports of all IRC servers You wish to connect to.
 *      If You don't specify ports, the default will be port 6667.
 *      With max_dcc_channels you can define the maximum number of not
 *      yet answered DCC channels per IRC session (default 8).
 *      With dcc_timeout you can specify how long the system waits for
 *      an expected DCC channel (default 300 seconds).

The kernel must "spy" in irc connections and look out for DCC commands.
If you use IPv6, SSL or a different port than standard 6667, it won't work.


=2D-=20
Thilo Schulz

--nextPart1633015.07cVgMzo0p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDRSoMZx4hBtWQhl4RAm3bAKDglVYJNqjCg263WP5DuRYLPF75ZwCgwu08
+T5lUWUhMstXqY7OwsBt4zc=
=O2oi
-----END PGP SIGNATURE-----

--nextPart1633015.07cVgMzo0p--

