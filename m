From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Iptables Forwarding Vnc Connection
Date: 17 Feb 2003 10:58:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045472289.18829.20.camel@rayw.knowledgefactory.co.za>
References: <3E4D7BE7.6010008@cogeco.ca>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HpehKUSuoeVjF0g6iO88"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E4D7BE7.6010008@cogeco.ca>
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


--=-HpehKUSuoeVjF0g6iO88
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-02-15 at 01:29, Nathanael Morrison wrote:
> Hi,
>=20
> I currently have several computers behind a linux gateway, one of which=20
> is my personal computer. I often want to access my desktop from campus=20
> using KDE's remote desktop feature. At the moment I forward any=20
> connections to port 5900 to my pc. This works but then I thought,=20
> wouldn't it be nice if I could to this securely with an ssh tunnel=20
> Correct me if I'm wrong but, I think the connection gets tunneled=20
> through ssh, and a connection is made locally (on the gateway) to port=20
> 5900. Using iptables, is there a way to forward a locally generated=20
> connection to another computer?
>=20
Yes, you use PREROUTING and DNAT.

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 22 -s 192.168.0.1
-j DNAT --to 192.168.0.100:5900

Replace ips and ports as needed ...

You possibly need a FORWARD rule to forward the traffic once the
destination ip has changed.

> Your help would be greatly appreciated,
>=20
> Nathanael Morrison
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

--=-HpehKUSuoeVjF0g6iO88
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UKQgh1fuR/Bv+ygRAgu1AJ9IQy9xTbM4ZutJuqMgg4ka9R57BACeMw/n
egC13YPUJ5p1hqjLLMEWveY=
=FhIF
-----END PGP SIGNATURE-----

--=-HpehKUSuoeVjF0g6iO88--


