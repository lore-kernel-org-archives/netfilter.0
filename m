From: =?iso-8859-15?Q?Ren=E9?= Pfeiffer <lynx@luchs.at>
Subject: Netfilter rule notation and rule parsers
Date: Mon, 19 Feb 2007 16:25:09 +0100
Message-ID: <20070219152509.GL19622@nightfall.luchs.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9/eUdp+dLtKXvemk"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org


--9/eUdp+dLtKXvemk
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello, Netfilter List!

I have a question regarding the notation of filter rules. I am quite
familiar with the syntax of the iptables command. Apparently most people
who write firewall scripts are familiar with it as well since a lot of
scripts configuring Netfilter rules consist of a shell script and config
scripts. Most people that run a packet filter don't want to delve into
the depths of the iptables syntax in order to change a few rules.

Is anyone on this list aware of projects that try to define a kind of
meta-syntax for filtering rules which can be processed and stored easier
than shell script fragments? Maybe someone has tried to write a parser
in order to import OpenBSD pf or Cisco PIX rules. I'd like to hear about
anyone who has thoughts on this.

I am aware that there are several rule editors out there (such as
FWbuilder). I am more interested in a low-level approach having simple
rules that can be parsed easily and possibly distributed among multiple
firewall systems.

Best wishes,
Ren=E9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -
Got mail delivery problems?  http://web.luchs.at/information/blockedmail.php

--9/eUdp+dLtKXvemk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFF2cFVeMu5lRpXJ7kRAt6uAKCoKxWzSyO/X921V4aM18sKMgBb0ACg3BAM
QxFn1ymMYdAQa/HlQf9gBts=
=5/oF
-----END PGP SIGNATURE-----

--9/eUdp+dLtKXvemk--

