From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: FW: SMTP
Date: 22 Jan 2003 14:42:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043239336.1539.154.camel@rayw.knowledgefactory.co.za>
References: <NEBBICCJKLGJHMMNBPIKAEJFEDAA.sbisgaard@xtrasource.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-C8/YHV/Bn4c9n0zwIeT7"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEBBICCJKLGJHMMNBPIKAEJFEDAA.sbisgaard@xtrasource.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Steffen Bisgaard <sbisgaard@xtrasource.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-C8/YHV/Bn4c9n0zwIeT7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

try /var/log/firewall

On Wed, 2003-01-22 at 14:33, Steffen Bisgaard wrote:
> Hallo again everybody,
>=20
> Still struggling with this. Can somebody point out to me where I might fi=
nd
> a log file of iptables in order to troubleshoot this?
> Many thanks in advance.
>=20
> -----Original Message-----
> From: Steffen Bisgaard [mailto:sbisgaard@xtrasource.com]
> Sent: Tuesday, January 21, 2003 4:25 PM
> To: netfilter@lists.netfilter.org
> Subject: SMTP
>=20
>=20
> Hallo all,
>=20
> Can anybody tell me why the following doesn't allow me to send and receiv=
e
> email?
>=20
> # POP server (110)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
> --source-port $UNPRIVPORTS \
> -d $IPADDR --destination-port 110 -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
> -s $IPADDR --source-port 110 \
> --destination-port $UNPRIVPORTS -j ACCEPT
> # POP client (110)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
> --source-port 110 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> --destination-port 110 -j ACCEPT
>=20
>=20
> # ------------------------------------------------------------------
> # SMTP server (25)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
> --source-port $UNPRIVPORTS \
> -d $IPADDR --destination-port 25 -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
> -s $IPADDR --source-port 25 \
> --destination-port $UNPRIVPORTS -j ACCEPT
> #
> #
> #
> # ------------------------------------------------------------------
> # SMTP client (25)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
> --source-port 25 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> --destination-port 25 -j ACCEPT
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/

--=-C8/YHV/Bn4c9n0zwIeT7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+LpGoh1fuR/Bv+ygRAjlIAKC2pVb1Z3aD+tVJ3H7Fx5cmBwsgvgCeO3Yi
Zgpwa6bEH8kIA2VP8NlSRok=
=yUJZ
-----END PGP SIGNATURE-----

--=-C8/YHV/Bn4c9n0zwIeT7--


