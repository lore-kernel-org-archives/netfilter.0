From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: [libipq] owner of packet, possible patch
Date: Wed, 07 Mar 2007 15:42:36 +0200
Message-ID: <45EEC14C.30002@gmail.com>
References: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB2E4F6F0D8A816BEE2262217"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:x-enigmail-version:content-type;
	b=SLBnK8caB2plZ1WfvbNFi9CWEwTrz9xX72O9i/YovWfZQ0dFh1/K6LJVJOmSht+AsW/FIzu9MP0HsvG0UkbPhnMSbpUxxw0+EcQOnPp7oei5PcORH2Yt4HDeNPMyS1o4Lx/7vHJGb5SUvvTFCiHINu5hAmqnzt+Zb0KEiHnIzFg=
In-Reply-To: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
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
To: Jack Bauer <mlsubscriber@gmail.com>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB2E4F6F0D8A816BEE2262217
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jack Bauer wrote:
> Hi,
>=20
> I'm a student in computer science and for my master thesis i have to
> handle packets in a userspace queue. Libipq works fine for me, except
> one information which is missing: the owner of a (transmitted) packet.
>=20
> With the following two additional lines, the problem seems to be solved=
:
<snip*>

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#OWNERMATCH

That's implemented a long time ago.

--=20
regards,
Georgi Alexandrov

key server - pgp.mit.edu :: key id - 0x37B4B3EE
Key fingerprint =3D E429 BF93 FA67 44E9 B7D4  F89E F990 01C1 37B4 B3EE


--------------enigB2E4F6F0D8A816BEE2262217
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFF7sFM+ZABwTe0s+4RAqm3AJ98UTbo83axkx2n5c0gPHoTFf/zrwCghsED
5BSQJdadNgQR3GsDxQY6esI=
=MT9p
-----END PGP SIGNATURE-----

--------------enigB2E4F6F0D8A816BEE2262217--

