From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: dns server
Date: 06 Jun 2002 16:04:38 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023372279.8475.27.camel@billy.demon.nl>
References: <1420507267.20020606152231@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-8v63KhKUjqBdgvTWu6J0"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1420507267.20020606152231@gmx.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: I <netfilter@lists.samba.org>


--=-8v63KhKUjqBdgvTWu6J0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tor, 2002-06-06 kl. 15:22 skrev Corin Langosch:

> im running a dns server here and i'm not sure if the following rule is en=
ough to
> allow dns queries from everywhere:

> $IPTABLES -A INPUT -p udp --destination-port 53 -j ACCEPT

> all other packets are reject or dropped.

It depends what you want to do with it. And what DNS software you're
running. I.e., if it's BIND, you can do more with BIND 9 than you can
with BIND 8, more with BIND 8 than with BIND4.

Many security people might say that if you're running BIND 4 or 8, then
you shouldn't be. Some of them again might say that you should be
running BIND 9.2.

If you want to allow zone transfers or run DNSSEC, or if you allow for
large record details (TXT records etc), the you'd want to allow TCP as
well as UDP.

You might even want to allow state in your rules, in which case you'd
want to allow state in and state out.

For example if you are authoritative for your own zones and if you
(which you should have) have a slave server at some other location that
your own (i.e. your ISP's location), you might want:

# Allow queries from all clients
iptables -A INPUT -i $IFACE0 -p udp -s 0.0/0 --dport 53 -m state \
 --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $IFACE0 -p udp -d 0.0/0 --sport 53 -m state \
 --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i $IFACE0 -p tcp -s 0.0/0 --dport 53 -m state \
 --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $IFACE0 -p tcp -d 0.0/0 --sport 53 -m state \
 --state ESTABLISHED -j ACCEPT

On the other hand, if you're simply running a caching nameserver for
your own site and don't care about state, then you'd maybe like to allow
traffic out again from your machine with -A OUTPUT.


If you have an internal LAN that needs to consult your DNS, then your
rules would again be different.

As I wrote, it all depends what you want to do with the server and what
it's for.

I have BIND 9.2.1 running on this particular Compaq notebook, behind
IPTABLES 1.2.6 and my firewall rules ar *completely* different for those
of a 4 machine 30-zone split DNS behind IPTABLES at my last firm, that I
had to install.=20

Best,

Tony

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-8v63KhKUjqBdgvTWu6J0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/2v299dgUTvnuYERAuxrAJ9FKxY5KI6fFdTByADuOrR5p/Ja3ACfSlna
I334a/ig6E0jZDB6rVglsqk=
=KvXG
-----END PGP SIGNATURE-----

--=-8v63KhKUjqBdgvTWu6J0--


