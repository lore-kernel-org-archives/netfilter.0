From: Christian Hesse <mail@earthworm.de>
Subject: match all private addresses in one rule
Date: Sun, 20 Feb 2005 15:42:07 +0100
Message-ID: <200502201542.12562.mail@earthworm.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2408325.pcdE49gPej";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
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

--nextPart2408325.pcdE49gPej
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello netfilter folks!

Is there a way to match all private addresses (10.0.0.0/8, 172.16.0.0/12,=20
192.168.0.0/16) in only one rules? I think of something like

$ iptables -A INPUT -s private -j ACCEPT

I've googled for a solution, but couldn't find one yet.

Please cc as I'm not subscribed to the list.
=2D-=20
Regards,
Christian

--nextPart2408325.pcdE49gPej
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.15 (GNU/Linux)

iD8DBQBCGKHElZfG2c8gdSURAgALAKDt4SjKJSuiyGMn2Efn35JqZMNqQACg5X8/
37r11RWD3aezthh/1iGcin0=
=q5ac
-----END PGP SIGNATURE-----

--nextPart2408325.pcdE49gPej--

