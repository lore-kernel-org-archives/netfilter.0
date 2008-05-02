From: Diego Lacerda <diegolacerda@gmail.com>
Subject: RE: does -p udp --dport 5060 not work with -j LOG?
Date: Thu, 01 May 2008 21:45:09 -0300
Message-ID: <1209689109.6381.20.camel@localhost.localdomain>
References: <fvarov$iq2$1@ger.gmane.org>
	 <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com>
	 <fvdk6f$j6a$1@ger.gmane.org>  <05dd01c8abe6$7a65aa50$5000040a@skathlaptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-YCBPR41rsJkbqmo18lBU"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
        bh=Xd7FNxxSznnM3eBm8Uxt/X4RrVCJndKdsXCo6KHHhwk=;
        b=PVZe8+A+YQQ1jcYxedbXGeZQILg5+iZcFRrZiapyuWz5930y10Q2KXyhyrE85pinaoAT6508RmCPVIrAvD6eHnl9XHY40ptRYw1UoqFtg0eoAaXTUZ7bi3Nb2ZnHeBtCjbmZTd+Rm6gV/Fo3B56SiZpPnFgulUGufddrr1Fe7Iw=
In-Reply-To: <05dd01c8abe6$7a65aa50$5000040a@skathlaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Steven Kath <steven.kath@vyatta.com>
Cc: 'sean darcy' <seandarcy2@gmail.com>, netfilter@vger.kernel.org


--=-YCBPR41rsJkbqmo18lBU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Thu, 2008-05-01 at 16:53 -0700, Steven Kath wrote:
> >=20
> > There only one line in my script that uses SIP:
> >=20
> > grep SIP firewall-masq
> > $IPT -t nat -A PREROUTING -i external -p udp  --dport 5060 -j LOG
> > --log-prefix "SIP-BEFORE:  "
> >=20
> > And it's run first:
> >=20
> > sh -x firewall-masq
> > + IPT=3D/sbin/iptables
> > + /sbin/iptables -F
> > + /sbin/iptables -X
> > + /sbin/iptables -t nat -A PREROUTING -i external -p udp --dport 5060 -=
j
> > LOG --log-prefix 'SIP-BEFORE:  '
> > ...........
> >=20
> >=20
> > I don't really understand this output:
> >=20
> > iptables -L -n -v -t nat | grep SIP
> >      2   262 LOG        udp  --  *      *       0.0.0.0/0
> > 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE=
:
> > '
> >   144K   24M LOG        udp  --  *      *       0.0.0.0/0
> > 0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
> > 41816 5117K LOG        udp  --  external *       0.0.0.0/0
> > 0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
> >      0     0 LOG        udp  --  external *       0.0.0.0/0
> > 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE=
:
> > '
> >      0     0 LOG        udp  --  external *       0.0.0.0/0
> > 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE=
:
> > '
> ...
>=20
> It looks like your nat table isn't getting flushed. =20
>=20
> Have you tried running 'iptables -t nat -F' before firewall-masq or addin=
g
> that to the start of the script?

Yeah,

I think that you really need flush the NAT table before.
In this case you can see that the second and third rules in you NAT table a=
re logging every UDP packet (you can see that by first and second columns: =
packets/bytes).

Regards,

--=20
Diego Evaristo de Lacerda (diegolacerda@gmail.com)
Project Analyst
LPIC Level III & Redhat Certified Engineer & Cisco Certified Network
Associates

URL: conectado.motime.com

--=-YCBPR41rsJkbqmo18lBU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBIGmQOrWR2/j9WrhMRAn+vAJ9+i56lmL6+7zY09WVcY2GxYA5vDACgjY6l
ENqvWGS68WaajXwfldfLTB8=
=zMyL
-----END PGP SIGNATURE-----

--=-YCBPR41rsJkbqmo18lBU--

