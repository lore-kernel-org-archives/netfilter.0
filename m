From: Nicolas Mailhot <nicolas.mailhot@laposte.net>
Subject: RE: Transparent proxy setup with apache on the nat gateway
Date: Mon, 05 Jun 2006 11:48:03 +0200
Message-ID: <1149500883.6397.9.camel@rousalka.dyndns.org>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49C73@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-8J7iopUqqrFMZPOTBvWR"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C49C73@knowledge.wizdom.nu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Sietse van Zanen <sietse@wizdom.nu>
Cc: netfilter@lists.netfilter.org


--=-8J7iopUqqrFMZPOTBvWR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le lundi 05 juin 2006 =C3=A0 10:40 +0200, Sietse van Zanen a =C3=A9crit :

Thank you for taking the time to look at my problem !

> I think the error is in your first two rules for the PREROUTING chain
> in the NAT table:

...

> All WEB traffic will only hit the first rule and never the second.

I have traces of many attempts in my rule file - I never used those two
rules together so it's not the problem

> I think you should try something like this.
> Have apache proxy listen on localhost (127.0.0.1) port 8081
> Iptables -t NAT -A PREROUTING -p tcp -i eth0(internal nic) -m
> multiport
> --dports http,https,squid,svn,http-alt,webcache -j REDIRECT --to
> 127.0.0.1:8081

If I use REDIRECT the to is interpreted like --to-port and I see the LAN
system hammer the gateway 127 port :(

If I use
-A PREROUTING -i eth1 -p tcp -m multiport --dports
http,https,squid,svn,http-alt,webcache -j REDIRECT --to-port 8081

the requests are redirected to port 8081 of the lan interface IP
(192.168.1.1, I can live with that) but the result is abysmal :
apache logs=20

"GET / HTTP/1.1" requests instead of
"GET http://www.slashdot.org/ HTTP/1.1" requests

so all sites are served as if the browser asked for the local root
(empty) and the browser only receives blank pages

Regards,

--=20
Nicolas Mailhot

--=-8J7iopUqqrFMZPOTBvWR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iEYEABECAAYFAkSD/dEACgkQI2bVKDsp8g29cQCbBsmGBjhYNk8QRk/xUZGxl24y
dyMAnih9QqyutptHKpeQqtoyKM/d03gr
=+krw
-----END PGP SIGNATURE-----

--=-8J7iopUqqrFMZPOTBvWR--


