From: "Dott. Francesco =?iso-8859-15?q?Chicchiricc=F2?=" <francesco.chicchiricco@eposse.it>
Subject: Virtual interfaces
Date: Mon, 5 Jul 2004 16:42:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407051642.19090.francesco.chicchiricco@eposse.it>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_KjW6AWoJQayqfui";
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
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


--Boundary-02=_KjW6AWoJQayqfui
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
after spending some time with iptables and linux virtual interfaces, I've=20
decided to ask.

I have a Linux BOX acting as a router among different LANs. I'm doing some=
=20
filtering (only ssh traffic coming from a certain MAC addrress can go from=
=20
one LAN to another, an so on):=20

iptables -t filter -P FORWARD DROP
iptables -A FORWARD -i eth0 -s 192.168.0.0/24 -p TCP -m mac --mac-source=20
$whiskey_MAC -d 192.168.10.0/24 --dport 22 -j ACCEPT

With physical interfaces only, all works well. When a try to filter traffic=
=20
between 2 LANs attached to the same physical interface but with 2 different=
=20
virtual IPs, it starts messing. Nothing works, I can't even log packets.

Is that a known bug? Am I just misunderstanding?
Please help.
=2D-=20
##################################################################

"Computer Science is no more about computers than astronomy=20
is about telescopes." (E. W. Dijkstra)

Dott. Francesco Chicchiricc=F2
Amministratore unico
Tel 3290573276

ePOSSE S.r.l.
Sede operativa: Via dei Marrucini, 11 65127 Pescara
Tel / FAX 0854503336
http://www.eposse.it

##################################################################

--Boundary-02=_KjW6AWoJQayqfui
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBA6WjKn8vnUrR1uocRApi5AJ9qIgUUyV5KFqguIbuPTY9PhebRAgCdHhJr
UH6xyzF1Rr0IqL4yIP9CWRw=
=D7w8
-----END PGP SIGNATURE-----

--Boundary-02=_KjW6AWoJQayqfui--

