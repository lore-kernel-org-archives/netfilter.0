From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: problem with DNS server behind nat/packet filter
Date: 09 May 2003 14:06:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052481992.1680.141.camel@raylinux.internal>
References: <20030509114520.1789.qmail@zero.sukkonet.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-jShJmDrkR9mdWNOv+aSD"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030509114520.1789.qmail@zero.sukkonet.it>
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


--=-jShJmDrkR9mdWNOv+aSD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Maybe you have a PREROUTING rule that is rewriting the source ip to the
internal ip instead of the external ip.


On Fri, 2003-05-09 at 13:45, enjoy.the.silence@iol.it wrote:
> hi,
> i've been an user of netfilter/iptables for a short time, and it's always=
=20
> worked great for me, doing NAT and packet filtering exactly as it should=20
> (thanx a lot to who wrote the NAT-HOWTO although :D). anyway, i'm=20
> experiencing some strange behaviour:=20
>=20
> i have a DNATting rule as the following:
> iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP=20
>=20
> where EXTIF (ppp0 - yeah, dialup) and EXTIP (dynamically assigned but=20
> correctly detected) are properly set. recently i have set up a DNS server=
,=20
> and i wish it was accessible from the outside. i have used djbdns, and se=
t=20
> it up correctly. actually the requests are received and processed, but th=
e=20
> outgoing packets with the replies are blocked by my packet filter. i have=
=20
> the following log from dmesg:
> IN=3D OUT=3Dppp0 SRC=3D10.0.6.5 DST=3D80.116.131.210 LEN=3D68 TOS=3D0x00 =
PREC=3D0x00=20
> TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D53 DPT=3D4538 LEN=3D48=20
>=20
> 10.0.6.5 is the ip which djbdns is running on, and 80... is the ip who ma=
de=20
> the request. what is strange is that the packet was trying to go out with=
=20
> the internal ip! is this normal? it's been blocked because i have a rule:
> iptables -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it=20
>=20
> shouldn't the packet's source address have already been changed at this=20
> time? what am i doing wrong? may it be because it's using the UDP protoco=
l?=20
> my natting rule should work with all protocols though...=20
>=20
> help me!
> thanks in advance!
> Giorgio=20
>=20
>=20

--=-jShJmDrkR9mdWNOv+aSD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+u5nIh1fuR/Bv+ygRArW1AKC557nonTOyfWJLfwdq/keuhW/83QCfWDjE
ZUpb215mZ3ZaT7oIHJz/Q6c=
=Ndrg
-----END PGP SIGNATURE-----

--=-jShJmDrkR9mdWNOv+aSD--


