From: Unknown <unknown@unknown.invalid>
Subject: PRE and POST routing ...
Date: 15 Nov 2002 15:49:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037368167.4958.4.camel@rayw.knowledgefactory.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-1Uh1VKZ/5TgJ5QFYQEgS"
Return-path: <netfilter-admin@lists.netfilter.org>
From: Raymond Leach <Ray@work>
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


--=-1Uh1VKZ/5TgJ5QFYQEgS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

If I have a web server in my DMZ, then I have a PREROUTING rule to
redirect incoming traffic to the server, like :
$IPTABLES -t nat -A PREROUTING -i $IFACE_INET -p tcp --dport 80 -d
$IP_INET_WEB1 -j DNAT --to $IP_INT_WEB1

I also have the FORWARDing rules ...

Do I need a POSTROUTING rule in the nat table for return/reply traffic,
or is that automagically handled by nat?

Obviously I have the FORWARD rule to forward the replies from
$IP_INT_WEB1 back to the source.

Ray
--=20

--=-1Uh1VKZ/5TgJ5QFYQEgS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA91Ptmh1fuR/Bv+ygRAhW7AJ9irTlsU4QvwxzS6jhJ6PPJxIUZHwCfctHI
iMPs7QLCXsEzTfWjgWkzuF0=
=JbMJ
-----END PGP SIGNATURE-----

--=-1Uh1VKZ/5TgJ5QFYQEgS--


