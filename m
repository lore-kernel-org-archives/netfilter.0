From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: traffic graphing?
Date: Sat, 21 Aug 2004 01:14:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408210114.45320.arny@ats.s.bawue.de>
References: <41267935.2040008@leaplab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41267935.2040008@leaplab.com>
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
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Saturday 21 August 2004 00:20, Dave Barnum wrote:
> What would you guys suggest for a good traffic monitoring/graphing
> sollution for a iptables (shorewall) firewall?

You could try out my new solution, that's up at sourceforge now and now doi=
ng=20
it's job quite well, but needs MySQL as a database.
Have a look at:
http://sourceforge.net/projects/ltaccts/

It will not destroy your current firewall configuration, but create rules=20
solely intended for logging, use ULOG for collecting traffic statistics. Yo=
u=20
can define your own categories and browse through the logs using a web=20
interface.

=2D --=20
Thilo Schulz

My public PGP key is available at http://home.bawue.de/~arny/public_key.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBJoXfZx4hBtWQhl4RAjC/AJ9dlVQ31p4DIW+WSS4b+l53ATJsBQCgk4oS
=46stTAyxAWRwCk7O8VS7U9Sc=3D
=3DboMJ
=2D----END PGP SIGNATURE-----

