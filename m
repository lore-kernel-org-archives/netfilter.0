From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: How to account traffic in IPTABLES?
Date: 07 Apr 2003 18:34:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049733245.4867.13.camel@raylinux.internal>
References: <20030330134802.CF9351C462B39@sm204.163.com>
	 <3E887685.9070000@videotron.ca>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-0+ApqUUixHwm8LZqr8w7"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E887685.9070000@videotron.ca>
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


--=-0+ApqUUixHwm8LZqr8w7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Create an accounting chain:

IPTABLES=3D/sbin/iptables

### accounting chain
$IPTABLES -N accounting
$IPTABLES -A accounting -i eth0 -d $IP_INT_MAIL -j RETURN
$IPTABLES -A accounting -o eth0 -s $IP_INT_MAIL -j RETURN
$IPTABLES -A accounting -i eth0 -d $IP_INT_WEB7 -j RETURN
$IPTABLES -A accounting -o eth0 -s $IP_INT_WEB7 -j RETURN
$IPTABLES -A accounting -i eth0 -d $IP_INT_WEB1 -j RETURN
$IPTABLES -A accounting -o eth0 -s $IP_INT_WEB1 -j RETURN
$IPTABLES -A accounting -i eth0 -d $IP_INT_WEB3 -j RETURN
$IPTABLES -A accounting -o eth0 -s $IP_INT_WEB3 -j RETURN
$IPTABLES -A accounting -i eth0 -d $IP_INT_WEB4 -j RETURN
$IPTABLES -A accounting -o eth0 -s $IP_INT_WEB4 -j RETURN
$IPTABLES -A accounting -i eth0 -d $IP_INT_ORA2 -j RETURN
$IPTABLES -A accounting -o eth0 -s $IP_INT_ORA2 -j RETURN
$IPTABLES -A accounting -i eth2 -s $NET_INT -d ! $NET_DMZ -j RETURN
$IPTABLES -A accounting -o eth2 -s ! $NET_DMZ -d $NET_INT -j RETURN
$IPTABLES -A INPUT -j accounting
$IPTABLES -A FORWARD -j accounting
$IPTABLES -A OUTPUT -j accounting

Then to see the traffic use:
/sbin/iptables -nvL accounting


On Mon, 2003-03-31 at 19:10, Stephane Ouellette wrote:
> Bobo wrote:
>=20
> > HI
> >
> >      I use the iptables + squid as the gateway of one LAN,and it is ver=
y good in fact.
> >
> >   Now,I would like to get the traffic accounting of each IP of the LAN.
> >
> >  How to get these data ? Does IPtables contain these data?
> > =20
> >
>=20
> try this one:
>=20
> iptables -nvL INPUT
>=20
> >  Are there some tools for traffic accounting of iptables?
> > =20
> >
>=20
> The iptables command itself !!!
>=20
> >  I could use perl and shell programing.Could I analyze the log file of =
iptables to account?
> > =20
> >
>=20
> in Perl:
>=20
> open(CHAINS, "iptables -nvL INPUT|") or die "Error reading chains\n";
>=20
> while(<CHAINS>)
> {
> # read the lines one by one, matching on the text you want
> }
>=20
> close(CHAINS);
>=20
> >  Thanks
> >
> >
> >
> >
> >
> > =20
> >
>=20
>=20
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
(  http://www.mapnet.co.za/            )
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


--=-0+ApqUUixHwm8LZqr8w7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+kah9h1fuR/Bv+ygRAjHaAJwLIIA8LMuSIblK7aMYXzImuNEoQwCffNrq
VdZG8wDa1lRf+ktRk9U5+uk=
=svO7
-----END PGP SIGNATURE-----

--=-0+ApqUUixHwm8LZqr8w7--


