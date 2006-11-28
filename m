From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: problems building conntrack w/ uclibc - no output
Date: Tue, 28 Nov 2006 15:14:28 -0800
Message-ID: <200611281514.31756.alan.ezust@presinet.com>
References: <200611221144.00766.alan.ezust@presinet.com>
	<456BA0B8.3050607@netfilter.org>
	<200611280938.23127.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1472701.KluNqegR6m";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611280938.23127.alan.ezust@presinet.com>
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

--nextPart1472701.KluNqegR6m
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

You can ignore my questions about building gdb. I have it on the embedded b=
ox=20
now.
It's still not quite giving me what I want yet, but conntrack is hanging he=
re:

root@PresiNET-99996:/root/ctdebug> gdb
GNU gdb 6.3
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain condition=
s.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i386-pc-linux-gnu".
Using host libthread_db library "/lib/libthread_db.so.1".
Breakpoint 1 at 0x8049df0: file conntrack.c, line 606.

Breakpoint 1, main (argc=3D2, argv=3D0xbfe54f24) at conntrack.c:606
warning: Source file is more recent than executable.

606             unsigned int command =3D 0, options =3D 0;
=46unction "nfnl_listen()" not defined.
=46unction "nfct_get_conntrack()" not defined.
Breakpoint 2 at 0xb7f49b40: file libnetfilter_conntrack.c, line 1082.

Program received signal SIGINT, Interrupt.
0xb7f2dcdc in __socketcall () from /lib/libc.so.0
(gdb) where
#0  0xb7f2dcdc in __socketcall () from /lib/libc.so.0
#1  0xb7f1cd14 in recvmsg () from /lib/libc.so.0
#2  0xb7f4d55b in nfnl_listen () from /usr/local/lib/libnfnetlink.so.1
#3  0xb7f49cca in nfct_event_conntrack (cth=3D0x804db30) at=20
libnetfilter_conntrack.c:1135
#4  0x0804b38c in main (argc=3D2, argv=3D0xbfe54f24) at conntrack.c:1090

Even though I'm building these libs with debugging symbols, gdb is having=20
trouble finding them... I'll post more if I get more info.



On Tuesday 28 November 2006 09:38, Alan Ezust wrote:
> On Monday 27 November 2006 18:36, Pablo Neira Ayuso wrote:
> > Strange. Unfortunately I don't have access to such environment so I
> > would require a considerable amount of time to set it up and I'm
> > currently totally burden in many things. Could you run conntrack inside
> > gdb and try to figure out what it wrong?

--nextPart1472701.KluNqegR6m
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFbMLXsJbtw6GURksRAnqnAKCMNenwuXyf87DARkxxDVwECq+phgCfciR4
Xq/J0jnzpMelJnQq3s8OvEk=
=rsKP
-----END PGP SIGNATURE-----

--nextPart1472701.KluNqegR6m--

