From: Lopsch <lopsch@lopsch.com>
Subject: Re: question about --tcp-flags
Date: Thu, 02 Dec 2004 23:34:13 +0100
Message-ID: <41AF9865.2090401@lopsch.com>
References: <41AF9255.4040408@lopsch.com>
	<20041202231155.GA6712@bender.817west.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature";
	boundary="------------enigF8B168CD75A97BE95E6FE2C5"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041202231155.GA6712@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF8B168CD75A97BE95E6FE2C5
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Jason Opperisano schrieb:
> i've seen this list pop up here and there:
>=20
>   http://www.stearns.org/modwall/sample/tcpchk-sample
>=20
> seems pretty complete to me.
>=20
> the most common ones you see people creating DROP rules for are:
>=20
>   ALL		ALL
>   ALL		NONE
>   SYN,FIN	SYN,FIN
>   ALL		FIN,URG,PSH
>   SYN,RST 	SYN,RST
>   FIN,RST 	FIN,RST
>   FIN,ACK 	FIN
>=20
> -j
>=20
> --
Thank=B4s will take look at that list :). But a last question. --syn is=20
the same as --tcp-flags ALL SYN?

--------------enigF8B168CD75A97BE95E6FE2C5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)

iQIVAwUBQa+YZSXe0Lt4Z4FpAQFygw//QrCfO8kglfH2SULTrTwfNY/wzjGD3EkO
ooYeq7Iyf+GN2dt0ANnZizXpbqRFNVsMCPdh2TXRcyHQSmSLJ2y4LFl3sjBL3wco
EjnmV7CdnPa+fpRab+VXibek5D+bAiUwProcKqTXLkb3ntt277dG9cAvt2lwmA6O
VmHAh9biRtCFheh2hdO47cnAFRjGb6QWS+bZN+PiF3Rb17pIlUZWIL5zlYbQUoLX
0vapiNe9eBTjZL+j4YFYNfmLPzUbIBcdbqxjgImnv3mBjCA925R90BstQa5eDP/S
CU8f1lAYUnQq8WdSSXP0mC2QQe9kv4Bz72WASO05EKWSINII3p8bx22wljzSbKL7
k6Fv5Tj3AratOQqE/+6PVwvSub0WxpXHPnDC4lpo8FXAFjZmLQErdSSPQC/077ZI
b5DISOGPIm8apWMUSaiINf9xRD7NjKEedAGb7coUrDrAw87QpsGv8sC9LX0K8FCA
4rq1o4JEVKXX8WGAVSbr3dlPIURJVli5Uws+TOPsq6iqduXWp+a7CDKPmXc51hx6
z/xLXOCeYDrr6IPn0cInbVnRBzMhnBq0OH1MjVxxmnzUo5rlKJ6VLJ3U0JFipMAU
phC16QgOCILrAfo1eMg9NKnETRPf1OXg4OfWY7ijLe2qpjZWiloj85lFzeWf7MSE
TT7QtE1HWoo=
=41y2
-----END PGP SIGNATURE-----

--------------enigF8B168CD75A97BE95E6FE2C5--


