From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Forcing an RST
Date: Mon, 20 Feb 2006 19:03:35 +0100
Message-ID: <20060220180335.GA24535@zion.homelinux.com>
References: <00dd01c63645$6bb69910$020a0aac@SOUTHWEST>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00dd01c63645$6bb69910$020a0aac@SOUTHWEST>
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
To: James Strickland <jstic04@cp.centennialcollege.ca>
Cc: netfilter@lists.netfilter.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi James,

On Mon, Feb 20, 2006 at 12:45:20PM -0500, James Strickland told us:
> Hi. Is there a way so that when a packet reaches the filter table input
> chain with the Syn flag set, that i send out a response with RST?
>=20
> ie: connections to my wan interface with Syn set (trying to establish) on
> port 80 get a RST response to the sender?

iptables -A INPUT -i <your wan device> -p tcp --dport 80 \
         -j REJECT --reject-with tcp-reset

But this should be not too hard to find in any of the iptables
tutorials out there ;-), e.g.

http://iptables-tutorial.frozentux.net/iptables-tutorial.html


have a nice day ;-)

Sven

--=20
Linux zion.homelinux.com 2.6.16-rc3-mm1_27 #27 Wed Feb 15 17:51:36 CET 2006=
 i686 athlon i386 GNU/Linux
 19:00:44 up 2 days, 23:16,  1 user,  load average: 0.07, 0.14, 0.18

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQFD+gR3o4FAdB2PneQRAgR/AJ9XqGe7mpEnYTnXWqO/JXJg4Jzn8gCfYtRA
FBLG3YfJKsBfLSwYrxD5GUg=
=0eC5
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

