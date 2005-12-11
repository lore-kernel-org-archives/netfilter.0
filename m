From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: QoS with netfilter
Date: Sun, 11 Dec 2005 14:19:31 +0100
Message-ID: <200512111419.34465.arny@ats.s.bawue.de>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
	<1134288474.8304.4.camel@anduril.intranet.cartel-securite.net>
	<bab495710512110118x7d82bc59l554a45039b75fe23@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2241002.eZnod0g5sD";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bab495710512110118x7d82bc59l554a45039b75fe23@mail.gmail.com>
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

--nextPart2241002.eZnod0g5sD
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 11 December 2005 10:18, Erik wrote:
> I have a lot of answers to this but nobody have responded to what I
> asked.  Please bear with me and help me find out what my problem might
> *actually* be.

Sorry you are right.

> Have anyone actually used this feature in iptables?

Yes.

> No, I do not need this router to handle these packages with *any* QoS.
> Other router handle QoS. In fact a lot of router are updated to handle Qo=
S.

These bits should work nice in theory, but in my experience they offer litt=
le=20
to no improvement.

> a) confirmation that this feature actually is implemented and should
> work with the 2.6.12 kernel (or that it is not!)

It should work, yes.

> b) things to verify like patches etc

No clue.

> c) actual commands to test this

tcpdump -i eth0 -v
=20
prints out the tos field on all packets traversing the interface eth0.

=2D-=20
Thilo Schulz

--nextPart2241002.eZnod0g5sD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDnCdmZx4hBtWQhl4RAg/eAKDIlpDQDE9KCXL10ugykqMaL1rjogCfYzaC
1zecPB/ZegKKFP5wXAt96h4=
=EsYJ
-----END PGP SIGNATURE-----

--nextPart2241002.eZnod0g5sD--

