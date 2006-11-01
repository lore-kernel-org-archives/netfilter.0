From: Alan Ezust <alan.ezust@presinet.com>
Subject: conntrack -E -i not allowed?
Date: Wed, 1 Nov 2006 10:43:49 -0800
Message-ID: <200611011043.53370.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3811157.igghJE88Cc";
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

--nextPart3811157.igghJE88Cc
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'm trying to get conntrack -E to show me events, with conntrack IDs.
At the moment, the ctid is now showing up in the output unless there is an=
=20
[UNREPLIED] part to the line.

$ conntrack -E -i
conntrack v1.00beta2: Illegal option `-i' with this command


   [NEW] udp      17 30 src=3D10.10.100.100 dst=3D204.174.64.1 sport=3D4536=
 dport=3D53=20
packets=3D1 bytes=3D67 [UNREPLIED] src=3D204.174.64.1 dst=3D10.10.100.100 s=
port=3D53=20
dport=3D4536 packets=3D0 bytes=3D0

Is there a trick to getting the ctids to be sent to the output of this?

conntrack -L -i seems to work, showing me the id. Personally, I think=20
conntrack should always output the id.



--nextPart3811157.igghJE88Cc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFSOrpsJbtw6GURksRAvjyAJ4l2kqv8B1bbRsl/wXSR75UyeM+rQCZAYen
OMjqBm53CMrekygS0hN557M=
=rpyC
-----END PGP SIGNATURE-----

--nextPart3811157.igghJE88Cc--

