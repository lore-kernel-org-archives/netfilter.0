From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: dns doctoring
Date: 09 Jan 2003 10:25:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042100739.26551.121.camel@rayw.knowledgefactory.co.za>
References: <FHEJJHLEAGOMBFDMFHNOAEIADKAA.micah@micahabrams.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8C30Kmh/59ukgvevOlvU"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FHEJJHLEAGOMBFDMFHNOAEIADKAA.micah@micahabrams.com>
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


--=-8C30Kmh/59ukgvevOlvU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

There is a feature of most named's these days often called split horizon
DNS. That is what you're looking for.

Ray

On Thu, 2003-01-09 at 10:03, Micah Abrams wrote:
> List --
>=20
> I'm building an iptables firewall to replace my pix 506.  The firewall wi=
ll
> only have two interfaces for now.  My dns server sits outside my firewall=
 on
> the internet and answers queries for both my internal network and the wor=
ld.
> Of course it only contains real world ips.  The pix has an option (called
> alias) that doctors dns request from my internal lan so that the reply
> packet contains the internal ip address instead of the public address giv=
en
> out by my dns server.  This lets the internal machines access internal ho=
sts
> via dns without having to run two dns servers.  For example with followin=
g
> command:
>=20
> alias (inside) 192.168.0.5 245.243.3.5 255.255.255.255
>=20
> all dns queries passing through the pix containing the address 245.243.3.=
5
> are re-written to contain 192.168.0.5.  My question is, is there any way =
to
> do this with iptables?  How is everyone handling this?  I would really li=
ke
> to avoid having two dns servers.  I am very new to iptables so any and al=
l
> help is much appreciated.
>=20
> Thanks
>=20
> ~Micah
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

--=-8C30Kmh/59ukgvevOlvU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+HTIDh1fuR/Bv+ygRAnNXAJwO/agkSCnJbRRzEE9RnlJIAbfDBQCeKyIq
5BQjG1Hwu1uBaeL8efSBdk0=
=X2VG
-----END PGP SIGNATURE-----

--=-8C30Kmh/59ukgvevOlvU--


