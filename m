From: Axel Thimm <Axel.Thimm@ATrpms.net>
Subject: MASQUERADE and udp: connections are *not* forgotten
Date: Sat, 4 Mar 2006 11:25:39 +0100
Message-ID: <20060304102539.GC2052@neu.nirvana>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Return-path: <netfilter-bounces@lists.netfilter.org>
Resent-Message-Id: <200603201358.k2KDwTcE016959@neu.nirvana>
Content-Disposition: inline
Resent-To: netfilter@lists.netfilter.org
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


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I have a strange issue with MASQUERAD'ing openvpn over ppp0 which uses
udp port 1194. When the ppp0 interface goes down and up (issued by the
ISP every 24h to recycle IPs ...), udp packages don't make it past the
netfilter gateway. Using tethereal on the gateway I see the packages
going in, but they don't get SNATted, nor do they got sent out over
ppp0. I also don't get any ICMP errors back or similar.

I checked /proc/net/ip_conntrack, and saw that the connection was
still registred and the timeout would restart every second since the
openvpn daemon on the inner client retried every second. Shutting the
client down for 30 sec to allow the timeout to pass and the connetcion
to vanish from /proc/net/ip_conntrack and restarting openvpn is a
workaround (if one doesn't wait for the connection to vanish and
restarts openvpn before that the problem remains).

It looks like the state of the upd connections is not forgotten as
MASQUERADE implies. This is on Fedora Core 4 on all components which
contains

kernel-2.6.15-1.1831_FC4
iptables-1.3.0-2

(The kernel is 2.6.15.4 based)

Thanks!
--=20
Axel.Thimm at ATrpms.net

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQFECWsjQBVS1GOamfERAuG6AJ446hZdC7IMZ8cTfAvNa70rOUZ3DACfXj2e
dd2KADTCKjB5GkFhGySej8I=
=SZo1
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--

