From: Emanoil Kotsev <emanuel@abc.at>
Subject: question: how to compile iptables for different libc version?
Date: Sun, 13 Jul 2003 15:53:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307131553.27946.emanuel@abc.at>
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

Time ago I asked how could I compile  iptables linked to different libc

The situation:
I have to compile a kernel with iptables on machine A that uses libc-2.3.1.=
so=20
for machine B using libc-2.2.5.so
iptables needs to be linked to libc6.so -> libc-2.2.5.so=20
what should I do to link iptables the right way?
=2D ---
In addition
on Mach.B I can just copy the compiled stuff and hope it'll run, so there i=
s=20
no way to do anything on this machine exept copying.
but I can export via nfs anything to machine A
kernel 2.4.20
iptables 1.2.8

Thanks for any ideas

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

iD8DBQE/EWRVMdng4VCsE9oRAoDbAKDCDsC1eRkYca49l3RFxxUgrXrOMACdG1lx
PlyANOl0PX4GQzx9IMR/9yU=3D
=3DWRW2
=2D----END PGP SIGNATURE-----


