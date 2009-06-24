From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 13:47:38 +0200
Message-ID: <200906241347.41841.christoph.paasch@gmail.com>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt> <200906241320.13779.christoph.paasch@gmail.com> <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2831942.hSP3tpEKsW";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=/cGArx5OO5o71OO6+tct2GlKikI4W594KAcZ2KX933w=;
        b=ec+PEXoXZP1I0yhoYiiUvbb9gx50XAjUQ+8E4aSW3HblzPbyGJWZcnfhihSKc7rZ+n
         fhL9k/UKq2JC88V/kYO2020IRNV7qH9hZk8LDd43F2eIO6p48hYW30o9aqcfnDdquCcY
         SL/HgkyStnDB24iCBVru8QJ400Bi+Qb036lao=
In-Reply-To: <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Jorge Bastos <mysql.jorge@decimal.pt>, Rob Sterenborg <rob@sterenborg.info>

--nextPart2831942.hSP3tpEKsW
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


On Wed June 24 2009 wrote Jorge Bastos:
> > On Wed June 24 2009 wrote Rob Sterenborg:
> >> $ipt -P FORWARD DROP
> >> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> >> $ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT
> >
> > Watch out, that with these rules, you will allow any traffic to pass,
> > that has
> > destination port 22. Thus, the outside can contact you to port 22. And
> > the inside can contact any host on the Internet on port 22.
>
> No good then, i just want to allow traffic for ports defined by me, for
> the NAT'd machines.
>
> Can you guys help on this? Sorry but i really have no idea, with the
> PREROUTING it was easy for me.
You can add -i and -o to specify the incoming and outgoing interface to=20
distinguish from the Internet and the LAN-side.

=2D-
Christoph Paasch

www.rollerbulls.be
=2D-

--nextPart2831942.hSP3tpEKsW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpCElsACgkQLHtZTroOLZsh0wCfXbQkRpSpw36MNMjlAen9qYIz
CcYAnAxPp9VVsb5NBzBs/xTiXZ1sZ8YA
=KT2G
-----END PGP SIGNATURE-----

--nextPart2831942.hSP3tpEKsW--
