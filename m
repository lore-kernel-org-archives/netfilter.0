From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: 10 Dec 2002 13:32:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039519950.1713.109.camel@rayw.knowledgefactory.co.za>
References: <Pine.LNX.4.33.0212101216060.9625-100000@blackhole.kfki.hu>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-1sUIVk14E9jYddODqtlO"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0212101216060.9625-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: rsterenborg@xs4all.nl, 'Paulo Andre' <pandre@darkstar.nom.za>, 'louie miranda' <lmiranda@chikka.com>, 'netfilter' <netfilter@lists.netfilter.org>


--=-1sUIVk14E9jYddODqtlO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2002-12-10 at 13:22, Jozsef Kadlecsik wrote:
> On 10 Dec 2002, Raymond Leach wrote:
>=20
> > Yes, you do. Port 20 (and/or any other) connections after the control
> > connection are not 'RELATED, ESTABLISHED' to the control connection.
> > They are new connections either from the client to the server or vice
> > versa. You therefore need seperate rules for them.
>=20
> If we are speaking about the data channels of the supported protocols
> (FTP, IRC and all the other protocols from p-o-m), then this is absolutel=
y
> false.
OK, then how does connection tracking work for passive ftp?

>=20
> > Remember connection tracking happens at a pakcet level, i.e all states
> > relate to packets of a connection, not per protocol.
>=20
> In the case of the supported protocols with additional channels, again,
> untrue. Please do no spread false info! Why would then the RELATED state
> exist?
>=20
> > > However, I'm not sure if it's better to split them up into 2 rules :
> > > iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --stat=
e
> > > NEW -j ACCEPT
> > > iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELA=
TED
> > > -j ACCEPT
>=20
> Because the destination port of the data channels cannot be port 21,
> therefore you must use two rules. And because you specify the
> incoming/outgoing interfaces, you need a third rule for the reply packets
> as well.
>=20
> Regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
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

--=-1sUIVk14E9jYddODqtlO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99dDOh1fuR/Bv+ygRAmxNAJ4s5KVrx9Gt1MlpB5hZtV78bNFrYQCggSsW
QAybH29u2xIXSfas+EnHWLI=
=yRmc
-----END PGP SIGNATURE-----

--=-1sUIVk14E9jYddODqtlO--


