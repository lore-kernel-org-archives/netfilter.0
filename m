From: Athanasius <netfilter@miggy.org>
Subject: ECN mangling
Date: Fri, 27 Dec 2002 07:36:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021227073624.GA1878@miggy.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
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
To: Netfilter Users <netfilter@lists.netfilter.org>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
  Having run into problems with /proc/sys/net/ipv4/tcp_ecn being 1 for
Explicit Congestion Notification I first turned it off, and then found
the kernel configuration options for modules to allow me to mangle it
off per iptables rule.

  After some bashing of head against desk I found the syntax that works
to add a rule:

iptables -t mangle -A OUTPUT -o eth1 -p tcp -d IP/32 --match ecn --ecn-ip-e=
ct 0 -j ECN --ecn-tcp-remove

This does indeed cause the appropriate flags to get stripped from the
packet.  Without it I see things like:

07:31:40.610299 80.4.77.247.33917 > 212.250.5.117.80: SWE [tcp sum ok] 3015=
37362:301537362(0) win 5840 <mss 1460,sackOK,timestamp 2075414 0,nop,wscale=
 0> (DF) (ttl 64, id 45892, len 60)

With it I now see:

07:32:02.470307 80.4.77.247.33919 > 212.250.5.117.80: S [bad tcp cksum bf40=
!] 322522142:322522142(0) win 5840 <mss 1460,sackOK,timestamp 2077600 0,nop=
,wscale 0> (DF) (ttl 64, id 65470, len 60)

and the packets never seem to do much.  Of course once I'd added a few
-v's to tcpdump as above I can see the problem "[bad tcp cksum bf40!]".
It would seem that mangling the packet in this way is causing the tcp
checksum to become invalid.

  Is there something additional/different I should be doing in the
rules, or is this just a plain bug in the ECN modules?

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4MAvgACgkQzbc+I5XfxKdVAgCeOp3/pACmLOiheLJ5E+H0vkdf
hDoAoJvY9YKWT9aCfQO4u3zA971AT40q
=ruKR
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--

