From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: [expert] Two internet interfaces load balance
Date: 15 Apr 2003 16:55:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050418547.1441.108.camel@raylinux.internal>
References: <021001c3035d$8cb30450$6800817d@guilherme>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-JC6hJN1PiA0Dmko4pIo1"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <021001c3035d$8cb30450$6800817d@guilherme>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: *netfilter <netfilter@lists.netfilter.org>


--=-JC6hJN1PiA0Dmko4pIo1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Have a look at http://www.lartc.org/

On Tue, 2003-04-15 at 16:44, GBV wrote:
> Hi all,
>=20
> I=B4m using Debian 2.4.18, standing to compile 2.4.20 with advanced routi=
ng
> options..
>=20
> I have an ADSL 512/128 connection on eth0 and a dedicated optic fiber
> 256/256 on eth2 and my local interface is eth1.
>=20
> I need to load balance or at least use this two internet ifaces at the sa=
me
> time. When a bring the two interfaces up I, neither of them works... when=
 I
> switch this two ifaces there are DNS problems since this two ifaces uses
> different DNS servers..
>=20
>=20
> How can I use this two ifaces at the same time, without errors?
> What options should I enable in kernel configuration?
> And about the DNS?
>=20
> Can I do something like use eth2 just for published internet services, an=
d
> eth0 for normal internet access?
>=20
> What Tools I need and how to use then?
>=20
> Thanks...
>=20
> Guilherme B. Viebig
>=20
>  1. manipula=E7=E3o de rede maliciosa: tentativa bem sucedida ou n=E3o de=
 acessar
> informa=E7=F5es sigilosas, indisponibilizar servi=E7os, e qualquer tipo d=
e a=E7=E3o
> n=E3o documentada e fornecida pela vitima.
>=20


--=-JC6hJN1PiA0Dmko4pIo1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+nB1zh1fuR/Bv+ygRAgClAKCu7bkuK6G4CWczsakwUPZnllgbvQCeLNyb
B9Llq+3A/lwuoPA1VraOxm0=
=nMjd
-----END PGP SIGNATURE-----

--=-JC6hJN1PiA0Dmko4pIo1--


