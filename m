From: Todor Tzankov <tushe@mgu.bg>
Subject: DNAT and broadcast packets
Date: Mon, 3 Nov 2003 16:11:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311031611.30695.tushe@mgu.bg>
Reply-To: tushe@mgu.bg
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi, I want	to know is it possible to DNAT broadcast packets and if yes how.
I'm trying to acomplish that with the following rule:
iptables -t nat -A PREROUTING -m pkttype --pkt-type broadcast -p udp -p=20
$PORT1:$PORT2 -j DNAT --to-destination $SOME_IP
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/pmIPIt5NA2WPMMURArENAJ9swWao6HA0AzJi/O4VuHy35teJEACgn93L
z1kTxZfjixZqfOxx3Z6uxnc=3D
=3DW06q
=2D----END PGP SIGNATURE-----

