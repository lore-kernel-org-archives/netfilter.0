From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: local forwarding(?)
Date: 17 Jan 2003 13:38:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042803523.485.69.camel@rayw.knowledgefactory.co.za>
References: <200301171115.h0HBFJZC013763@ns.kdtc.net>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-rXWXZYhh0P/e53g+u8Yd"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301171115.h0HBFJZC013763@ns.kdtc.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: cc <cc@ns.kdtc.net>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-rXWXZYhh0P/e53g+u8Yd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-01-17 at 13:15, cc wrote:
> Hi,
>=20
> I finally got the bridge working and so far,=20
> things look ok. =20
>=20
> >From the outside, I can goto the website.  That's
> no problem.  The problem is for local machines
> going to http://www.mydomain.com/, the firewall
> doesn't seem to be redirecting it properly.
> LAN users have to use http://192.168.11.10/ to
> access the website instead of the www.mydomain.com.
>=20
> I understand that the actual ip address skips
> the firewall and goes directly to the machine.
> >From my boss' point of view(totally ignorant
> that 192.168.11.10 =3D www.mydomain.com), he
> doesn't like that.  So I'm hoping that he
> can access (locally) www.mydomain.com.
>=20
> So far my firewall script (the lines pertaining
> to the www port) is as follows:
>=20
> $IPTABLES -t nat -A PREROUTING -p tcp -i eth0 x.x.x.x \
>       --dport 80 -j DNAT --to 192.168.10.11
> $IPTABLES -A FORWARD -p tcp -i eth0 -d 192.168.10.11 \
>       --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp -i eth0 --dport 80 -j DROP
>=20
> (I'm not entirely sure about that last item.  It looks
> strangely invalid...but I could be wrong.  I don't
> even think I should have that there.. am I right?)
Depends on the default POLICY for your FORWARD chain. If the default
policy is to drop, then you don't need it.

>=20
> If all my LAN ips are of the 192.168.10.0 host,=20
> and the web server is 192.168.10.11, how do I
> get the LAN clients to go to www.mydomain.com and
> have the firewall redirect the packets to 192.168.10.11?
>=20
Is the firewall the gateway to the internet for your users?

iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -d
www.mydomain.com -j REDIRECT --to-destination 192.168.10.11:80

That should work (eth0 is your internal interface, right?) ...

Of course you also need the forwarding rules:

iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.11 -j ACCEPT
iptables -A FORWARD -p tcp --sport 80 -s 192.168.1.11 -j ACCEPT

These are very wide open rules. You might want to add the -i and maybe
state checking...

> As you probably can figure out, I'm a little confused.=20
>=20
> Any help appreciated
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

--=-rXWXZYhh0P/e53g+u8Yd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+J+tDh1fuR/Bv+ygRAh6uAKCMsSZdckwrhBeUb5mkt+HoeGOMRwCeNuFl
LBwpgCa5WpmpzNkw5Q82Z/g=
=WdY4
-----END PGP SIGNATURE-----

--=-rXWXZYhh0P/e53g+u8Yd--


