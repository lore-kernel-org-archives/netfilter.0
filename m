From: Alan Ezust <alan.ezust@presinet.com>
Subject: missing DESTROY events in conntrack -e output?
Date: Wed, 2 May 2007 16:56:43 -0700
Message-ID: <200705021656.45401.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4456921.ojjUmG2HS5";
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

--nextPart4456921.ojjUmG2HS5
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I was just wondering, has anyone else observed that conntrack -e (running i=
n=20
events mode) sometimes shows me DESTROY events and sometimes does not, even=
=20
for TCP protocol packets. Why would this be?


--nextPart4456921.ojjUmG2HS5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGOSU9sJbtw6GURksRAnK/AJ9XumyAB7C463YxpWizlqh0KY+4GgCghxWZ
iQl/VgcOCVpikvMbCZvNJqo=
=Qw20
-----END PGP SIGNATURE-----

--nextPart4456921.ojjUmG2HS5--

