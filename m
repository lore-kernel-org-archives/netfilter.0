From: Javier Marcet <jmarcet@pobox.com>
Subject: [newbie] owner module & --id-owner problem
Date: Wed, 20 Nov 2002 07:47:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021120064754.GB14786@jerry.marcet.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
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


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi folks,
I'm a newbie with iptables. I've reading a few docs, and also the
mailing list archive.
After all is much more straightforward than I thought before I began to
use netfilter.

I need to block certain user(s) access to the net, so that he/she thinks
the internet is down.
I can do this globally without problem, yet with the 'owner' module it
should be pretty easy to achieve what I want since the user will be
using the same machine the iptables rule will be running on (a single
desktop PC). Later on I probably add the time on POM, but at the moment
I only need to block completely the access.

What I was trying to use is:

iptables -A OUTPUT -m owner --uid-owner 1002 -p tcp -j DROP

=66rom what I get

iptables: Invalid argument

If I run it with verbose output, I get:

DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  OWNER UID match 1002
iptables: Invalid argument

What makes me think that it really understood what I told it, though for
some reason it failed.
The modules have been loaded correctly, ATM I have 'ipt_REJECT, ipt_owner,
iptable_filter, ip_tables' in memory.

It probably is something silly, but I cannot find how to make it work.
Any help would be very much appreciated.
Please send a CC to my e-mail address since although I subscribed I have
not received answer from mailman yet (lists.netfilter.org seems somewhat
busy right now).


--=20
Javier Marcet <jmarcet@pobox.com>

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iEYEARECAAYFAj3bMBoACgkQx/ptJkB7frxp9QCeMIYhanZwfca5uElAFB4lrPC4
PxUAnjpcTQCWcLvQUYWj+vfosCGbMTKx
=CzOb
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

