From: Ivan Dubrov <wfragg@gmail.com>
Subject: Routing decision after FORWARD
Date: Wed, 27 Jun 2007 20:15:58 +0700
Message-ID: <4682630E.30406@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig61E1BE44BF1945CE600AFEC4"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:x-enigmail-version:content-type;
	b=odoWgIGGtugMJ0tQgefPyh9s2J/YDYuEbIzHtzrHJcJF4L08+db+JXI9m7OKdk4l8n/9ptu0wwOkYVj4PDas9Ye+lyQ0uhc2vea/bw42XXjv4TeQYPXGhO4nj4b9zGTzatOsMoEY+3LMf3Rdt2+cWzGqCm7ctJ4BlT5HTPqEmHQ=
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
--------------enig61E1BE44BF1945CE600AFEC4
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


--=20
WBR,
Ivan S. Dubrov



--------------enig61E1BE44BF1945CE600AFEC4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGgmMQLZ+Fnc2HIX4RAsR3AJ9C2hN51hOUreqxSxfVrfzKsYLYkgCfUYeB
Iiphlzj778+VhLW79Kf/80w=
=qS8a
-----END PGP SIGNATURE-----

--------------enig61E1BE44BF1945CE600AFEC4--

