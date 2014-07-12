From: Ruben Herold <ruben@insecure.pw>
Subject: Searching NAT46 and NAT64 solution
Date: Sun, 13 Jul 2014 01:49:29 +0200
Message-ID: <20140712234929.GS2822@insecure.pw>
Reply-To: Ruben Herold <ruben@insecure.pw>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tBhgiDt8dP1efIIJ"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=insecure.pw;
	s=default; t=1405208970;
	bh=CT/1HMPUT53HmEKChyxZGARswmThq5lzs5y8d/XBXHo=;
	h=Date:From:To:Subject:Reply-To;
	b=XAHnxuPP+ZromO1rIoRh92m7ZWnro3D+4SLTfZePehV7kB6TMGIUkVMrYxX41PgoL
	 E9caiWehBlheUluMHMvdMZgXoyiRWdQicN+NKKYvS1YSAnCaqqKxMFGx6oN58+1Kqp
	 ALdDYm2EmRVZkZL8mISrR/CviVytRbqJS5mVAW8M=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--tBhgiDt8dP1efIIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


            hi,

I found nothing in the netfilter documentation and via google I found
only nat64 solutions for linux like:

        jool.mx
        tayga
        ecdysis

But I did not found any nat46 solution. Does somebody has an idea=20
for an stable working nat46 and nat64 solution?

        thx

            Ruben
   =20
--=20
Ruben Herold=20
ruben@insecure.pw

--tBhgiDt8dP1efIIJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlPByYkACgkQgHHssbUmOEIFHACeL5u/8hRbaH495sXr+zhGFz/k
72IAoNf2mBE5Jv9eYgLrjMdMe2NeHJx3
=V2Et
-----END PGP SIGNATURE-----

--tBhgiDt8dP1efIIJ--
