From: Eric Leblond <eric@regit.org>
Subject: Re: Public Webserver behind IPtables Router
Date: 18 Jul 2003 23:50:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058565010.18859.5.camel@porky>
References: <001c01c34d75$51848ea0$5001a8c0@linux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Dq3JH+cN+ZJnTwMIrBoi"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001c01c34d75$51848ea0$5001a8c0@linux>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-Dq3JH+cN+ZJnTwMIrBoi
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le ven 18/07/2003 =E0 23:41, thomas krause a =E9crit :
> Hello , i tried to set up an IPTables Router for my Webserver. All
> hosts have has an official IP Adress. The eth0 of the Router is in =20
> iptables -P FORWARD DROP
> iptables -A FORWARD -s 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT
> =20
> iptables -P OUTPUT ALLOW
> =20
> Will this work ? O.K. Iam a Newbie but i will learn !

No, you just authorize packet to port 80 and what happened to return
packet to have this working you have to add a rules using STATE, ie
accept all packet of the connection (and in particular response packet)
:
	iptables -P FORWARD DROP
	iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
	iptables -A FORWARD -s 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT
BR,
=20
--=20
Eric Leblond <eric@regit.org>

--=-Dq3JH+cN+ZJnTwMIrBoi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/GGuSnxA7CdMWjzIRAnoQAJ47rWf2ovDuUyFmF0yUaHIyjGdKwQCfaAKb
rPkxCIJW8c0rmn02DdkHMuY=
=PXQj
-----END PGP SIGNATURE-----

--=-Dq3JH+cN+ZJnTwMIrBoi--

