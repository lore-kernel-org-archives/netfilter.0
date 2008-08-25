From: Bram Metsch <metsch@ins.uni-bonn.de>
Subject: Re: Packages which should be DNATed are dropped incidentally
Date: Mon, 25 Aug 2008 09:13:04 +0200
Message-ID: <20080825091304.777d6e4e.metsch@ins.uni-bonn.de>
References: <20080822142507.db9f6ccf.metsch@ins.uni-bonn.de>
	<alpine.LNX.1.10.0808221003130.8475@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Aug_2008_09_13_04_+0200_QN=1ln4ZI1O_CeJL"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808221003130.8475@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Signature=_Mon__25_Aug_2008_09_13_04_+0200_QN=1ln4ZI1O_CeJL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Aug 2008 10:05:09 -0400 (EDT)
Jan Engelhardt <jengelh@medozas.de> wrote:

> [..]
>=20
> Try adding iptables -t nat -A PREROUTING -j LOG --log-prefix "[this did n=
ot get nated]"
> and compare with the DROP IN=3D... line when they appear together.
> >
> [..

Hi,

I have now added three logging rules: The first one -as you suggessted- as =
last
rule of the PREROUTING chain and two additional logging rules quite at the =
beginning of the=20
INPUT chain:


Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
 380K   57M accounting_in  all  --  *      *       0.0.0.0/0            0.0=
.0.0/0
 380K   57M blacklist_src  all  --  *      *       0.0.0.0/0            0.0=
.0.0/0
  820 53788 LOG        tcp  --  external *       0.0.0.0/0            <exte=
rnal mailserver IP>      LOG flags 0 level 4 prefix `[not nated]'
 256K   41M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0=
/0           state RELATED,ESTABLISHED
  820 53788 LOG        tcp  --  external *       0.0.0.0/0            <exte=
rnal mailserver IP>      LOG flags 0 level 4 prefix `[not nated nor establi=
shed]'

Now I can confirm that the packets in question are indeed caught by the INP=
UT chain, i.e.=20
they show up in both logging rules in this chain. However, they do not show=
 up in the logging
rule inside the PREROUTING chain, so I assume they do not even pass this ch=
ain?

Best regards,

Bram.

--Signature=_Mon__25_Aug_2008_09_13_04_+0200_QN=1ln4ZI1O_CeJL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIsluDUX8v1gQDM/4RAh/PAJ0ZhcTakBUlafOftUHJZNdzuTgg7QCfWwi6
Wp83VjkgWHAGWyPwOeay+j8=
=BvwJ
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Aug_2008_09_13_04_+0200_QN=1ln4ZI1O_CeJL--
