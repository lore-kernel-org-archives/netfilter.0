From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Traffic accounting over ULOG inefficient?
Date: Thu, 10 Jun 2004 20:05:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406102005.20214.arny@ats.s.bawue.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

Since all of the other traffic accounting implementations I have met right =
now=20
are inflexible, I decided to write my own one. There are some=20
implementations, that parse the byte counters displayed by iptables and fee=
d=20
their traffic databases by this output. A dirty hack in my opinion. Somethi=
ng=20
that knows about traffic instantly is just better .. so ULOG is a bit more=
=20
interesting.

The only thing that disturbs me: Just for counting packet lengths queue who=
le=20
packets to userspace? That sounds pretty inefficient to me. Why go to such=
=20
lengths, if the netfilter kernel code itself already has a way of keeping=20
track of packet lengths? Since the computer I intend to use this accounter =
on=20
is connected with a 100Mbit NIC I guess something like that would eat up a=
=20
good chunk of CPU time when there's much traffic to be processed.

I am still inexperienced with kernel programming, I would be grateful for a=
ny=20
pointers or hints on how to achieve this "real time traffic tracking" witho=
ut=20
either having to read out any iptable counters every 10 minutes or queue=20
entire packets to userspace.
Would a small kernel module do the trick?

=2D --=20
Thilo Schulz

My public PGP key is available at http://home.bawue.de/~arny/public_key.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAyKLaZx4hBtWQhl4RArdBAKDhJx2PsIMp9RqtQvKjJGShKWW9GwCeNfZf
MWmMffdTQZYcXNP51NtL5js=3D
=3Dwrkr
=2D----END PGP SIGNATURE-----

