From: Rene Mayrhofer <rene.mayrhofer@gibraltar.at>
Subject: Re: do_IRQ: stack overflow
Date: Mon, 10 Jul 2006 14:37:36 +0100
Message-ID: <200607101437.40663.rene.mayrhofer@gibraltar.at>
References: <200607071547.51437.rene.mayrhofer@gibraltar.at>
	<4354d3270607100608o15eff2b7w38168ece9a7cae9c@mail.gmail.com>
	<44B25377.2010002@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3014774.1D7mXbbei4";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44B25377.2010002@eld.physics.leidenuniv.nl>
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
To: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Cc: netfilter@lists.netfilter.org

--nextPart3014774.1D7mXbbei4
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Monday 10 July 2006 14:17 schrieb Arno van Amersfoort:
> I had something simular in the past. This turned out to be a broken
> network card (3COM 3C905).... I hope this info can be of value to you...
Interesting - I though about it. But then we tried with a different hardwar=
e=20
(first different hardware appliance of same make, then different hardware=20
appliance), and still had the problem.

Bart Trojanowski provided a patch to openswan KLIPS, which should reduce it=
s=20
stack usage somehow. I hope to be able to try it in a few days (the only=20
system where we see this problem is of course a production machine...).

with best regards,
Rene

=2D-=20
=2D------------------------------------------------
Gibraltar firewall       http://www.gibraltar.at/

--nextPart3014774.1D7mXbbei4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEslgkq7SPDcPCS94RAngEAJ9hA08q9GrgL5xFLblKYQTANrT27wCgxxY3
+RwvfdzpHCF+DSjGIj+sCOI=
=Q2L9
-----END PGP SIGNATURE-----

--nextPart3014774.1D7mXbbei4--

