From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Bonding + NAT
Date: 28 Mar 2003 18:15:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048868123.17834.90.camel@raylinux.internal>
References: <20030328145059.2ea1241a.efgonzalez@worldonline.es>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-LrvUH1uK1yd3GCHB+Ue9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030328145059.2ea1241a.efgonzalez@worldonline.es>
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


--=-LrvUH1uK1yd3GCHB+Ue9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Maybe SNAT is not the right solution. Have a look at the ROUTE patch in
the netfilter POM.


On Fri, 2003-03-28 at 15:50, Eduardo Fern=E1ndez Gonz=E1lez wrote:
> Hello.
>=20
> In my university dorm we've got a private net with two subnets: I'll call=
 one of them the servers subnet (10.1.5.0/24) because there are some server=
s (ftp, web, streaming, etc) and a couple of routers: one is a cisco router=
 which provide us with internet access and the other one is a linux system =
which acts as a router between this subnet and the other subnet (10.1.7.0/2=
4), which I'll refer as the students subnet, where there are about 250 host=
s.=20
>=20
> The linux router is doing NAT, and it is a dhcp, ddns and pdc (primary do=
main controller) server too. The traffic between this subnets is very heavy=
 because of the ftp server, so we decided to add two more ethernet cards to=
 the linux router (4 in total) and configure bonding. But only the switches=
 at the students subnet supported bonding, so now we have two cards (eth1 a=
nd eth3) showing the same ip (10.1.7.1) with bonding and the other two card=
s (eth0 and eth2) with two ips (10.1.5.4 and 10.1.5.3). Then, our idea was =
to force the traffic between the subnets to leave the router over eth2, and=
 to make the rest of the traffic leave the router over eth0. At first, I th=
ought the following nat rules were enough to implement this,
>=20
> # iptables -t nat -A POSTROUTING -o eth2 -s 10.1.7.0/24 -d 10.1.5.0/24 -j=
 SNAT --to-source 10.1.5.3
> # iptables -t nat -A POSTROUTING -o eth0 -s 10.1.7.0/24 -d ! 10.1.5.0/24 =
-j SNAT --to-source 10.1.5.4
>=20
> but I was wrong: I was able to ping the internet from the students subnet=
, and the traffic left the router over the right interface, but I was unabl=
e to ping any host at the servers subnet. And the question is, am I wrong? =
Is it possible to implement what I've said via iptables?=20
>=20
> As a quick and dirty hack, we're using iproute2 to make all traffic betwe=
en the students and the ftp leave the router over eth2, but what's bad on i=
proute2 is that you have to specify single hosts, not a whole network like =
10.1.5.0/24. Moreover, you can't use rules of the kind -d ! 10.1.5.0/24, un=
like with iptables. Is iptables the right approach to do this? Am i missing=
 something?
>=20
> Thank you very much in advance,
>=20
> Eduardo Fern=E1ndez
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


--=-LrvUH1uK1yd3GCHB+Ue9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+hHUbh1fuR/Bv+ygRAr8tAJ93PO9VMk3MmmLJTHmXwth+iesQ4QCdGtH2
2Y0s0eG0gZ2KbDPzcMXmoOk=
=HLBC
-----END PGP SIGNATURE-----

--=-LrvUH1uK1yd3GCHB+Ue9--


