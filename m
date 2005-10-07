From: Benjamin Schieder <blindcoder@scavenger.homeip.net>
Subject: ipt_owner on SMP
Date: Fri, 7 Oct 2005 14:42:43 +0200
Message-ID: <20051007124243.GM16309@scavenger.homeip.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
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


--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi List.

I'm currently writing an application that makes heavy use of the ipt_owner
module and the owner-socketlookup patch from patch-o-matic.
Now I'm at a point where using --pid-owner becomes necessary.
My machine is a dual P3 800 SMP machine, which results in:

ipt_owner: pid, sid and command matching is broken on SMP.

Is there any way to fix this so I can use this feature or do I have
to work around this brokenness somehow with ipt_comment?

Thanks in advance,
       Benjamin

--=20
The Nethack IdleRPG! Idle to your favorite Nethack messages!
http://pallas.crash-override.net/nethackidle/

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDRm1D7Wabow2Um2YRAkdjAKCgFWd0MS8c6biLAK5WjfsoRxfiuQCfeJPL
b3u9RfDFInGSRqV+uGAN/uI=
=Pr2p
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--

