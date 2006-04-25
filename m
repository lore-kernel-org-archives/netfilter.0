From: Stratos Margaritis <stratism@gmail.com>
Subject: Why is this not working???
Date: Tue, 25 Apr 2006 16:14:59 +0300
Message-ID: <200604251615.03991.stratism@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1236331.ZeJ9qaCpEK";
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

--nextPart1236331.ZeJ9qaCpEK
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Can someone help me find out why is this rule does not work?

*filter
:INPUT DROP [1803:271102]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
=2DA INPUT -i lo -j ACCEPT
=2DA INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
=2DA INPUT -p tcp -m tcp --dport 22 -j ACCEPT
=2DA INPUT -p tcp -m tcp --dport 25 -j ACCEPT
=2DA INPUT -p tcp -m tcp --dport 53 -j ACCEPT
=2DA INPUT -p udp -m udp --dport 53 -j ACCEPT
=2DA INPUT -p tcp -m tcp --dport 80 -j ACCEPT
=2DA INPUT -p icmp -j ACCEPT
=2DA INPUT -p tcp -j REJECT --reject-with tcp-reset
=2DA INPUT -p tcp --syn -m limit --limit 5/s -i eth0 -j ACCEPT
=2DA FORWARD -p tcp -i eth0 -s xxx.xxx.xxx.xxx/28 -o eth1 -d yyy.yyy.yyy.yy=
y -j=20
ACCEPT
=2DA FORWARD -j LOG

Where xxx.xxx.xxx.xxx is a real network that should be allowed to contact t=
he=20
server yyy.yyy.yyy.yyy both of which are having real IP's.


=2D-=20
Stratos
stratism@gmail.com

--nextPart1236331.ZeJ9qaCpEK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBETiDX8GO3ry/weE4RAsSjAJ9i4qJJow7teyqyWocbL/WVXoLcSQCgn5Rd
u9jnSknq+w/9qP+aZu49jGA=
=9pm6
-----END PGP SIGNATURE-----

--nextPart1236331.ZeJ9qaCpEK--

