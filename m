From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Gaming Server Woes
Date: 14 Apr 2003 08:32:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050301938.8999.72.camel@raylinux.internal>
References: <se996577.022@michiganfamilyresources.org>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-XkFIfMH/a7OkkEwNwzyP"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se996577.022@michiganfamilyresources.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--=-XkFIfMH/a7OkkEwNwzyP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

I use plain iptables with connection tracking and NAT.

For example:

iptables -t nat -A PREROUTING -i eth0 -d 196.4.160.2 -p udp --dport
27910:28000 -j DNAT --to 192.168.1.2

for a quake2 server.

Ray

On Sun, 2003-04-13 at 19:25, Bret Holbrook wrote:
> Hi all,
>=20
> I purchased a Quad Xeon server to start hosting games over the
> internet.  I've got basic rules in place for surfing the net, etc., but
> opening ports for directx and gaming in general is a real trial.  I
> checked the IPmasq website, but it is horribly outdated.  I'd rather not
> use dmz as I want the server to be mostly an insecure gaming machine
> behind the firewall.
>=20
> Are there any sites out there up to date with regards to specific
> iptables rules to host games through the firewall?  For starters, I'm
> looking for Neverwinter Nights, UT2003, and Counter-strike.  But I would
> like to host just about everything under the sun.
>=20
> What are people doing these days in regards to gaming to effectively
> game through an iptables based firewall?
>=20
> Any help would be greatly appreciated.  Thank You!
>=20
> Bret
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


--=-XkFIfMH/a7OkkEwNwzyP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+mlXyh1fuR/Bv+ygRAtHtAJ4nEuP9u1HI7o1VSv/xk9gma8uodwCginVo
yBUJUO50odmEkbcKYJr9FPQ=
=WERr
-----END PGP SIGNATURE-----

--=-XkFIfMH/a7OkkEwNwzyP--


