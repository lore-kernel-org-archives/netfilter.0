From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: lots of ACK/FIN filtering (DPT=80) at web server.
Date: 29 May 2003 11:30:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054200648.11165.26.camel@raylinux.internal>
References: <Sea1-F228m4ZQJXs7k40003ab30@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hsAi5wtOZd4XBkpbyRs3"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea1-F228m4ZQJXs7k40003ab30@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: SB CH <chulmin2@hotmail.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-hsAi5wtOZd4XBkpbyRs3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-05-29 at 11:17, SB CH wrote:
> Thanks for your kind reply.
>=20
> >Those are 'broken' browsers that do not follow the http standard
> >properly.
> which browers? Netscape or Opera? mostly use MSIE, right?
>=20
Just IE I think ...

>=20
> >Stop using non-standards complient browsers. Sometimes changes to
> >standards are not 'enhancements'.
> There are so lots of people which use different browser,=20
> then you mean that there is not any solution to solve this problem at=20
> iptables level?
>=20
Sure, just ACCEPT the ACK-FIN packets.

> =20
> Thanks for your reply.
>=20
>=20
>=20
> From: Ray Leach <raymondl@knowledgefactory.co.za>
> To: Netfilter Mailing List <netfilter@lists.netfilter.org>
> Subject: Re: lots of ACK/FIN filtering (DPT=3D80) at web server.
> Date: 29 May 2003 07:25:38 +0200
>=20
> Hi there
>=20
> On Wed, 2003-05-28 at 10:46, SB CH wrote:
>  > Hello, all.
>  >
>  > I have operated linux web server and executed iptables 1.2.8.
>  >
>  > and I have found so lots of logs like this ACK,FIN filtering.
>  > Surely, ACK-FIN is a connection closing step, so there is no problem f=
or
>  > customers but I would like to know why this happens!!
>  > I guess that the timeout of the connection tracking related.
>  >
> Those are 'broken' browsers that do not follow the http standard
> properly.
>  >
>  > May 25 12:33:05 www kernel: IN=3Deth0 OUT=3D SRC=3D210.126.xxx.xx
>  > DST=3D211.10.xx.xx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D3376=
 DF PROTO=3DTCP
>  > SPT=3D3608 DPT=3D80 WINDOW=3D63520 RES=3D0x00 ACK FIN URGP=3D0
>  >
>  > Do you have any problems like me?
> Yes
>=20
>  > and what's the problem and how can I solve this problem?
>  >
> Stop using non-standards complient browsers. Sometimes changes to
> standards are not 'enhancements'.
>=20
>  >
>  > Thanks in advance for your kind opinios!!
>  >
>  > _________________________________________________________________
>  > ?=95=EC=9D=B8?=98=EC=9E=90. ?=A4=EB=8A=98???=B4=EC=84=B8 =EB=AC=B4=EB=
=A3=8C ?=AC=EC=A3=BC, =EA=B6=81=ED=95=A9, ?=91=EB=AA=85, ?=84=EC=83=9D =EA=
=B0=80?=B4=EB=93=9C
>  > http://www.msn.co.kr/fortune/default.asp
> --
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --
> << signature.asc >>
>=20
> _________________________________________________________________
> =C1=F5=B1=C7 =C1=A4=BA=B8 =B0=A1=C0=E5 =BA=FC=B8=A3=B0=ED =C6=ED=C7=CF=B0=
=D4 =BA=B8=BD=C7 =BC=F6 =C0=D6=BD=C0=B4=CF=B4=D9. MSN =C1=F5=B1=C7/=C5=F5=
=C0=DA  =20
> http://www.msn.co.kr/stock/ =20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-hsAi5wtOZd4XBkpbyRs3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+1dNIh1fuR/Bv+ygRAh63AJ4/0eKS/AnjJCW+r7ZagwU4KAersACeNOtv
ondf8+tcnOLJz0fwVBaMYB8=
=5R31
-----END PGP SIGNATURE-----

--=-hsAi5wtOZd4XBkpbyRs3--


