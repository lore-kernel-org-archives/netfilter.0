From: Athan <netfilter@miggy.org>
Subject: Re: Subject: Re: Making this list more readable
Date: Thu, 9 Jan 2003 01:27:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030109012733.GH21359@miggy.org>
References: <3E1CB63C.9090602@aut.ac.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E1CB63C.9090602@aut.ac.nz>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ian Batterbee <ian.batterbee@aut.ac.nz>
Cc: netfilter@lists.netfilter.org, Athan <netfilter@miggy.org>, Carol Anne Ogdin <caogdin@deepwoods.com>


--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2003 at 12:37:32PM +1300, Ian Batterbee wrote:
> I see the problem as well.. I think it's caused by the fact that many of=
=20
> the individual messages in the  are content-transfer-encoding:=20
> quoted-printable, but the digest has no content-transfer-encoding in the=
=20
> header, so the quoted-printable data inside the messages included in the=
=20
> digest is treated as plain text and incorrectly formatted.
>=20
> If we know that ALL messages contained in the digest are=20
> quoted-printable, then it would just be a matter of changing the=20
> content-type of the digest, but I've noticed the problem doesn't occur=20
> on all messages.. some are fine.. so...  I guess people's mailers are=20
> simply posting as quoted-printable, and the digest process is just=20
> including the message body as-is

  Having checked and found this list is run with mailman, and then
checked the options for a list I have admin access to the solution is to
just make the digests 'plain' rather than 'mime'.  I presume the former
means you get one big file in mbox style, which may cause some people
problems too I guess.  This list is mailman 2.0.11, the one I checked is
2.0.12, so there's not going to be any extra options in this list's
config for it.

  Of course you could just read it in normal mode rather than digest ;).

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4c0AUACgkQzbc+I5XfxKdjiwCff0T7G1MaC99HlI3ZHnwDOx40
k7gAmway8PH8NLVpT6sWbWyzXSNLZ6mz
=7mWZ
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--

