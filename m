From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: MSN and Yahoo Block through IPTABLES
Date: 26 Jun 2003 10:36:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056616575.1782.40.camel@raylinux.internal>
References: <010a01c33b03$d78da1f0$5505a8c0@asimejaz>
	 <1056613248.1894.18.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-sszWflbB3b/gfxZIBEo1"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1056613248.1894.18.camel@alpha.newkirk.us>
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


--=-sszWflbB3b/gfxZIBEo1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-06-26 at 09:40, Joel Newkirk wrote:
> On Wed, 2003-06-25 at 06:23, Asim Ejaz Butt wrote:
> > Hello Gurus,
>=20
> As David Busby pointed out, you are probably better off with DROP
> policies, and ACCEPT only desired/required traffic.
>=20
> > I am trying to block MSN and Yahoo Instant Messengers with my LAN using
> > IPTABLES. Following commands are used to block them but unsuccessful.
> >=20
> >  /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 --dport 1863 -j REJEC=
T
> >  /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 -d 64.4.0.0/18 -j REJ=
ECT
>=20
> DROP port 1863 should be sufficient to prevent MSN clients from logging
> on to MSN messenger, IIRC.  (My only use of MSN is with Gaim under
> Linux, and 1863 is the only port I need to open for it to connect)
>=20
The MSN messenger that comes with XP tries to be clever and 'probes'
your network looking for ways out using SDLP (AFAIR) to try and
autoconfigure itself. As a last resort it will try and tunnel the MSN
traffic through http.

> >  /sbin/iptables -A FORWARD -d cs.yahoo.com -j REJECT
> >  /sbin/iptables -A FORWARD -d scsa.yahoo.com -j REJECT
>=20
> Apparently the only way to stop YIM is to block all connections to the
> servers.  The trick here is that there are quite a few more yahoo IM
> servers than these two rules cover...
>=20
> /sbin/iptables -A FORWARD -d 63.216.136.22     -j DROP
> /sbin/iptables -A FORWARD -d 66.135.224.142    -j DROP
> /sbin/iptables -A FORWARD -d 66.136.175.132    -j DROP
> /sbin/iptables -A FORWARD -d 66.163.168.105    -j DROP
> /sbin/iptables -A FORWARD -d 66.163.172.117    -j DROP
> /sbin/iptables -A FORWARD -d 66.163.173.76     -j DROP
> /sbin/iptables -A FORWARD -d 66.163.173.77     -j DROP
> /sbin/iptables -A FORWARD -d 66.163.173.78     -j DROP
> /sbin/iptables -A FORWARD -d 66.163.173.203    -j DROP
> /sbin/iptables -A FORWARD -d 66.163.175.128    -j DROP
> /sbin/iptables -A FORWARD -d 66.163.178.78     -j DROP
> /sbin/iptables -A FORWARD -d 204.71.200.36     -j DROP
> /sbin/iptables -A FORWARD -d 204.71.200.37     -j DROP
> /sbin/iptables -A FORWARD -d 204.71.201.134    -j DROP
> /sbin/iptables -A FORWARD -d 204.71.201.141    -j DROP
> /sbin/iptables -A FORWARD -d 216.136.173.172   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.173.179   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.175.132   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.175.142   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.175.143   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.175.144   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.175.145   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.175.145   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.175.226   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.224.134   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.224.142   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.224.213   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.224.213   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.224.214   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.225.12    -j DROP
> /sbin/iptables -A FORWARD -d 216.136.226.117   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.226.118   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.226.209   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.226.210   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.227.168   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.129   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.130   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.131   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.133   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.135   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.148   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.151   -j DROP
> /sbin/iptables -A FORWARD -d 216.136.233.152   -j DROP
>=20
> BTW, the two FQDNs you have are NOT (fully) represented in this list, I
> don't know if they need to be or not.  Be aware that scsa.yahoo.com
> actually maps to 8 IPs, so using it the way you do in your rule will NOT
> actually catch all of them.  "dig scsa.yahoo.com" yields:
>=20
> scsa.yahoo.com.         1800    IN      CNAME   scs.yahoo.com.
> scs.yahoo.com.          1800    IN      CNAME   scs-fooe.yahoo.com.
> scs-fooe.yahoo.com.     617     IN      A       216.136.233.138
> scs-fooe.yahoo.com.     617     IN      A       216.136.233.148
> scs-fooe.yahoo.com.     617     IN      A       216.136.233.152
> scs-fooe.yahoo.com.     617     IN      A       216.136.226.208
> scs-fooe.yahoo.com.     617     IN      A       216.136.233.133
> scs-fooe.yahoo.com.     617     IN      A       216.136.233.134
> scs-fooe.yahoo.com.     617     IN      A       216.136.233.135
> scs-fooe.yahoo.com.     617     IN      A       216.136.233.137
>=20
>=20
>=20
> > Anyone help in blocking them through IPTABLES.
> >=20
> > Asim Ejaz Butt
> asim.butt@streaming-networks.com
>=20
> j
>=20
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-sszWflbB3b/gfxZIBEo1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA++rB/h1fuR/Bv+ygRAtPRAJ966JKXEd69s4kEIJ3d48oLKbl+igCggSXa
AVC31pC8Ps/AO/GKlOq1fLQ=
=WToN
-----END PGP SIGNATURE-----

--=-sszWflbB3b/gfxZIBEo1--


