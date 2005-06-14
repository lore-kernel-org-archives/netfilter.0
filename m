From: Michael Weinert <weinert@sys2.de>
Subject: Re: Script review please
Date: Tue, 14 Jun 2005 23:28:33 +0200
Message-ID: <200506142328.40100.weinert@sys2.de>
References: <200506142212.51869.ghenry@suretecsystems.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1446794.dut6KjOzOD";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506142212.51869.ghenry@suretecsystems.com>
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

--nextPart1446794.dut6KjOzOD
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Dienstag, 14. Juni 2005 23:12 schrieb Gavin Henry:

Sorry, but your script is horrible....

My advice is to split up the rules like this:

iptables -P DROP
iptables -A INPUT -i eth0 -s <lan-net> -j from_lan
iptables -A INPUT -i ppp0 -j from_inet
iptables -A INPUT -i ipsec0 -j from_vpn
iptables -A INPUT -j LOG=20

iptables -N from_lan
iptables -A from_lan -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A from_lan -p tcp --dport 80 -j ACCEPT

this is only a simple start. Hope you get the point. Same for the output
an forwarding-rules.

Michael.

> May I run the following past you to see if I have any stupid errors or if
> you have some good advice?
>
> Thanks again.

=2D-=20

          SysQuadrat    Systeme mit Sicherheit
    Michael Weinert Stuttgart Filderstadt-Plattenhardt
  Tel.: 0711-9970288 Fax: 5360559 Mobil: 0170-4141273
   http://www.linux-firewall.de  weinert@sys2.de
           KeyServer hkp://pgp.mit.edu

--nextPart1446794.dut6KjOzOD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQGlAwUAQq9MCKvpi4/XslceAQIrHwyA7esFzkUc0iL9veLPDFMSN45TxnBh+87d
MICKFMEo3skdSpVhcxdZT7zont1mOZR0bgS6ecvAwOJe5k2lY8Yk+qRCXAYBu2uv
qx4oMHitg0kAm3MC5WGciB4s/MSit0hwncvEb5s+c6M5uySYsIdBg2gLZMNNoBo5
E3hHcb+RwW0Es201qTShMJUWyAIdgCQVielNOcU9/Oa0KLE9OKaElqAoe5Q5Ckd5
9hJPJi6NVaonZz8Q2pKrDPM5Uj/XWmWHVVD12XeSw3H4+3fdTc05mja73l2t4D6A
MbeVQMzDlKLgwgzmqGmAJ8JBlLd7q4JokJIuH32LA0xyicUj9aGqPQ1+dnzrQ5Gf
eBl6Y2qgmDz9kv5MAPpi1tbRE2zm6IsrezwCL/U9pH18fcA2V/ED/Ak8YMQKBoag
9JuL1PAbtJnOixpgESnGLAobLoh8zmaDWLxbhXQ1y4YWftbWQctZbG6PXnBCsnJw
Q94CF0zcO2xeak3HzHWEFY5LsGObQL5d0wSATA7/hx5NZ2ZG9u5vuA==
=FJ0q
-----END PGP SIGNATURE-----

--nextPart1446794.dut6KjOzOD--

