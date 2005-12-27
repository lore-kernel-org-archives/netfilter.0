From: DEXTER <dexter@fiktiv.szgtikol.kando.hu>
Subject: largescale NAT
Date: Tue, 27 Dec 2005 17:22:47 +0100
Message-ID: <43B16A57.508@fiktiv.szgtikol.kando.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: 'netfilter' <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Okay. As nobody answered my question - except one in private - i'll try
to rephrase it.

So.. there is a dormitory about 400+ students in it. They are always
like to play games on net, and when one starts something like GameSpy it
connects to a whole bunch of servers on all kinds of ports, and it is
just ONE user, and not to mention other p2p programs like DC, Emule,
Bittorrent, etc. Than you can imagine what happens when 100 or more
users want to play online at the same time -> it eats up lots of port on
the NAT box (all of the ports).

and this is where the problem lies.

The documenation on NAT is great
(http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.html) but it is
good when you have only few machines, or lots of machines but not with
gamers, downloaders....
Why isn't there any documentation on how linux handles free, and
occupied ports on a NAT box, how to fine tune the box when lots of user
are behind it, etc..?

So my question is: How to handle this situation? I mean, just 1 NAT
linux box is able to handle all the 400+ users with the above
situations? Or we have to do something like CONNLIMIT on source ips? Is
there possibilities to balance the traffic on 2 or more NAT box?

thx.

- --
You can find my public PGP key here:
Tu peux trouver mon public PGP clef ici:
A nyilvanos PGP kulcsomat innen tudod letolteni:

http://koli.kando.hu/dexter/publickey.asc
http://pgp.mit.edu:11371/pks/lookup?op=get&search=0xBC788404

.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFDsWpXd/8YWbx4hAQRAjxgAJ9Zw/hBW2NBYU2D4HXhKHfWMDvOAgCgocEs
CDrM5sU1HYUeBmrNgyhNHGQ=
=9w4i
-----END PGP SIGNATURE-----

