From: Florent AIDE <faide@alphacent.com>
Subject: new ulogd interpreter plugin for localtime
Date: Fri, 7 Jun 2002 18:04:33 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206071804.34315.faide@alphacent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter User List <netfilter@lists.samba.org>
Cc: Christophe de Vienne <cdevienne@alphacent.com>, Ronan =?iso-8859-1?q?Penla=EB?= <rpenlae@alphacent.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Here is the final and working version of ulogd_LOCALTIME.c

This plugin permits to log the localtime at the time we see the packet in=
to=20
the mysql database. It timestamps any packets which goes through ulogd.

I wrote this because I needed to have an oob_time_sec equivalent for the=20
outpout packets.

you just need to add the line:

plugin /usr/local/lib/ulogd/ulogd_LOCALTIME.so

in your ulogd.conf

http://www.alphacent.com/opensource/

on the page (in french) is a link for English Language:
you will find the plugin, the new sql schema, the new Rules.make.in

Any feedback is appreciated.

Florent AIDE
- - --
The magic of our first love is our ignorance that it can ever end.
                -- Benjamin Disraeli
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9ANmSQe8gCED8yYERAlb1AJ9Sin+NcUd4xreUGLkuMNpCGAtmCwCeNSus
QRxeE5MIwAoWet8drO/QJG0=3D
=3DJgmF
-----END PGP SIGNATURE-----


