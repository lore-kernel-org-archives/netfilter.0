From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: verifying set-mark
Date: Fri, 22 Feb 2008 15:44:22 -0600
Message-ID: <1203716662.27608.48.camel@grateful.d.umn.edu>
References: <11716099.121203713596498.JavaMail.root@tomcat.phantombsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TN8ylFFdoi6ixxKkGVQC"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <11716099.121203713596498.JavaMail.root@tomcat.phantombsd.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Casey Scott <casey@phantombsd.org>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org


--=-TN8ylFFdoi6ixxKkGVQC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Fri, 2008-02-22 at 12:53 -0800, Casey Scott wrote:
> Good suggestion. Tried just tried that. Traffic gets logged, but=20
> the mark is not set. E.g. (from dump)
>=20
> Feb 22 12:50:52 tomcat kernel: IN=3D OUT=3Deth0 SRC=3D66.93.87.2=20
> DST=3D192.168.1.7 LEN=3D1500 TOS=3D0x00 PREC=3D0x20 TTL=3D54 ID=3D4397=20
> DF PROTO=3DTCP SPT=3D80 DPT=3D4322 WINDOW=3D17520 RES=3D0x00 ACK URGP=3D0
>=20
> Feb 22 12:50:52 tomcat kernel: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.1.7=20
> DST=3D66.93.87.2 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D18031 DF=20
> PROTO=3DTCP SPT=3D4322 DPT=3D80 WINDOW=3D64240 RES=3D0x00 ACK URGP=3D0
>=20
> Feb 22 12:50:52 tomcat kernel: IN=3D OUT=3Deth0 SRC=3D66.93.87.2=20
> DST=3D192.168.1.7 LEN=3D1500 TOS=3D0x00 PREC=3D0x20 TTL=3D54 ID=3D4398=20
> DF PROTO=3DTCP SPT=3D80 DPT=3D4322 WINDOW=3D17520 RES=3D0x00 ACK URGP=3D0
>=20
>=20
> Notice all the TOS is still 0x00. I am setting marks to 3 or 4=20
> depending on traffic type.

AFAIK, setting TOS is not the same as marking. [goes to check]
The man page confirms that.

> Casey
>=20
> ----- "Rob Sterenborg" <rob@sterenborg.info> wrote:
>=20
> > > How can I detemine whether or not a iptables set-mark operation
> > > is working? iptables -t mangle -nvL shows packets matching the
> > > rules with the set-mark. However, with a tcpdump -vvv -i
> > > <interface>
> > > I can not see the mark. I am looking at the tos field, and I
> > > don't see a tos field matching the marks I am trying to set.
> >=20
> > Did you try to match the mark in a subsequent rule and LOG the packet
> > when the rule hits?
> > See also man iptables:
> >=20
> > mark
> > This module matches the netfilter mark field associated with a packet
> > (which can be set using the  MARK  target below).
> > --mark value[/mask] Matches packets with the given unsigned mark value
> > (if a mask is specified, this is logically ANDed with the mask before
> > the comparison).
> >=20
> >=20
> > Grts,
> > Rob
> >=20
> >=20
> > -
> > To unsubscribe from this list: send the line "unsubscribe netfilter"
> > in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-TN8ylFFdoi6ixxKkGVQC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHv0I2U+eIf4TiLaIRAiyoAKDMsrVJB0uCq2Ing5THmDZzFsLhPgCgkw7o
qskl1kTf54d8s1ucKSIPfbw=
=tsP0
-----END PGP SIGNATURE-----

--=-TN8ylFFdoi6ixxKkGVQC--

