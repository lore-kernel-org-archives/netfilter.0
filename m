From: Chris Barnes <runtimeerror@bigpond.com>
Subject: newbie problem
Date: 17 Feb 2003 18:43:19 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045467799.20801.22.camel@billybob.back2front.homelinux.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-0tZY5p+BdO/u+EsaUW8+"
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
To: Netfilter <netfilter@lists.netfilter.org>


--=-0tZY5p+BdO/u+EsaUW8+
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

hi people i'm new to the list.

anyway, I have a very simple firewall on a web server. I want to deny
access to everything except the web server (port 80)

i have set the poilcy on all chains to drop and i have added a rule to
the input chain which says

iptables -A INPUT -p tcp --sport 80 -j ACCEPT

i've done it like this because the web server has 2 interfaces (eth0 and
eth1) which i would like to have access to the server (eth0 is local
10.3.2.0/24 and eth1 is external)

i also made a rule for output

iptables -A OUTPUT -p tcp -j ACCEPT

the problem is that nothing can get to the web server...the packets are
being dropped...i checked the counters and none of the rules counted any
packets or bytes so the packets are being dropped before the rules.

what am i doing wrong or what is a better way to do this?

thanks heaps for your help.



--=-0tZY5p+BdO/u+EsaUW8+
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UJKXMutcjt77K+ARArYKAJ4yKtMAQfcEsQ/VkAzJaJof+cA5pwCgi7Gz
J5zxydtvhN366XFyRPujbUI=
=5a3N
-----END PGP SIGNATURE-----

--=-0tZY5p+BdO/u+EsaUW8+--


