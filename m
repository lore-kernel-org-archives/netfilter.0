From: Mickael DILY <woksy@ether.net1.nerim.net>
Subject: PREROUTING
Date: Fri, 19 Sep 2003 17:48:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309191748.19695.woksy@ether.net1.nerim.net>
Reply-To: woksy@ether.net1.nerim.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi people :-)
I would like to add the following line to my firewall
iptables -A PREROUTING -t mangle -p tcp --sport ssh -j TOS --set-tos\=20
Minimize-Delay
iptables -A PREROUTING -t mangle -p tcp --sport ftp -j TOS --set-tos\=20
Minimize-Delay
iptables -A PREROUTING -t mangle -p tcp --sport ftp -j TOS --set-tos\=20
Maximize-Throughput

When i do this, nothing tells me if it is good or bad. I presume it is go=
od.=20
But, when i list my iptables, i see nothing in the rule PREROUTING.
I think it is not normal. Where do i bug  ?
Thanks
- --=20
- - M. DILY, administrateur r=E9seau, geek :-)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/ayU9zEzekoYhlpsRAtMqAKCsd2oXEK1CQYRR2bbvu2QCUNqy3QCdGbJ5
zmKvWz9TGTGva7hQgZjdqhY=3D
=3DFfgc
-----END PGP SIGNATURE-----


