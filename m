From: Tabris <tabris@tabris.net>
Subject: ipt_string problems and FAQ
Date: Wed, 27 Aug 2003 13:19:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308271319.29439.tabris@tabris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Description: clearsigned data
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

Ok, i admit to finding a message in the archive that mentioned that we're=20
not supposed to use ipt_string for stopping code red and such (it says=20
there's an FAQ entry for it, which i did not find), so first, I'd like to=20
ask where this FAQ entry is...

second, I've been using ipkungfu to attempt to stop codered, nimda, etc=20
from hitting my apache server and clogging up my logs.

It's not working, the rules never trigger. I've played around with it to=20
no avail.

I guess, if this doesn't work, and isn't supposed to work, what SHOULD I=20
do?

I'm using a kernel 2.4.22-pre series kernel with some patch-o-matic=20
iptables patches. I hope this doesn't end up being another of those=20
stupid questions that never gets answered.

TIA
=2D --
tabris
=2D -
Nietzsche says that we will live the same life, over and over again.
God -- I'll have to sit through the Ice Capades again.
		-- Woody Allen, "Hannah and Her Sisters"
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/TOggtTgrITXtL+8RAiGkAJ49cU4UE+LzbcbS4XNxp+RM+uo3qgCfZQxD
iL/1//ju0Ke+UuJIXkZauZk=3D
=3DmY90
=2D----END PGP SIGNATURE-----


