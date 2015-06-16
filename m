From: spaceman <spaceman@antispaceman.com>
Subject: Re: Using iptables to send local traffic to proxy
Date: Tue, 16 Jun 2015 15:37:45 +0100
Message-ID: <20150616143745.GA1679@home.antispaceman.local>
References: <20150602165933.Horde.OYlnRWEwhY5VbcTVsieGKGA@webmailnew.dds.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antispaceman.com;
	s=default; t=1434465482;
	bh=+KeHlT+1oSm88k0H3nxA773+Vhn5EZnD+KedzlhXw6E=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=H/3VxqE5pZ/EGAJtmJ5cePIbAlW5eDbrOYLhtQvR8plzhguf7Ir4+JMK/Oxy3syK8
	 Nzg443cUdgdUwJAXKvU+Y/mHr4+qLt1NfxDyMw+kdlhxcAZvqOnHAgoBY77MGEJKUO
	 FPyNjt7QhUYzPr5k6x3dOQjSsv0SdelgZcYC6QLemBDMfnzu4giuVvebttUlv128EA
	 gw8K45+pQX92VvxmJuhB27WohmbHPd+JF3dLxOmv4dRfNR9FTstDVRlzuqS4BEX7WO
	 n4ymC/3FDJYGmWeIENE2BxzGTfd0BL37KZEiLz0DbawZ9eZs5Y1a/FeWF0R8G6FJCC
	 JUqIaO/is/p9w==
Content-Disposition: inline
In-Reply-To: <20150602165933.Horde.OYlnRWEwhY5VbcTVsieGKGA@webmailnew.dds.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

You need to make sure that traffic from the proxy isn't getting caught in y=
our=20
intercept rules and therefore talking to itself.

The first method listed here has nearly always works for me:
http://www.tldp.org/HOWTO/TransparentProxy-6.html
You will need to update accordingly with the correct sockets. You shouldn't=
=20
need to touch routing and routing traffic to the proxy will not work becaus=
e=20
the TCP headers will be incorrect and the packets will probably be dropped =
by=20
your firewall.

Might I suggest you direct your question at the squid mailling list if you=
=20
haven't already done so.

Regards,
spaceman

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJVgDS2AAoJEC6j1Ej4eZygmVEP/Ay39IQvTCV8u1SQGblWNR1y
Mivvc9+ZUA957Dg8fCVX4JJDJXtEGdLYVLW63fhuKlm9lqXqLJ09PE5rBhSQxD+a
lDXxJr/gY2zqoclNMUl+2XRwgYoiRHNnrsXPXCx8Am/f2NrcUM5TBHj/MnMdhrGI
0kQGKNdBZH5kHgCpjAmeD0lX1RtN12nQ9bh+44Sgi3VFWEhWTf9ARoJmhu6m2IQQ
rv50ssDo7mofy37QzAqF62EZoqHQd8L4Q88anlvyu8bEqz4+CLDhngCcmxTW08Fi
a5q1pO4wtAT5KkON89uPTGW3UqQu+Y2z82e9L2Atkzjc3Q57b2EkqLZBdjB50Y38
KAsVe/HjvavSLh/8Mwl2drAcOo9GqsIgGpt/pI53KQ1cSa0OfA483Un9dhF0Bexs
ENliGSGbWkQIORgZhzyTEpByn/9bGFWM9qC798NFREcrhsjyhgs+RPG1WKOCQvi5
XQQsq4cc0Pu406kZcEdXtxJHy8IEasyfrdIeaO0ZFwAj2GKyzuOMAFRCaEMP3oYA
BcPBW3ZegFwNCg3KNtL/IbTRSCAHPnp4OtUBqIhu3EPej0orIUelLl3jy/OvFCg0
smpGVYiVbGHZVr5Sfl02pOcuPq8pl0dD7n3BUCXP/8BEeReOaxDTF65r4tFzyzmq
met9ISrRKwqfS0Y1gpU5
=zi9n
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
