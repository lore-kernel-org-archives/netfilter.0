From: Scott van Looy <scott@ethosuk.org.uk>
Subject: connection stuff
Date: 12 Feb 2003 10:30:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045045817.4068.7.camel@pixel.ethosuk.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-IwmZMn8IKKRNg3GuK7l2"
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--=-IwmZMn8IKKRNg3GuK7l2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have 6x external IPS and they're mapped using pre and post routing to
internal IPS as 1:1 NAT

I have NAT of local connections compiled into my kernel

So why can't I ssh from internal to the domain name of the external?

ssh lazarus
ssh: connect to host lazarus port 22: Connection refused

Just mildly confused is all

I can't view websites either on that box without adding its host and
internal ip to my hosts file

Is there a reason for this? :)

--=20
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

Be free and open and breezy!  Enjoy!  Things won't get any better so
get used to it.

--=-IwmZMn8IKKRNg3GuK7l2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+SiI5fPnlJkTZ1KcRArkEAKCdMD3WR4oC9dNgf9oEW32Ig0BJVgCgi9ih
4fIv08alSf5Zm/0P7qYDk18=
=LgSs
-----END PGP SIGNATURE-----

--=-IwmZMn8IKKRNg3GuK7l2--

