From: Emanoil Kotsev <emanuel@abc.at>
Subject: iptables 1.2.8 libc6 question
Date: Tue, 15 Jul 2003 22:40:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307152240.47954.emanuel@abc.at>
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

Please help me to find information how to build iptables (1.2.8) for kernel=
=20
2.4.20 on my PC with libc-2.3.1 for another PC where libc-2.2.5 is installe=
d.

I have no problem to compile and install but iptables dies miserably trying=
 to=20
load libc6 which is actually a link to libc-2.2.5 on the target machine.

What should I do?

P.S above this I found quite a lot of documentation telling me how I can=20
compile and install a linux kernel and iptables and aplications based on=20
libiptc but nothing to tell me how I can link iptables to different libc an=
d=20
I don't want to make a mistake ...

Thanks

=2D --=20
//----------------------
||
|| Emanoil Kotsev      =20
||
|| tel. 0043 1 9253175
||
\\--- penguin friendly--
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/FGbMMdng4VCsE9oRAjaXAJ9OM74eOS6HQYua3AaIq3RIghtobACg8LJQ
NfXxplQIsrR+2ahNUw2c6CA=3D
=3D/tyx
=2D----END PGP SIGNATURE-----


