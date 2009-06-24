From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 13:20:10 +0200
Message-ID: <200906241320.13779.christoph.paasch@gmail.com>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt> <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt> <001d01c9f4ba$316a3c30$943eb490$@info>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1926532.7QlATTEuJR";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=yi1MGunSaZsu1YUqOW1kdIc1K4nctU8ec9+TZ3ronFM=;
        b=svlcjzBCwZDFRrBHzx0GRQHqvQ0ejyTbibwU2Ixzv7NKmNWJshalpR6aW2AZHxsVZ8
         t/iXM7g05HBub82L8Sv4a8C1R3CcG3PS7+IPhsu+2GoCTwcGP+T0geH+tKgfDzPWUpQI
         3g1lKlrPRWU4FMCA5vADFCf8TzmmkQtzmznds=
In-Reply-To: <001d01c9f4ba$316a3c30$943eb490$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@vger.kernel.org

--nextPart1926532.7QlATTEuJR
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed June 24 2009 wrote Rob Sterenborg:
> $ipt -P FORWARD DROP
> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> $ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT
Watch out, that with these rules, you will allow any traffic to pass, that =
has=20
destination port 22. Thus, the outside can contact you to port 22. And the=
=20
inside can contact any host on the Internet on port 22.

Best regards,
=2D-
Christoph Paasch

www.rollerbulls.be
=2D-

--nextPart1926532.7QlATTEuJR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpCC+oACgkQLHtZTroOLZvc4ACgmdobMA16QfAtjNnUDGS7PkHA
loQAoJx6HGnuqG81tVS9GOweD0QJpHl1
=+est
-----END PGP SIGNATURE-----

--nextPart1926532.7QlATTEuJR--
