From: Julien Motch <julienmotch@skynet.be>
Subject: http trafic redirection problems
Date: 06 Jul 2003 16:51:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057503069.6535.31.camel@pluton.dyns.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-pmOKG9ro8WQEhTF5HWzp"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: mailling list netfilter users <netfilter@lists.netfilter.org>


--=-pmOKG9ro8WQEhTF5HWzp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I am running a small wifi network made of 3 computers :

1) computer A with an internet ip ( ppp0 ) and a private ip (
wlan0/192.168.0.1 .
2) computer B with two private ip ( wlan0/192.168.0.2 and wlan1
192.168.1.1 ) .
3) computer C with  a private ip ( wlan0/192.168.1.2 ) .

I am using two networks because the wifi link quality is too low between
A and C .

The computer A iptables rules are :

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE=20
iptables -A FORWARD -i wlan0 -o ppp0 -j ACCEPT=20

The computer B iptables rules are :
echo 1 > /proc/sys/net/ipv4/ip_forward=20
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE=20
iptables -A FORWARD -i wlan1 -o wlan0 -j ACCEPT

Now I want to redirect all the http trafic from computer A to B.
If I insert the rules `iptables -t nat -A PREROUTING -p tcp --dport 80
-i ppp0 -j DNAT --to 192.168.0.2:80` ,I can not access my web site (with
the public internet ip ) from my network but if  I use my ISP proxy ,I
can .

Any ideas to solve this problem ?

Thanks ,julien .



--=-pmOKG9ro8WQEhTF5HWzp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/CDddEW8msFzBCjwRAsqfAJ4syVbvrlGGHadSsKfEO7V0vC82xACfQnBU
6d2yVH5DI6uvxz0MA7hAmU0=
=PypW
-----END PGP SIGNATURE-----

--=-pmOKG9ro8WQEhTF5HWzp--


