From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Module for Oracle with NAT
Date: 05 Mar 2003 19:09:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046884146.2096.31.camel@raylinux.internal>
References: <3e660b98.769a.0@unacs.bg>
	 <008e01c2e32a$f302e520$99e0e20a@int.tp.com.pe>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Lp5cfpFYXkvqEziJwH9X"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008e01c2e32a$f302e520$99e0e20a@int.tp.com.pe>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-Lp5cfpFYXkvqEziJwH9X
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

In Oracle 9i you can make the server and listener use specific ports.
AFAIR if you do not use shared servers then you can use standard NAT.

We have our Oracle machine behind our firewall and we have people from
Cape Town (the other end of the country) accessing it perfectly.

There are some notes from Metalink with regards to Oracle and NAT.

Ray

On Wed, 2003-03-05 at 17:21, Newton wrote:
> Hi,
>=20
> Friends Do you know if are there any module of kernel to work Oracle with
> NAT ,????
>=20
> Newton.
>=20
>=20
> ----- Original Message -----
> From: <nedco@unacs.bg>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, March 05, 2003 9:37 AM
> Subject: iptables dropping wrong packets
>=20
>=20
> >
> >
> >
> > Hi,
> >
> > looks like some of correct packes are droped
> >
> > Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> > num   pkts bytes target     prot opt in     out     source
> destination
> >
> > 1    36142   16M ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
> >          TOS
> > match 0x00
> > 2     168K   54M ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
> >          TOS
> > match 0x10
> > 3       27  1782 LOG        all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
> >          LOG
> > flags 0 level 4
> > 4       27  1782 DROP       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
> >
> >
> >
> > in log we can see that TOS of packets is 0x0 they are also packets with
> 0x10
> >
> >
> >
> > Mar  5 04:32:10 proliant kernel: IN=3Deth0 OUT=3Deth1 SRC=3D62.176.73.4
> DST=3D62.176.105.30
> > LEN=3D76
> > TOS=3D0x00 PREC=3D0xC0
> > Mar  5 04:32:15 proliant kernel: IN=3Deth0 OUT=3Deth1 SRC=3D62.176.73.4
> DST=3D62.176.105.30
> > LEN=3D76
> > TOS=3D0x00 PREC=3D0xC0
> > Mar  5 04:32:18 proliant kernel: IN=3Deth1 OUT=3Deth0 SRC=3D212.5.149.2=
52
> DST=3D212.5.134.3
> > LEN=3D87
> > TOS=3D0x00 PREC=3D0xC0
> > Mar  5 04:32:19 proliant kernel: IN=3Deth0 OUT=3Deth2 SRC=3D62.176.73.4
> DST=3D62.176.106.69
> > LEN=3D88
> > TOS=3D0x00 PREC=3D0xC0
> > Mar  5 04:32:19 proliant kernel: IN=3Deth0 OUT=3Deth1 SRC=3D62.176.73.4
> DST=3D62.176.105.30
> > LEN=3D76
> > TOS=3D0x00 PREC=3D0xC0
> > Mar  5 04:32:29 proliant kernel: IN=3Deth0 OUT=3Deth2 SRC=3D195.230.9.1=
59
> DST=3D62.176.106.69
> > LEN=3D48
> > TOS=3D0x00 PREC=3D0x8
> > Mar  5 04:32:31 proliant kernel: IN=3Deth0 OUT=3Deth1 SRC=3D62.176.73.4
> DST=3D62.176.105.30
> > LEN=3D76
> > TOS=3D0x00 PREC=3D0xC0
> > Mar  5 04:32:32 proliant kernel: IN=3Deth0 OUT=3Deth2 SRC=3D195.230.9.1=
59
> DST=3D62.176.106.69
> > LEN=3D48
> > TOS=3D0x00 PREC=3D0x8
> >
> > Am I doing something wrong?
> >
> > 10x in advance
> > Nedko
--=20

--=-Lp5cfpFYXkvqEziJwH9X
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+Zi8yh1fuR/Bv+ygRAkHQAJ0UIG6gFhwqmx+UY0uMClxlFXBHJACghMrp
6Wu8MLr+UMGNKsZPICFbbcA=
=rqZB
-----END PGP SIGNATURE-----

--=-Lp5cfpFYXkvqEziJwH9X--


