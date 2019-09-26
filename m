From: Mikhail Morfikov <mmorfikov@gmail.com>
Subject: Re: How is nftables + IFB
Date: Thu, 26 Sep 2019 12:06:00 +0200
Message-ID: <6674530b-7a84-703d-315f-67ca7226a310@gmail.com>
References: <CALYzA8GZY1cJYsibQDOmA3DuUsV3d=KUdc6z04WgUxu-4Ya0jg@mail.gmail.com>
 <CAEzD07LBL8AQMJtOqB=OFTGnfPREFKnECJpqoiJDuJR7BFFGVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="dItcLxGZFzibVbRudN9rnhvJrNngbFUWK"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=4Rt47f7SEV5vgvif3bRX6++eE3ZjPFATT5mloOAQ4RU=;
        b=s5YjVyJfBnZhnwdzt5Gbu002uNfATGj9T4GUhsoZZhpQ+yWpjuTuiIrrLYuCSwTEs4
         9toMkAy9KcY0AKWk/4xDFsX1h7yGJqBIshkU3ODjYGpbmJC2Bb6tT3Z/wB5CkYG5d6C/
         2jXcsGD/PijHmXoze+C56IHGTzrV4wmzg2+DOa7ugx6J/2w2Z1rDR2ds0rQswDTZ6vkN
         abP+7VI5JGOom+Bne2qgdFYz6ZD1U0XYLO2OlENtN1KteenZ/rlLv+QQzw/5ms7CjCzm
         xb56TyNCxfGZcqlUgmyBZPeftEKVamcpPqJBVcMqlWF3jQRrnsRi9TLqzDXvGR3GHyMJ
         Y2og==
In-Reply-To: <CAEzD07LBL8AQMJtOqB=OFTGnfPREFKnECJpqoiJDuJR7BFFGVg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dItcLxGZFzibVbRudN9rnhvJrNngbFUWK
Content-Type: multipart/mixed; boundary="Y8jsKKgcvgVsv3HkjyHlS8cvg4SUapTHb";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org
Message-ID: <6674530b-7a84-703d-315f-67ca7226a310@gmail.com>
Subject: Re: How is nftables + IFB
References: <CALYzA8GZY1cJYsibQDOmA3DuUsV3d=KUdc6z04WgUxu-4Ya0jg@mail.gmail.com>
 <CAEzD07LBL8AQMJtOqB=OFTGnfPREFKnECJpqoiJDuJR7BFFGVg@mail.gmail.com>
In-Reply-To: <CAEzD07LBL8AQMJtOqB=OFTGnfPREFKnECJpqoiJDuJR7BFFGVg@mail.gmail.com>

--Y8jsKKgcvgVsv3HkjyHlS8cvg4SUapTHb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 25/09/2019 16:37, Anton Danilov wrote:
> Hi.
> How exactly do you use the iptables + IFB for traffic shaping?

I was using iptables + tc. I once described two working examples of
traffic shaping:
iptables + ifb[1]
iptables + imq[2]

The IMQ example needs a patched kernel, but it works a way better=20
than the IFB one especially in the case of ingress traffic. The
arts are in Polish, but you can look through the commands that were=20
used to get some basic idea how the mechanism works.



[1]: https://morfikov.github.io/post/konfiguracja-interfejsow-ifb-w-linux=
ie/
[2]: https://morfikov.github.io/post/konfiguracja-interfejsow-imq-w-linux=
ie/


--Y8jsKKgcvgVsv3HkjyHlS8cvg4SUapTHb--

--dItcLxGZFzibVbRudN9rnhvJrNngbFUWK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXYyNjwAKCRAy2ctjR5bM
oQ9NAQDgJLxSdXoLhqR+wY8tINu+VJh5vY1GQmv6DupEpzBpxwEAvEpA7XO++6SE
eg/YnUrwQjZXT6WnG8oZWIllMaMu9QI=
=UyNb
-----END PGP SIGNATURE-----

--dItcLxGZFzibVbRudN9rnhvJrNngbFUWK--
