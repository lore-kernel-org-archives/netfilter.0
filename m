From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Re: Multihoming : Dynamically decide interface, for sending packet
Date: Tue, 23 Apr 2013 00:58:46 +1000
Message-ID: <1366642726.6065.1.camel@donetsk.home.lusan.id.au>
References: <5174B544.70000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yXwKK2eXAA6mLqISEZGO"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
	s=default; t=1366642716;
	bh=0VxxVV/mizoQBYDqxfmE31qyVTdhGI7qFM8jD8KwZ4o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pVUqdFxQm2ZDmeIoGRlECbd6cpEah1m2RSFZpycqVWU9VLpCg52MRSZFnhpqhnyrV
	 6WeFW9MDeik8RQxKSyLLLCF3tkBoojqfezgEL5k4AdN9t4Zya1KMj81rp+u9BtFFYb
	 xTklRtTGFDrOUFviZXhZiDSgJDtNUaim3g3Gu9JmIuxrfUFpKSD7yqUw5suUgEkRh0
	 nZ28RRZxmNswEYD7lRX34QcZnTHSFWnWBw8qjhAjwQbTmU7/6Gtm0UkWtMxgSvKa0Y
	 PQooFN5TCIVeLN53+hQDyGiFwARb7dXJIsDrXfHHc6BdJNET65y/g5s9ctTb3Rr1FM
	 y3aeflGF1sJ7w==
In-Reply-To: <5174B544.70000@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: nakulgoud <nakulgoud@gmail.com>
Cc: netfilter@vger.kernel.org


--=-yXwKK2eXAA6mLqISEZGO
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-04-22 at 09:27 +0530, nakulgoud wrote:
> Hi,
>    I have a system with multiple interfaces. Based on some rule I want=
=20
> to dynamically decide the interface from which packet should be routed.=
=20
> Please help me how should I do this?
>    Thanks in anticipation.

Routing is not really an issue for iptables. You could however change
the outgoing interface of a packet in the MANGLE table, this might be
one solution to what you want. You should really be looking at policy
based routing with the "ip" too though.


--=20
Nikolai Lusan <nikolai@lusan.id.au>

--=-yXwKK2eXAA6mLqISEZGO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABCgAGBQJRdVAmAAoJEJOjmtAqHQSLyLMP/2oBDx2Z0WHRNIZ+CpIIt1zL
8D3qbcaP0nQepbOxP81C1adhbrCL9Dkdwph1wvxkzVLJbmgsLQDPKxmwFRPyimIW
hnN0fPAVqBCUFuEAgWdYJoNfm5Dr+iy0O3YgM4raR1EW3GLjOMd+awydi9sRq/C+
iDWkeahoDPfEhE7vFqv5P56X/e+Vzw5WfuB1oiq+r16BmpT0spIDDzPTKUnW/yGy
8C9YONixhfeQMsRBkWQLPcoKmmVHlRhRhyHrEl2j+tXo7sorN9nb/c+IM5kMRA8j
oh2yQQ+IGLiphqLKygLjCFW3Lk55gRWGPBu9/HVtEkY0Xnpza1jhtwNkQOtE68xr
D3u+ooPlM1D6GCju5SJHYCjnRdx978aa9wNHWqPFUnUNy33at7y7Hj7BySED9NqW
Ju8ip8QI4wI0LmGi1UpuSiF/bR3lch7lS8yJbRwbmtqK9iro3J892vPKn1/kXqgb
06XuP/hQ3UDbjTOQOuAMnoZw9dL10e9SYWph9Bn1wFBYRx9gOhW1pr/uFcXMi3th
UYBfErDfJkFJ/OVa/adeolX3eyKkkhcMs7ZNXNW13UzEdBEfTVe7sZc7aRphiwe/
hxZYNQ2QAnUEdT+NhixEaihMhudJqSs0V1rZ1BxZDuJfzogzI4FJbsNmY2NLwByO
OcmCIFSvcBxKN2PFU52v
=CzWt
-----END PGP SIGNATURE-----

--=-yXwKK2eXAA6mLqISEZGO--

