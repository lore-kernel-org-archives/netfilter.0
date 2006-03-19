From: "Vann H. Walke" <vann@walkeonline.com>
Subject: Daisy Chaining two computers?
Date: Sun, 19 Mar 2006 16:56:19 -0500
Message-ID: <1142805379.4080.31.camel@home.walkeonline.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-r6S4tytuFwfLM4To5qnX"
Return-path: <netfilter-bounces@lists.netfilter.org>
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


--=-r6S4tytuFwfLM4To5qnX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have an environment in which network drops are limited.  We have two
boxes at each location, one running Linux, one running Windows.  What I
would like to do is set the machines up so that the Linux box acts both
as a pass through for the Windows machine and is usable on its own.
Thus, the situation would look something like:
=20
       	  |   Linux	Windows
Network---|---|	  |-----|
   	  |    	    =20
 =20
To the windows machine it should appear that it is directly connected to
the network (including dhcp access, etc...).  I do not have the
authority to make any changes to the windows configuration.  The Linux
machine should appear to a user as being completely normal.

Can I accomplish this with netfilter/iptables?  If so, how?  Any
pointers to information on this type of configuration?

Thanks greatly,
Vann

--=-r6S4tytuFwfLM4To5qnX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEHdODDJgiz0bRMGwRArsSAKCOY8SbWDaBVKFYKyqs29wtNSm/EgCgiG8P
VsWqIbA35iW6iEbzdz2L3r8=
=9tC9
-----END PGP SIGNATURE-----

--=-r6S4tytuFwfLM4To5qnX--


