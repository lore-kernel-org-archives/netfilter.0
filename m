From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Routing problem...
Date: Tue, 27 Jul 2004 09:23:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040727072329.GV20473@freenet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RUh7Gb6wQL2PrpWP"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


--RUh7Gb6wQL2PrpWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

*************************************************************************
* Do not Cc: me, because I am on THIS list, if I write here             *
* Keine Cc: am mich senden, bin auf DIESER Liste wenn ich hier schreibe *
*************************************************************************

Hello,=20

I have 4 NICs in my Router and with two I have a problem:

eth0	-> public network with Servers
eth1    -> private network with Workstations.

I have following rules:

  ____ ( 'stdin' ) _____________________________________________________
 /
|  iptables -P INPUT ACCEPT
|  iptables -F INPUT=20
|  iptables -P OUTPUT ACCEPT
|  iptables -F OUTPUT=20
|  iptables -P FORWARD DROP
|  iptables -F FORWARD=20
| =20
|  iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

OK, I can SEND packages from my Workstations in eth1=20
to the Servers in eth0

|  iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED=
 -j ACCEPT

Here comes the Packages from the Servers back and=20
I allow to come into my private Network

 \______________________________________________________________________

But if I execute the script, I get:=20

iptables: No chain/target/match by that name

Whats wrong ?
I have compiled Linux with ALL netfilter modules in.

Greetings
Michelle

--=20
Linux-User #280138 with the Linux Counter, http://counter.li.org/=20
Michelle Konzack   Apt. 917                  ICQ #328449886
                   50, rue de Soultz         MSM LinuxMichi
0033/3/88452356    67100 Strasbourg/France   IRC #Debian (irc.icq.com)

--RUh7Gb6wQL2PrpWP
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBBgLxC0FPBMSS+BIRAhcbAKClAApyELptmTfWWPy/r2f9dj5MgQCgrdEa
A8YzBMxFxE0i2xG9HXZUqk8=
=4UE5
-----END PGP SIGNATURE-----

--RUh7Gb6wQL2PrpWP--

