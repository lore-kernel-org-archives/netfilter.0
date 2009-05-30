From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Sat, 30 May 2009 18:49:55 +0200
Message-ID: <200905301849.58608.christoph.paasch@gmail.com>
References: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com> <alpine.DEB.2.00.0905301726540.31323@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1475370.CtB4nOey94";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=WmYnZbJtPpXh1HhZG6wKOtGJqr6Mz/b6u1VvnyKrSyM=;
        b=NVSEyBiW8OAI1P4DZFPLQnTnGqIJAJHI4/oaxKEvxAV2+5nLWNBryFRVrm4vQqNn9s
         qy2ubvKk1I6jfziNNGYzqwGMuPzjYq+ky2nT9h032td1hM/P/PmO5OM9kNVbp7xX7xyO
         riEMyp8OFlYPGwRXslRlb2NvHpB3jWrO57YGQ=
In-Reply-To: <alpine.DEB.2.00.0905301726540.31323@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, Saatvik Agarwal <saatvik.agarwal@stanford.edu>

--nextPart1475370.CtB4nOey94
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

one question about that:
How can the host receive the SYN packet (and afterwards send the RST), if=20
conntrack does not support TCP simultaneous open?

Thanks
Christoph

On Sat May 30 2009 wrote Jozsef Kadlecsik:
> [Back to your original mail.]
>
> Netfilter conntrack/NAT does *not* generate any kind of packet. If you see
> RST segments, those are then sent by the receiver of the SYN packet
> because there's no open socket yet.
>
> You can successfully build up simultaneous open connections only if you
> use good timings: both hosts send the initial SYNs *before* the SYN from
> the other side is delivered to them. Or, intentionally ignore (drop) the
> RST segments.
>
> Adding TCP simultaneous open support to netfilter conntrack is not hard
> but needs more testing before release.
>
> Best regards,
> Jozsef

=2D-
Christoph Paasch

www.rollerbulls.be
=2D-

--nextPart1475370.CtB4nOey94
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkohY7MACgkQLHtZTroOLZtvKwCfekLYCABcF+K5YyH5A6NulcUz
pJAAoJA3q0THXeSWRlF5iCxhPYcCUx66
=gBNm
-----END PGP SIGNATURE-----

--nextPart1475370.CtB4nOey94--
