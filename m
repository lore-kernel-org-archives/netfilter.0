From: "Ivan Rodriguez Aguilar" <ivan@segob.gob.mx>
Subject: two o more NAT  + PREROUTING
Date: 02 Apr 2003 19:03:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049331827.21383.155.camel@parsifal>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-gkXQwpEZYXh7QXZIyZu2"
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
To: netfilter@lists.netfilter.org


--=-gkXQwpEZYXh7QXZIyZu2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


		=09
Hello list one computer of my internal LAN has the ip
10.2.89.250

and i need to reach this ip from the internet=20
ok my security scheme not permit  this
however the first nat  is

iptables -t nat -A PREROUTING -d 148.243.xxx.xxx -p tcp --dport 80 -j
DNAT --to 192.168.0.115


the 192.168.0.115 is the linux box and he knows my internal  lan.

for example=20

telnet 10.2.89.250 80
Trying 10.2.89.250...
Connected to 10.2.89.250.
Escape character is '^]'.
get
HTTP/1.1 400 Bad Request

I get this answer so i try to make the second nat=20
in the linux box near the internal LAN=20

iptables -t nat -A PREROUTING -d 192.168.0.115 -p tcp --dport 80 -j DNAT
--to 10.2.89.250

the ip_contrack logs the follow lines=20
when i try  to connect from internet=20

tcp      6 104 SYN_SENT src=3D132.248.69.34 dst=3D192.168.0.115 sport=3D575=
72
dport=3D80 [UNREPLIED] src=3D10.2.89.250 dst=3D132.248.69.34 sport=3D80
dport=3D57572 use=3D1=20
tcp      6 104 SYN_SENT src=3D132.248.69.34 dst=3D192.168.0.115 sport=3D575=
72
dport=3D80 [UNREPLIED] src=3D10.2.89.250 dst=3D132.248.69.34 sport=3D80
dport=3D57572 use=3D1=20


can somebody help me ??





--=20
Ivan Rodriguez Aguilar <ivan@segob.gob.mx>

--=-gkXQwpEZYXh7QXZIyZu2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+i4hywXwQp+dDlhgRAtQRAJ9/H0Fh5i2h5ytiL0U5uRKMVk06dwCcCS7x
3o2gkW0e77wSIu1+b9pQEWc=
=+WN7
-----END PGP SIGNATURE-----

--=-gkXQwpEZYXh7QXZIyZu2--


