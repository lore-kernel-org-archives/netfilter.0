From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Log Entries with multiple PROTO fields?
Date: Fri, 19 Mar 2004 14:40:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079700051.2417.4.camel@raylinux.internal>
References: <20040317141056.M19130@tkevans.com>
	 <1079698506.2346.4.camel@carve.personal.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-m3qPQ1qfclQl7BrguyF3"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079698506.2346.4.camel@carve.personal.localdomain>
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


--=-m3qPQ1qfclQl7BrguyF3
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-03-19 at 14:22, Tarek W. wrote:
> On Wed, 2004-03-17 at 16:10, Tim Evans wrote: [snipped]
> > What do these kind of log message mean?  Note there are two PROTO field=
s:
> >=20
> > Mar  8 08:19:43 kernel: IPT OUT_ICMP: IN=3D OUT=3Deth1 SRC=3Dx.x.x.xDST=
=3Dx.x.x.
> > .x LEN=3D76 TOS=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D54844 PROTO=3DICMP TYP=
E=3D11 CODE=3D0
> > [SRC=3Dx.x.x.x DST=3Dx.x.x.x LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D1 ID=
=3D0 DF PROTO=3DTCP
> > SPT=3D110 DPT=3D4312 WINDOW=3D5840 RES=3D0x00 ACK SYN URGP=3D0 ]
>=20
> this is an ICMP packet sent in response to the TCP packet which is
> detailed inside []

icmp TYPE=3D11 CODE=3D0 -- host unreachable(?)
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-m3qPQ1qfclQl7BrguyF3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAWupTh1fuR/Bv+ygRAmJVAJ9Gihl6jdDs7IIlAZVN70C+4luvHwCeOldQ
A1LSkomNc8yA+esZwgo9fI0=
=OMB5
-----END PGP SIGNATURE-----

--=-m3qPQ1qfclQl7BrguyF3--


