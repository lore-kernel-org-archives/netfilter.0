From: Alan Ezust <alan.ezust@presinet.com>
Subject: problems building conntrack w/ uclibc - no output
Date: Wed, 22 Nov 2006 11:43:57 -0800
Message-ID: <200611221144.00766.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1380289.gWvHOil26d";
	protocol="application/pgp-signature"; micalg=pgp-sha1
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
To: netfilter@lists.netfilter.org

--nextPart1380289.gWvHOil26d
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

using libnetfilter_conntrack-0.0.31, libnfnetlink (SVN) and=20
conntrack 1.00beta2.=20

Hi Folks, I was just wondering, if I'm the only one in this boat.=20

I'm trying to build conntrack for a box that runs uclibc, so I am using a=20
scratchbox to build (i386-gcc-3.3.2-uclibc-0.9.26), and I've managed to bui=
ld=20
and insteall each of the three libraries, and they can run without any link=
er=20
errors, but when I am running it on the embedded box, in -e mode,=20
I see no output - when I strace, I see this in the output:

recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000=
002},=20
msg_iov(1)=3D[{"\274\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..=
=2E,=20
8192}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 188
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000=
002},=20
msg_iov(1)=3D[{"\274\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..=
=2E,=20
8192}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 188
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000=
002},=20
msg_iov(1)=3D[{"\274\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..=
=2E,=20
8192}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 188
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000=
004},=20
msg_iov(1)=3D[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..=
=2E,=20
8192}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 164
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000=
004},=20
msg_iov(1)=3D[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..=
=2E,=20
8192}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 164
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000=
004},=20
msg_iov(1)=3D[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..=
=2E,=20
8192}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 164
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000=
004},=20
msg_iov(1)=3D[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..=
=2E,=20
8192}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 164

So it seems conntrack is receiving messages but not printing them out=20
properly. Has anyone else seen this problem? This is a hard problem to sear=
ch=20
for, since there are no error messages.


Any advice?=20



=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart1380289.gWvHOil26d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFZKiAsJbtw6GURksRAruiAJ0fuFHKXp5fKevq4jbu6mnmW51ujQCfWu/5
4GqfNLvZZIyuXMI2UPXyG6Q=
=oZ3u
-----END PGP SIGNATURE-----

--nextPart1380289.gWvHOil26d--

