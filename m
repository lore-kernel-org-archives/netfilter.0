From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables 1.2.8 libc6 question
Date: Tue, 15 Jul 2003 14:03:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E359F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Emanoil Kotsev <emanuel@abc.at>, netfilter@lists.netfilter.org

Cross compiling is not a trivial matter when cross compiling different
systems. Basically unless you are running vanilla x86 with compatible
versions of libc, you will run into hella troubles getting into it.  As
a solution, you will need either the libc from the destination
architecture on the build machine, and point the compiler to build the
program against the other libraries. I have never done this with
iptables, but that is how you would go about it.

-----Original Message-----
From: Emanoil Kotsev [mailto:emanuel@abc.at]=20
Sent: Tuesday, July 15, 2003 1:41 PM
To: netfilter@lists.netfilter.org
Subject: iptables 1.2.8 libc6 question

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Please help me to find information how to build iptables (1.2.8) for
kernel=20
2.4.20 on my PC with libc-2.3.1 for another PC where libc-2.2.5 is
installed.

I have no problem to compile and install but iptables dies miserably
trying to=20
load libc6 which is actually a link to libc-2.2.5 on the target machine.

What should I do?

P.S above this I found quite a lot of documentation telling me how I can

compile and install a linux kernel and iptables and aplications based on

libiptc but nothing to tell me how I can link iptables to different libc
and=20
I don't want to make a mistake ...

Thanks

- --=20
//----------------------
||
|| Emanoil Kotsev      =20
||
|| tel. 0043 1 9253175
||
\\--- penguin friendly--
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/FGbMMdng4VCsE9oRAjaXAJ9OM74eOS6HQYua3AaIq3RIghtobACg8LJQ
NfXxplQIsrR+2ahNUw2c6CA=3D
=3D/tyx
-----END PGP SIGNATURE-----



