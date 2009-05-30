From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Sat, 30 May 2009 21:58:57 +0200
Message-ID: <200905302159.09851.christoph.paasch@gmail.com>
References: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com> <200905301849.58608.christoph.paasch@gmail.com> <alpine.DEB.2.00.0905302005460.31469@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2178116.bEHQCPObFN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=mU54i7KcWXLDW5AY1/L56yj1pXg24d4oy3d1bzpF7L0=;
        b=vjdqljxeimak0I7hHddX9GPUbxnjeVvVdFK5SFvjpdZqoIQbZx4yq0g1l8rTiZ9OQE
         6mVBejQwR2YNesazJLBTsj0sgyQZnCPXJCghTlL1MjcfMjEmRHNso4T2vxARhvzdZWBR
         Fz1yK6wF0x0qoWNHecOP5duVyFzeh/L2REqfY=
In-Reply-To: <alpine.DEB.2.00.0905302005460.31469@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Saatvik Agarwal <saatvik.agarwal@stanford.edu>

--nextPart2178116.bEHQCPObFN
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hmm, I don't understand...

As both hosts are NATed, this would mean that the NAT would allow the SYN t=
o=20
pass (coming from the "Internet" going to the LAN).

But this is not possible, as no state has been created on this one of the t=
wo=20
NATs (the host hasn't sent out a SYN yet).

Can you explain me, what I'm missing here?

Thanks,
Christoph

On Sat May 30 2009 wrote Jozsef Kadlecsik:
> On Sat, 30 May 2009, Christoph Paasch wrote:
> > one question about that:
> > How can the host receive the SYN packet (and afterwards send the RST), =
if
> > conntrack does not support TCP simultaneous open?
>
> The first SYN (if the firewall rules allow it) are let through the
> firewall and will reach the destination. If that hasn't sent SYN yet, then
> it'll respond with RST, which will pass the firewall too.
>
> But running tcpdump on both interfaces of the firewall would help most.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary

=2D-
Christoph Paasch

www.rollerbulls.be
=2D-

--nextPart2178116.bEHQCPObFN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkohkAMACgkQLHtZTroOLZvP9ACfXQ4CuEymqQXCi/PMdS84aUnl
3HMAn0zeC84Fwq9QDNPOvCnkHow1JzXt
=NPak
-----END PGP SIGNATURE-----

--nextPart2178116.bEHQCPObFN--
