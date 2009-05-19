From: Christoph Paasch <christoph.paasch@student.uclouvain.be>
Subject: Re: Ebtables ruleset isn't working, any ideas?
Date: Tue, 19 May 2009 21:16:56 +0200
Message-ID: <200905192116.59322.christoph.paasch@student.uclouvain.be>
References: <740443.89728.qm@web44813.mail.sp1.yahoo.com> <alpine.DEB.2.00.0905192100250.8786@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6684745.g1b3FgdiWi";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0905192100250.8786@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Miguel Ghobangieno <mikeeusa@yahoo.com>

--nextPart6684745.g1b3FgdiWi
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hmmm... His rules won't match as the packets are dropped due to the default=
=20
policy of the chain.

Just add at the end of your rules a log target for all who passed the "ACCE=
PT"=20
rules.

Do you have nat employed on your firewall? (because you have 192.* IP=20
addresses)

On Tue May 19 2009 wrote Jozsef Kadlecsik:
> On Tue, 19 May 2009, Miguel Ghobangieno wrote:
> > I'm trying to make a bridge firewall that allows ssh in, and allows
> > http/https out, but nothing else... ebtable ruleset isn't working Sad
> >
> > This is what I have so far. When I set the default policy to allow
> > everything gets through, when deny nothing gets through:
>
> [...]
>
> Why don't you add log watchers to every of your rules as the last "match"?
> Thus you could see at least which rules match. Your rules seem to be OK
> but with logging enabled that'd be definitely answered. Without more
> information, nobody could help you.
>
> [And don't spam mailing lists like openssl-users which has nothing to do
> with ebtables, even if you are desperate.]
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

=2D-
Christoph Paasch

=C9cole Polytechnique de Louvain
D=E9partement d'ing=E9nierie informatique

www.rollerbulls.be
=2D-

--nextPart6684745.g1b3FgdiWi
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkoTBagACgkQLHtZTroOLZtslgCfTG0Zh3OwmjCsXnU9DmF8EOR0
ZG8AnjcXtRu9p5OEDNWG2IzuOsq87f7G
=d9My
-----END PGP SIGNATURE-----

--nextPart6684745.g1b3FgdiWi--
