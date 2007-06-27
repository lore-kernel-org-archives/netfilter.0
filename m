From: Ivan Dubrov <wfragg@gmail.com>
Subject: Is there routing decision after FORWARD?
Date: Wed, 27 Jun 2007 19:02:49 +0700
Message-ID: <468251E9.5040407@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig273757529CA49382D46BC7A3"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:x-enigmail-version:content-type;
	b=d8iA4yi3beKYB7kfhCeHXIwlig/4NwedUa8hRwbFYpqF1/YlK5hCg7vJ+TRCQcKoAjOqgPW7MSrKgjK9tAFHT7OrT2g9r5Ep8uPb+fRh8H7GFrCv021ZBETgs6xs/TVuvI5u+EyASk/pop3HtaLUrGP953AXLWUkQWUqmkyv180=
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig273757529CA49382D46BC7A3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

Look here:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGG=
ENERAL

According to the diagram, there is routing decision after
filter/FORWARD. However, according to the tables before, there is no
such routing (there is only one routing before mangle/FORWARD). The
question is, which one is correct?

Please CC me since I'm not subscribed to the list.

--=20
WBR,
Ivan S. Dubrov



--------------enig273757529CA49382D46BC7A3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGglHrLZ+Fnc2HIX4RAkodAJ4+327LWhskuj5TMEzg9LwrwavRGwCfdrFL
EJK1e3eYYoLTSlQHVfZaDRE=
=0Rse
-----END PGP SIGNATURE-----

--------------enig273757529CA49382D46BC7A3--

