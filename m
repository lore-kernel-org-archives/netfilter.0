From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: portfw on iptables 2.4 kernel problem.
Date: 11 Dec 2002 08:20:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039587605.1714.131.camel@rayw.knowledgefactory.co.za>
References: <Pine.LNX.4.33.0212101216060.9625-100000@blackhole.kfki.hu>
	 <00d301c2a0db$c8c2b240$0b00000a@nocpc3>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-e+yVm/H8wvFFA09ZevEQ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d301c2a0db$c8c2b240$0b00000a@nocpc3>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: louie miranda <lmiranda@chikka.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-e+yVm/H8wvFFA09ZevEQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Here are the rules I use for ftp outbound from my internal network :

IPTABLES=3D"/usr/sbin/iptables"
NET_INT=3D"10.0.0.0/24"
IFACE_INET=3D"eth0"
IFACE_INT=3D"eth2"
IFACE_DMZ=3D"eth1"
IFACE_LOC=3D"lo"
$ip=3D"10.0.0.67"		# My workstation ip

$IPTABLES -A FORWARD -i $IFACE_INT -p tcp --dport 20:21 -s $ip -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
        $IPTABLES -A FORWARD -i $IFACE_INT -p tcp --dport 1024: -s $ip
-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
        $IPTABLES -A FORWARD -i $IFACE_INT -p udp --dport 1024: -s $ip
-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i $IFACE_INET -p tcp --sport 20:21 -d $ip -m state
--state ESTABLISHED,RELATED -j ACCEPT
        $IPTABLES -A FORWARD -i $IFACE_INET -p tcp --sport 1024: -d $ip
-m state --state ESTABLISHED,RELATED -j ACCEPT
        $IPTABLES -A FORWARD -i $IFACE_INET -p udp --sport 1024: -d $ip
-m state --state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -o $IFACE_INET -p tcp --dport 20:21 -s
$ip -j SNAT --to-source $IP_INET
        $IPTABLES -t nat -A POSTROUTING -o $IFACE_INET -p tcp --dport
1024: -s $ip -j SNAT --to-source $IP_INET

Enjoy!

Ray

On Wed, 2002-12-11 at 08:08, louie miranda wrote:
> Hi, thanks for all your replies, etc. But my problem is not yet solved. I
> dont know why?!
> Can someone give me how did they did it?
>=20
>=20
>=20
> --
> thanks,
> louie miranda
>=20
>=20
> ----- Original Message -----
> From: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
> To: "Raymond Leach" <raymondl@knowledgefactory.co.za>
> Cc: <rsterenborg@xs4all.nl>; "'Paulo Andre'" <pandre@darkstar.nom.za>;
> "'louie miranda'" <lmiranda@chikka.com>; "'netfilter'"
> <netfilter@lists.netfilter.org>
> Sent: Tuesday, December 10, 2002 7:22 PM
> Subject: RE: portfw on iptables 2.4 kernel problem.
>=20
>=20
> > On 10 Dec 2002, Raymond Leach wrote:
> >
> > > Yes, you do. Port 20 (and/or any other) connections after the control
> > > connection are not 'RELATED, ESTABLISHED' to the control connection.
> > > They are new connections either from the client to the server or vice
> > > versa. You therefore need seperate rules for them.
> >
> > If we are speaking about the data channels of the supported protocols
> > (FTP, IRC and all the other protocols from p-o-m), then this is absolut=
ely
> > false.
> >
> > > Remember connection tracking happens at a pakcet level, i.e all state=
s
> > > relate to packets of a connection, not per protocol.
> >
> > In the case of the supported protocols with additional channels, again,
> > untrue. Please do no spread false info! Why would then the RELATED stat=
e
> > exist?
> >
> > > > However, I'm not sure if it's better to split them up into 2 rules =
:
> > > > iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --st=
ate
> > > > NEW -j ACCEPT
> > > > iptables -A FORWARD -i eth0 -o eth1 -m state --state
> ESTABLISHED,RELATED
> > > > -j ACCEPT
> >
> > Because the destination port of the data channels cannot be port 21,
> > therefore you must use two rules. And because you specify the
> > incoming/outgoing interfaces, you need a third rule for the reply packe=
ts
> > as well.
> >
> > Regards,
> > Jozsef
> > -
> > E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> > PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> > Address : KFKI Research Institute for Particle and Nuclear Physics
> >           H-1525 Budapest 114, POB. 49, Hungary
> >
> >
> >
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

--=-e+yVm/H8wvFFA09ZevEQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99tkVh1fuR/Bv+ygRAhoAAJ42isJhFVyeykLPZ5rERbF1iZoUFgCcDD+m
/qnyjsGyHQsIHYjRJ9li3Qc=
=Qjuy
-----END PGP SIGNATURE-----

--=-e+yVm/H8wvFFA09ZevEQ--


